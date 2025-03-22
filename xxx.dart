// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:csv/csv.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:universal_io/io.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isDarkMode = true;

//   @override
//   Widget build(BuildContext context) {
//     //return PopupHandler(
//     return MaterialApp(
//       title: 'IQI Property',
//       debugShowCheckedModeBanner: false,
//       theme: _isDarkMode
//           ? ThemeData.dark().copyWith(
//               colorScheme: ColorScheme.dark(
//                 primary: const Color(0xFF222831),
//                 secondary: const Color(0xFF393E46),
//                 tertiary: Colors.deepPurpleAccent,
//                 surface: const Color(0xFF181818),
//               ),
//               scaffoldBackgroundColor: const Color(0xFF181818),
//               appBarTheme: const AppBarTheme(
//                 backgroundColor: Color(0xFF222831),
//                 elevation: 2,
//                 titleTextStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'RobotoMono',
//                 ),
//                 iconTheme: IconThemeData(color: Colors.white),
//               ),
//               cardTheme: CardTheme(
//                 color: const Color(0xFF393E46),
//                 elevation: 6,
//                 shadowColor: Colors.black87,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               elevatedButtonTheme: ElevatedButtonThemeData(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurpleAccent,
//                   foregroundColor: Colors.white,
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 35,
//                     vertical: 20,
//                   ),
//                   textStyle: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                     fontFamily: 'RobotoMono',
//                   ),
//                 ),
//               ),
//               inputDecorationTheme: InputDecorationTheme(
//                 filled: true,
//                 fillColor: const Color(0xFF222831),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.deepPurpleAccent,
//                     width: 3.0,
//                   ),
//                 ),
//                 labelStyle: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 hintStyle: TextStyle(color: Colors.grey[600]),
//                 floatingLabelStyle: const TextStyle(
//                   color: Colors.deepPurpleAccent,
//                 ),
//               ),
//               dataTableTheme: DataTableThemeData(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: const Color(0xFF393E46),
//                 ),
//                 headingRowColor: WidgetStateProperty.resolveWith(
//                   (states) => const Color(0xFF222831),
//                 ),
//                 headingTextStyle: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 dataTextStyle: const TextStyle(color: Colors.white),
//                 dividerThickness: 1.0,
//                 horizontalMargin: 20,
//                 columnSpacing: 30,
//               ),
//               dialogTheme: DialogTheme(
//                 backgroundColor: const Color(0xFF393E46),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 titleTextStyle: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 contentTextStyle: const TextStyle(color: Colors.white),
//               ),
//               textButtonTheme: TextButtonThemeData(
//                 style: TextButton.styleFrom(
//                   foregroundColor: Colors.deepPurpleAccent,
//                 ),
//               ),
//               iconTheme: const IconThemeData(color: Colors.white),
//             )
//           : ThemeData.light().copyWith(
//               colorScheme: ColorScheme.light(
//                 primary: Colors.grey[100]!,
//                 secondary: Colors.white,
//                 tertiary: Colors.deepPurpleAccent,
//                 surface: Colors.grey[50]!,
//               ),
//               scaffoldBackgroundColor: Colors.grey[50],
//               appBarTheme: AppBarTheme(
//                 backgroundColor: Colors.grey[100],
//                 elevation: 0,
//                 titleTextStyle: const TextStyle(
//                   color: Colors.black87,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 iconTheme: const IconThemeData(color: Colors.black87),
//               ),
//               cardTheme: CardTheme(
//                 color: Colors.white,
//                 elevation: 2,
//                 shadowColor: Colors.grey.shade300,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               elevatedButtonTheme: ElevatedButtonThemeData(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   foregroundColor: Colors.white,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 30,
//                     vertical: 16,
//                   ),
//                   textStyle: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               inputDecorationTheme: InputDecorationTheme(
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide.none,
//                 ),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.blueAccent,
//                     width: 2.0,
//                   ),
//                 ),
//                 labelStyle: const TextStyle(color: Colors.black87),
//                 hintStyle: TextStyle(color: Colors.grey[500]),
//                 floatingLabelStyle: const TextStyle(color: Colors.blueAccent),
//               ),
//               dataTableTheme: DataTableThemeData(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.white,
//                 ),
//                 headingRowColor: WidgetStateProperty.resolveWith(
//                   (states) => Colors.grey[200],
//                 ),
//                 headingTextStyle: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//                 dataTextStyle: const TextStyle(color: Colors.black87),
//                 dividerThickness: 0.8,
//                 horizontalMargin: 16,
//                 columnSpacing: 24,
//               ),
//               dialogTheme: DialogTheme(
//                 backgroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 titleTextStyle: const TextStyle(
//                   color: Colors.black87,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 contentTextStyle: const TextStyle(color: Colors.black87),
//               ),
//               textButtonTheme: TextButtonThemeData(
//                 style: TextButton.styleFrom(
//                   foregroundColor: Colors.blueAccent,
//                 ),
//               ),
//               iconTheme: const IconThemeData(color: Colors.black87),
//             ),
//       home: HomeScreen(isDarkMode: _isDarkMode, toggleTheme: _toggleTheme),
//     );
//   }

