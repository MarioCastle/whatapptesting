import 'package:flutter/material.dart';
import '../models/message_status.dart';

class DataTableSectionWidget extends StatefulWidget {
  final List<List<String>> data;
  final List<MessageStatus> statusList;
  final String filter;
  final Function(int) onDeleteRow;

  const DataTableSectionWidget({
    super.key,
    required this.data,
    required this.statusList,
    required this.filter,
    required this.onDeleteRow,
  });

  @override
  State<DataTableSectionWidget> createState() => _DataTableSectionWidgetState();
}

class _DataTableSectionWidgetState extends State<DataTableSectionWidget> {
  List<List<String>> filteredData = [];
  List<MessageStatus> filteredStatusList = [];
  List<int> originalIndices = [];

  @override
  void didUpdateWidget(covariant DataTableSectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data ||
        widget.statusList != oldWidget.statusList ||
        widget.filter != oldWidget.filter) {
      _updateFilteredData();
    }
  }

  @override
  void initState() {
    super.initState();
    _updateFilteredData();
  }

  void _updateFilteredData() {
    setState(() {
      filteredData.clear();
      filteredStatusList.clear();
      originalIndices.clear();

      for (int i = 0; i < widget.data.length; i++) {
        if (i < widget.statusList.length) {
          final status = widget.statusList[i];
          if (widget.filter == 'total' ||
              (widget.filter == 'success' && status.done) ||
              (widget.filter == 'duplicates' && status.isDuplicate) ||
              (widget.filter == 'failed' && status.error)) {
            filteredData.add(widget.data[i]);
            filteredStatusList.add(status);
            originalIndices.add(i);
          }
        } else if (widget.filter == 'total') {
          filteredData.add(widget.data[i]);
          filteredStatusList.add(MessageStatus(
            widget.data[i][1],
            false,
            isDuplicate: false,
            error: false,
          ));
          originalIndices.add(i);
        }
      }

      if (widget.filter == 'duplicates') {
        List<List<String>> tempFilteredData = [];
        List<MessageStatus> tempFilteredStatusList = [];
        List<int> tempOriginalIndices = [];

        for (int i = 0; i < widget.data.length; i++) {
          if (i < widget.statusList.length) {
            final status = widget.statusList[i];
            if (status.isDuplicate) {
              tempFilteredData.add(widget.data[i]);
              tempFilteredStatusList.add(status);
              tempOriginalIndices.add(i);
            }
          }
        }
        filteredData = tempFilteredData;
        filteredStatusList = tempFilteredStatusList;
        originalIndices = tempOriginalIndices;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return filteredData.isNotEmpty
        ? Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 40,
                  horizontalMargin: 20,
                  dividerThickness: 1,
                  dataRowMinHeight: 60,
                  dataRowMaxHeight: 70,
                  headingRowHeight: 55,
                  columns: const [
                    DataColumn(
                      label: Text('No',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text('Location',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text('Contact',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text('Status',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: List<DataRow>.generate(filteredData.length, (index) {
                    final row = filteredData[index];
                    final status = index < filteredStatusList.length
                        ? filteredStatusList[index]
                        : null;

                    Color statusColor = Colors.amberAccent;
                    if (status != null) {
                      if (status.done) {
                        statusColor = Colors.purpleAccent.shade400;
                      } else if (status.isDuplicate) {
                        statusColor = Colors.orangeAccent;
                      } else if (status.error) {
                        statusColor = Colors.redAccent;
                      }
                    }

                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        DataCell(Text(row[0])),
                        DataCell(Text(row[1])),
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataCell(
                          status?.isDuplicate == true
                              ? IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => widget
                                      .onDeleteRow(originalIndices[index]),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          )
        : const Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'No data to display. Please upload CSV or add manual entries.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          );
  }
}
