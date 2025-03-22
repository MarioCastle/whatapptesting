import 'package:flutter/material.dart';
import 'helpers/section_header.dart';

class DataInputSection extends StatelessWidget {
  final TextEditingController manualInput;
  final VoidCallback onAddEntry;
  final VoidCallback onPickFile;
  final VoidCallback? onClearData;

  const DataInputSection({
    super.key,
    required this.manualInput,
    required this.onAddEntry,
    required this.onPickFile,
    this.onClearData,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionHeader(title: 'Data Input'),
        TextField(
          controller: manualInput,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
          decoration: InputDecoration(
            labelText:
                'Manual Entry (Location, Contact,Location, Contact,....)',
            labelStyle: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface
                  .withAlpha((0.8 * 255).round()), // Replace withOpacity
              fontSize: 14,
            ),
            hintText: 'e.g., Verando Residence, +6012612xxx, London, +44...',
            hintStyle: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface
                  .withAlpha((0.6 * 255).round()), // Replace withOpacity
              fontSize: 14,
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // IconButton(
                //   icon: const Icon(Icons.qr_code_scanner),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const QRScannerScreen()),
                //     );
                //   },
                // ),
                IconButton(
                  icon: Icon(Icons.add_circle_outline,
                      color: colorScheme.outline),
                  onPressed: onAddEntry,
                ),
              ],
            ),
            filled: true,
            fillColor: colorScheme.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorScheme.outline, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorScheme.outline, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: colorScheme.tertiary,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.upload_file, color: colorScheme.onPrimary),
                label: Text(
                  'Upload CSV',
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                onPressed: onPickFile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: colorScheme.outline, width: 1),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.delete_forever, color: colorScheme.onError),
                label: Text(
                  'Clear Data',
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onError,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                onPressed: onClearData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.error,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: colorScheme.outline, width: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