//   void _toggleTheme() {
//     setState(() {
//       _isDarkMode = !_isDarkMode;
//     });
//   }
// }

// class HomeScreen extends StatefulWidget {
//   final bool isDarkMode;
//   final VoidCallback toggleTheme;

//   const HomeScreen({
//     super.key,
//     required this.isDarkMode,
//     required this.toggleTheme,
//   });

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   List<List<String>> data = [];
//   final TextEditingController manualInput = TextEditingController();
//   final TextEditingController partC = TextEditingController(
//     text: 'Hi, may I know your ',
//   );
//   final TextEditingController partD = TextEditingController(
//     text: ' still available?',
//   );
//   final TextEditingController minDelay = TextEditingController(text: '30');
//   final TextEditingController maxDelay = TextEditingController(text: '70');
//   List<MessageStatus> statusList = [];
//   bool isSending = false;
//   bool cancelSending = false;
//   final Set<String> sentContacts = <String>{};
//   bool _isExpanded = true;
//   late AnimationController _animationController;
//   late Animation<double> _expandAnimation;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   final TextEditingController startFromController =
//       TextEditingController(text: '0');

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _expandAnimation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   // ▼▼▼ ADD NEW METHODS HERE ▼▼▼ (typically before build method)
//   Widget _buildProgressSummary() {
//     final total = data.length;

//     // The counts will update whenever setState() is called
//     final success = statusList.where((s) => s.done).length;
//     final failed = statusList.where((s) => s.error).length;
//     final duplicates = statusList.where((s) => s.isDuplicate).length;

//     return Column(
//       children: [
//         Row(
//           children: [
//             _buildStatCard(
//               title: 'Total',
//               count: total,
//               icon: Icons.format_list_numbered,
//               color: Colors.blue.shade100, // Different background for Total
//               textColor: Colors.blue.shade800,
//             ),
//             _buildStatCard(
//               title: 'Success',
//               count: success,
//               icon: Icons.check_circle,
//               color: Colors.green.shade50,
//               textColor: Colors.green.shade800,
//             ),
//             _buildStatCard(
//               title: 'Failed',
//               count: failed,
//               icon: Icons.error,
//               color: Colors.red.shade50,
//               textColor: Colors.red.shade800,
//             ),
//             _buildStatCard(
//               title: 'Dup x2',
//               count: duplicates,
//               icon: Icons.content_copy,
//               color: Colors.orange.shade50,
//               textColor: Colors.orange.shade800,
//             ),
//           ].map((widget) => Expanded(child: widget)).toList(),
//         ),
//         const SizedBox(height: 8),
//       ],
//     );
//   }

