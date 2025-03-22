import 'package:flutter/material.dart';

class MessageTemplateSection extends StatelessWidget {
  final TextEditingController partC;
  final TextEditingController partD;

  const MessageTemplateSection({
    super.key,
    required this.partC,
    required this.partD,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: partC,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onSurface),
                  decoration: InputDecoration(
                    labelText: 'Part 1 (Prefix)',
                    labelStyle: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withAlpha(
                          (0.8 * 255).round()), // Replace withOpacity
                      fontSize: 14,
                    ),
                    hintText: 'Enter prefix...',
                    hintStyle: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withAlpha(
                          (0.6 * 255).round()), // Replace withOpacity
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: colorScheme.outline, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: colorScheme.outline, width: 1.0),
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
              ),
              const SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: partD,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onSurface),
                  decoration: InputDecoration(
                    labelText: 'Part 2 (Suffix)',
                    labelStyle: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withAlpha(
                          (0.8 * 255).round()), // Replace withOpacity
                      fontSize: 14,
                    ),
                    hintText: 'Enter suffix...',
                    hintStyle: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withAlpha(
                          (0.6 * 255).round()), // Replace withOpacity
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: colorScheme.outline, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: colorScheme.outline, width: 1.0),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
