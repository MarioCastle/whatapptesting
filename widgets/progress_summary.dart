import 'package:flutter/material.dart';
import 'helpers/stat_card.dart';

class ProgressSummary extends StatelessWidget {
  final int total;
  final int success;
  final int failed;
  final int duplicates;
  final Function(String) onFilterChanged;

  const ProgressSummary({
    super.key,
    required this.total,
    required this.success,
    required this.failed,
    required this.duplicates,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: StatCard(
              title: 'Total',
              count: total,
              icon: Icons.format_list_numbered,
              color: Colors.blue.shade100,
              textColor: Colors.blue.shade800,
              onTap: () => onFilterChanged('total'),
            ),
          ),
          const SizedBox(width: 8), // Add gap
          Expanded(
            child: StatCard(
              title: 'Success',
              count: success,
              icon: Icons.check_circle,
              color: Colors.green.shade50,
              textColor: Colors.green.shade800,
              onTap: () => onFilterChanged('success'),
            ),
          ),
          const SizedBox(width: 8), // Add gap
          Expanded(
            child: StatCard(
              title: 'Failed',
              count: failed,
              icon: Icons.error,
              color: Colors.red.shade50,
              textColor: Colors.red.shade800,
              onTap: () => onFilterChanged('failed'),
            ),
          ),
          const SizedBox(width: 8), // Add gap
          Expanded(
            child: StatCard(
              title: 'Dup x2',
              count: duplicates,
              icon: Icons.content_copy,
              color: Colors.orange.shade50,
              textColor: Colors.orange.shade800,
              onTap: () => onFilterChanged('duplicates'),
            ),
          ),
        ],
      ),
    );
  }
}