//   Widget _buildStatCard({
//     required String title,
//     required int count,
//     required IconData icon,
//     required Color color,
//     required Color textColor,
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 2),
//       child: Card(
//         elevation: 4,
//         color: color, // Background color
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, color: textColor, size: 22),
//               const SizedBox(height: 6),
//               Text(
//                 '$count',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: textColor,
//                 ),
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: textColor.withAlpha(0xCC),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ▲▲▲ END OF NEW METHODS ▲▲▲

//   void _toggleExpansion() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//       if (_isExpanded) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }

//   // Add missing methods
//   void addManualEntry() {
//     final input = manualInput.text.trim();
//     if (input.isNotEmpty) {
//       final entries = input
//           .split(',')
//           .map((e) => e.trim())
//           .where((e) => e.isNotEmpty)
//           .toList();
//       _processEntries(entries); // Update total contacts immediately
//     }
//   }

//   void _processEntries(List<String> entries) {
//     final newData = <List<String>>[];
//     for (var i = 0; i < entries.length; i += 2) {
//       if (i + 1 < entries.length) {
//         newData.add([entries[i], entries[i + 1]]);
//       }
//     }

//     setState(() {
//       data.addAll(
//         newData.where((row) => row[0].isNotEmpty && row[1].isNotEmpty),
//       );
//       manualInput.clear();
//       _checkDuplicates();
//     });
//   }

//   void _checkDuplicates() {
//     final allContacts = data.map((row) => row[1]).toList();

//     setState(() {
//       statusList = data.asMap().entries.map((entry) {
//         final index = entry.key;
//         final contact = entry.value[1];

//         // Check if contact exists in sentContacts OR appears more than once
//         final isDuplicate = sentContacts.contains(contact) ||
//             allContacts.indexOf(contact) != index;

//         return MessageStatus(
//           contact,
//           sentContacts.contains(contact),
//           isDuplicate: isDuplicate,
//           error: statusList.isNotEmpty ? statusList[index].error : false,
//         );
//       }).toList();
//     });
//   }

//   Future<void> pickFile() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['csv'],
//       withData: true,
//     );

//     if (result != null && result.files.isNotEmpty) {
//       final file = result.files.first;
//       try {
//         parseCsv(utf8.decode(file.bytes!));
//       } catch (e) {
//         _showErrorDialog('File Error', 'Failed to parse file: ${e.toString()}');
//       }
//     }
//   }

//   void parseCsv(String csvString) {
//     try {
//       final csvData = const CsvToListConverter().convert(csvString);
//       final filteredData = csvData
//           .where(
//             (row) =>
//                 row.length >= 2 &&
//                 row[0].toString().trim().isNotEmpty &&
//                 row[1].toString().trim().isNotEmpty,
//           )
//           .toList();

//       processData(filteredData);

//       _checkDuplicates();
//     } catch (e) {
//       _showErrorDialog('CSV Error', 'Invalid CSV format: ${e.toString()}');
//     }
//   }

//   void processData(List<List<dynamic>> rawData) {
//     setState(() {
//       data = rawData
//           .map(
//             (row) => [row[0].toString().trim(), row[1].toString().trim()],
//           )
//           .toList();
//     });
//   }

// // ▼▼▼ MODIFY THIS EXISTING METHOD ▼▼▼
//   Future<void> startSending() async {
//     setState(() {
//       isSending = true;
//       cancelSending = false;
//       // Remove statusList initialization here to preserve previous progress

//       if (statusList.length != data.length) {
//         statusList = data.map((row) {
//           final contact = row[1];
//           return MessageStatus(
//             contact,
//             sentContacts.contains(contact),
//             isDuplicate: sentContacts.contains(contact),
//           );
//         }).toList();
//       }
//     });

//     final random = Random();
//     final min = int.tryParse(minDelay.text) ?? 30;
//     final max = int.tryParse(maxDelay.text) ?? 70;
//     final startIndex =
//         (int.tryParse(startFromController.text) ?? 0).clamp(0, data.length - 1);

