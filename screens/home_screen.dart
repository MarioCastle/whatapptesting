import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bbking/widgets/data_table_section.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_io/io.dart';
import '../models/message_status.dart';
import '../widgets/data_input_section.dart';
import '../widgets/message_template_section.dart';
import '../widgets/delay_settings_section.dart';
import '../widgets/start_stop_button.dart';
import '../widgets/progress_summary.dart';
// import '../widgets/scan_qr/qr_scanner_button.dart';
import 'package:flutter/foundation.dart'; // Add this line
import '../widgets/delete_row_handler.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<List<String>> data = [];
  final TextEditingController manualInput = TextEditingController();
  final TextEditingController partC =
      TextEditingController(text: 'Hi, may I know your ');
  final TextEditingController partD =
      TextEditingController(text: ' still available?');
  final TextEditingController minDelay = TextEditingController(text: '30');
  final TextEditingController maxDelay = TextEditingController(text: '70');
  List<MessageStatus> statusList = [];
  bool isSending = false;
  bool cancelSending = false;
  final Set<String> sentContacts = <String>{};
  bool _isExpanded = true;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  final TextEditingController startFromController =
      TextEditingController(text: '0');
  String _currentFilter = 'total';

  void _handleFilterChanged(String filter) {
    // Add this function
    setState(() {
      _currentFilter = filter;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void addManualEntry() {
    final input = manualInput.text.trim();
    if (input.isNotEmpty) {
      final entries = input
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
      _processEntries(entries);
    }
  }

  void _processEntries(List<String> entries) {
    final newData = <List<String>>[];
    for (var i = 0; i < entries.length; i += 2) {
      if (i + 1 < entries.length) {
        newData.add([entries[i], entries[i + 1]]);
      }
    }

    setState(() {
      data.addAll(
          newData.where((row) => row[0].isNotEmpty && row[1].isNotEmpty));
      manualInput.clear();
      _checkDuplicates();
    });
  }

  void _checkDuplicates() {
    final allContacts = data.map((row) => row[1]).toList();

    setState(() {
      statusList = data.asMap().entries.map((entry) {
        final index = entry.key;
        final contact = entry.value[1];
        final isDuplicate = sentContacts.contains(contact) ||
            allContacts.indexOf(contact) != index;

        return MessageStatus(
          contact,
          sentContacts.contains(contact),
          isDuplicate: isDuplicate,
          error: statusList.isNotEmpty ? statusList[index].error : false,
        );
      }).toList();
    });
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      try {
        parseCsv(utf8.decode(file.bytes!));
      } catch (e) {
        _showErrorDialog('File Error', 'Failed to parse file: ${e.toString()}');
      }
    }
  }

  void parseCsv(String csvString) {
    try {
      final csvData = const CsvToListConverter().convert(csvString);
      final filteredData = csvData
          .where((row) =>
              row.length >= 2 &&
              row[0].toString().trim().isNotEmpty &&
              row[1].toString().trim().isNotEmpty)
          .toList();

      processData(filteredData);
      _checkDuplicates();
    } catch (e) {
      _showErrorDialog('CSV Error', 'Invalid CSV format: ${e.toString()}');
    }
  }

  void processData(List<List<dynamic>> rawData) {
    setState(() {
      data = rawData
          .map((row) => [row[0].toString().trim(), row[1].toString().trim()])
          .toList();
    });
  }

  Future<void> startSending() async {
    setState(() {
      isSending = true;
      cancelSending = false;
      if (statusList.length != data.length) {
        statusList = data.map((row) {
          final contact = row[1];
          return MessageStatus(
            contact,
            sentContacts.contains(contact),
            isDuplicate: sentContacts.contains(contact),
          );
        }).toList();
      }
    });

    final random = Random();
    final min = int.tryParse(minDelay.text) ?? 30;
    final max = int.tryParse(maxDelay.text) ?? 70;
    final startIndex =
        (int.tryParse(startFromController.text) ?? 0).clamp(0, data.length - 1);

    for (int i = startIndex; i < data.length; i++) {
      if (cancelSending) break;
      final contact = data[i][1];
      if (sentContacts.contains(contact)) continue;

      if (!RegExp(r'^(\+44|601)\d+$').hasMatch(contact)) {
        setState(
            () => statusList[i] = MessageStatus(contact, false, error: true));
        continue;
      }

      try {
        final message = '${partC.text}${data[i][0]}${partD.text}';
        final success = await sendWhatsApp(contact, message);

        setState(() {
          if (success) {
            sentContacts.add(contact);
            statusList[i] = MessageStatus(contact, true);
          } else {
            statusList[i] = MessageStatus(contact, false, error: true);
          }
        });

        if (!cancelSending && i < data.length - 1) {
          final delaySeconds = min + random.nextInt(max - min);
          for (int s = 0; s < delaySeconds; s++) {
            if (cancelSending) break;
            await Future.delayed(const Duration(seconds: 1));
          }
        }
      } catch (e) {
        setState(
            () => statusList[i] = MessageStatus(contact, false, error: true));
      }
    }
    setState(() => isSending = false);
  }

  void _stopSending() {
    setState(() {
      cancelSending = true;
      isSending = false;
    });
  }

  Future<bool> sendWhatsApp(String phone, String message) async {
    try {
      final url = Uri.parse(
          "https://wa.me/$phone?text=${Uri.encodeComponent(message)}");

      if (kIsWeb) {
        await launchUrl(url, webOnlyWindowName: '_blank');
      } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(url, mode: LaunchMode.platformDefault);
      }

      await Future.delayed(const Duration(seconds: 2));
      return true;
    } catch (e) {
      if (kDebugMode) debugPrint('Error: $e');
      return false;
    }
  }

  void clearAllData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Data?'),
        content: const Text('This will remove all contacts and history.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                data.clear();
                statusList.clear();
                sentContacts.clear();
              });
              Navigator.pop(context);
            },
            child: const Text('Clear All',
                style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Bulk_v 1(HKS)'),
        centerTitle: true,
        actions: [
          Switch(
            value: widget.isDarkMode,
            onChanged: (value) => widget.toggleTheme(),
          ),
          IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.arrow_menu,
              progress: _expandAnimation,
            ),
            onPressed: _toggleExpansion,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizeTransition(
              sizeFactor: _expandAnimation,
              axisAlignment: 1.0,
              child: FadeTransition(
                opacity: _expandAnimation,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DataInputSection(
                          manualInput: manualInput,
                          onAddEntry: addManualEntry,
                          onPickFile: pickFile,
                          onClearData: data.isNotEmpty ? clearAllData : null,
                        ),
                        MessageTemplateSection(
                          partC: partC,
                          partD: partD,
                        ),
                        DelaySettingsSection(
                          minDelay: minDelay,
                          maxDelay: maxDelay,
                          startFromController: startFromController,
                        ),
                        //const QRScannerButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            StartStopButton(
              isSending: isSending,
              hasData: data.isNotEmpty,
              onPressed: isSending ? _stopSending : startSending,
            ),
            const SizedBox(height: 25),
            ProgressSummary(
              total: data.length,
              success: statusList.where((s) => s.done).length,
              failed: statusList.where((s) => s.error).length,
              duplicates: statusList.where((s) => s.isDuplicate).length,
              onFilterChanged: _handleFilterChanged,
            ),
            Expanded(
              child: DataTableSectionWidget(
                data: data,
                statusList: statusList,
                filter: _currentFilter,
                onDeleteRow: (index) => handleDeleteRow(index, data, statusList,
                    setState), // Use the imported handler
              ),
            ),
            // ...
          ],
        ),
      ),
    );
  }
}