//     for (int i = startIndex; i < data.length; i++) {
//       if (cancelSending) break;

//       final contact = data[i][1];
//       if (sentContacts.contains(contact)) continue;

//       // Simplified validation
//       if (!RegExp(r'^(\+44|601)\d+$').hasMatch(contact)) {
//         setState(
//             () => statusList[i] = MessageStatus(contact, false, error: true));
//         continue;
//       }

//       try {
//         final message = '${partC.text}${data[i][0]}${partD.text}';
//         final success = await sendWhatsApp(contact, message);

//         setState(() {
//           if (success) {
//             sentContacts.add(contact);
//             statusList[i] = MessageStatus(contact, true);
//           } else {
//             statusList[i] = MessageStatus(contact, false, error: true);
//           }
//         });

//         // ▼▼▼ FIXED DELAY LOGIC ▼▼▼
//         if (!cancelSending && i < data.length - 1) {
//           final delaySeconds = min + random.nextInt(max - min);
//           for (int s = 0; s < delaySeconds; s++) {
//             if (cancelSending) break;
//             await Future.delayed(const Duration(seconds: 1));
//           }
//         }
//       } catch (e) {
//         setState(
//             () => statusList[i] = MessageStatus(contact, false, error: true));
//       }
//     }

//     setState(() => isSending = false);
//   }

// // ▼▼▼ MODIFIED STOP HANDLING ▼▼▼
//   void _stopSending() {
//     setState(() {
//       cancelSending = true;
//       isSending = false;
//     });
//   }

//   Future<bool> sendWhatsApp(String phone, String message) async {
//     try {
//       final url = Uri.parse(
//         "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
//       );

//       // Open in new tab for web version
//       if (kIsWeb) {
//         await launchUrl(url, webOnlyWindowName: '_blank');
//       } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
//         // Desktop versions
//         await launchUrl(url, mode: LaunchMode.externalApplication);
//       } else {
//         // Mobile versions - use platform default
//         await launchUrl(
//           url,
//           mode: LaunchMode
//               .platformDefault, // Changed from externalNonBrowserApplication
//         );
//       }

//       await Future.delayed(const Duration(seconds: 2));
//       return true;
//     } catch (e) {
//       if (kDebugMode) debugPrint('Error: $e');
//       return false;
//     }
//   }

//   void clearAllData() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Clear All Data?'),
//         content: const Text('This will remove all contacts and history.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 data.clear();
//                 statusList.clear();
//                 sentContacts.clear();
//               });
//               Navigator.pop(context);
//             },
//             child: const Text(
//               'Clear All',
//               style: TextStyle(color: Colors.redAccent),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showErrorDialog(String title, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('WhatsApp Bulk_v 1(HKS)'),
//         centerTitle: true,
//         actions: [
//           Switch(
//             value: widget.isDarkMode,
//             onChanged: (value) {
//               widget.toggleTheme();
//             },
//           ),
//           IconButton(
//             icon: AnimatedIcon(
//               icon: AnimatedIcons.arrow_menu,
//               progress: _expandAnimation,
//             ),
//             onPressed: _toggleExpansion,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SizeTransition(
//               sizeFactor: _expandAnimation,
//               axisAlignment: 1.0,
//               child: FadeTransition(
//                 opacity: _expandAnimation,
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Text(
//                           'Data Input',
//                           style: Theme.of(
//                             context,
//                           ).textTheme.titleMedium?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.color,
//                               ),
//                         ),
//                         const Divider(
//                           color: Colors.grey,
//                           thickness: 1,
//                           height: 25,
//                         ),
//                         TextField(
//                           controller: manualInput,
//                           decoration: InputDecoration(
//                             labelText:
//                                 'Manual Entry (Location, Contact, ... comma-separated)',
//                             hintText:
//                                 'e.g., Verando Residence, +6012612xxx, London, +44...',
//                             hintStyle: TextStyle(color: Colors.grey[600]),
//                             suffixIcon: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(
//                                     Icons.add_circle_outline,
//                                     color: Colors.deepPurpleAccent,
//                                   ),
//                                   onPressed: addManualEntry,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: ElevatedButton.icon(
//                                 icon: const Icon(Icons.upload_file),
//                                 label: const Text('Upload CSV'),
//                                 onPressed: pickFile,
//                                 style: ElevatedButton.styleFrom(
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 18,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: ElevatedButton.icon(
//                                 icon: const Icon(
//                                   Icons.delete_forever,
//                                   color: Colors.white,
//                                 ),
//                                 label: const Text('Clear Data'),
//                                 onPressed:
//                                     data.isNotEmpty ? clearAllData : null,
//                                 style: ElevatedButton.styleFrom(
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 18,
//                                   ),
//                                   backgroundColor: Colors.redAccent.shade700,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 25),
//                         Text(
//                           'Message Template',
//                           style: Theme.of(
//                             context,
//                           ).textTheme.titleMedium?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.color,
//                               ),
//                         ),
//                         const Divider(
//                           color: Colors.grey,
//                           thickness: 1,
//                           height: 25,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: TextField(
//                                 controller: partC,
//                                 style: TextStyle(
//                                   color: Theme.of(
//                                     context,
//                                   ).textTheme.bodyMedium?.color,
//                                 ),
//                                 decoration: InputDecoration(
//                                   labelText: 'Part 1 (Prefix)',
//                                   hintText: 'e.g., Hi, your item...',
//                                   hintStyle: TextStyle(color: Colors.grey[600]),
//                                   labelStyle: Theme.of(context)
//                                       .inputDecorationTheme
//                                       .labelStyle
//                                       ?.copyWith(fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: TextField(
//                                 controller: partD,
//                                 style: TextStyle(
//                                   color: Theme.of(
//                                     context,
//                                   ).textTheme.bodyMedium?.color,
//                                 ),
//                                 decoration: InputDecoration(
//                                   labelText: 'Part 2 (Suffix)',
//                                   hintText: 'e.g., ...is available?',
//                                   hintStyle: TextStyle(color: Colors.grey[600]),
//                                   labelStyle: Theme.of(context)
//                                       .inputDecorationTheme
//                                       .labelStyle
//                                       ?.copyWith(fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 25),
//                         Text(
//                           'Delay Settings (seconds)',
//                           style: Theme.of(
//                             context,
//                           ).textTheme.titleMedium?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                                 color: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.color,
//                               ),
//                         ),
//                         const Divider(
//                           color: Colors.grey,
//                           thickness: 1,
//                           height: 25,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: TextField(
//                                 controller: minDelay,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   labelText: 'Min',
//                                   hintText: 'e.g., 30',
//                                   hintStyle: TextStyle(color: Colors.grey[600]),
//                                   labelStyle: Theme.of(context)
//                                       .inputDecorationTheme
//                                       .labelStyle
//                                       ?.copyWith(fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: TextField(
//                                 controller: maxDelay,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   labelText: 'Max',
//                                   hintText: 'e.g., 70',
//                                   hintStyle: TextStyle(color: Colors.grey[600]),
//                                   labelStyle: Theme.of(context)
//                                       .inputDecorationTheme
//                                       .labelStyle
//                                       ?.copyWith(fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 15),
//                             Expanded(
//                               child: TextField(
//                                 controller: startFromController,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   labelText: 'Start F',
//                                   hintText: 'e.g., 1',
//                                   hintStyle: TextStyle(color: Colors.grey[600]),
//                                   labelStyle: Theme.of(context)
//                                       .inputDecorationTheme
//                                       .labelStyle
//                                       ?.copyWith(fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ), // **Line ~689 - Previous error location, should be resolved now**
//             ElevatedButton.icon(
//               icon: Icon(isSending ? Icons.stop : Icons.send, size: 30),
//               label: Text(
//                 isSending ? 'STOP SENDING' : 'START SENDING',
//                 style: const TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'RobotoMono',
//                 ),
//               ),
//               onPressed: () {
//                 if (isSending) {
//                   _stopSending(); // Trigger immediate cancellation
//                 } else {
//                   startSending();
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 70),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(35),
//                 ),
//                 backgroundColor: isSending
//                     ? Colors.redAccent.shade700
//                     : data.isNotEmpty
//                         ? Colors.deepPurpleAccent
//                         : Colors.grey.shade700,
//                 foregroundColor: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 25),

//             // Add this progress summary
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               child: _buildProgressSummary(),
//             ),

//             // Existing Expanded widget with DataTable
//             Expanded(
//               child: data.isNotEmpty
//                   ? Card(
//                       elevation: 8,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: SingleChildScrollView(
//                         // **Outer SingleChildScrollView for VERTICAL scrolling**
//                         scrollDirection: Axis
//                             .vertical, // **Set scroll direction to vertical**
//                         child: SingleChildScrollView(
//                           // Existing inner SingleChildScrollView for horizontal scrolling
//                           scrollDirection: Axis.horizontal,
//                           child: DataTable(
//                             columnSpacing: 40,
//                             horizontalMargin: 20,
//                             dividerThickness: 1,
//                             dataRowMinHeight: 60,
//                             dataRowMaxHeight: 70,
//                             headingRowHeight: 55,
//                             columns: const [
//                               DataColumn(
//                                 label: Text(
//                                   'No',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Location',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Contact',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               DataColumn(
//                                 label: Text(
//                                   'Status',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                             rows: data.asMap().entries.map((entry) {
//                               final index = entry.key;
//                               final rowIndex = index + 1;
//                               final row = entry.value;
//                               final status = statusList.isNotEmpty
//                                   ? statusList[index]
//                                   : null;

//                               Color statusColor;

//                               if (status == null) {
//                                 statusColor = Colors.amberAccent;
//                               } else if (status.done) {
//                                 statusColor = Colors.purpleAccent
//                                     .shade400; // **Purple "Sent" Status**
//                               } else if (status.isDuplicate) {
//                                 statusColor = Colors.orangeAccent;
//                               } else if (status.error) {
//                                 statusColor = Colors.redAccent;
//                               } else {
//                                 statusColor = Colors.amberAccent;
//                               }

//                               return DataRow(
//                                 cells: [
//                                   DataCell(
//                                     Text(
//                                       '$rowIndex',
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ), // **Smaller Font Size**
//                                   DataCell(
//                                     Text(
//                                       row[0],
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ), // **Smaller Font Size**
//                                   DataCell(
//                                     Text(
//                                       row[1],
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ), // **Smaller Font Size**
//                                   DataCell(
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           width: 18,
//                                           height: 18,
//                                           decoration: BoxDecoration(
//                                             color: statusColor,
//                                             shape: BoxShape.circle,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                     )
//                   : const Card(
//                       elevation: 8,
//                       child: Padding(
//                         padding: EdgeInsets.all(25.0),
//                         child: Text(
//                           'No data to display. Please upload CSV or add manual entries.',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 18, color: Colors.grey),
//                         ),
//                       ),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MessageStatus {
//   final String contact;
//   final bool done;
//   final bool isDuplicate;
//   final bool error;

//   MessageStatus(
//     this.contact,
//     this.done, {
//     this.isDuplicate = false,
//     this.error = false,
//   });
// }

// // // // ignore: dangling_library_doc_comments
// // // /** 
// // // flutter clean
// // // flutter pub get
// // // flutter pub upgrade
// // // flutter pub upgrade --major-versions
// // // flutter build apk --release --no-shrink 
// // // **/
