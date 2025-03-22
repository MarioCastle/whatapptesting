import 'package:flutter/material.dart';

class DelaySettingsSection extends StatelessWidget {
  final TextEditingController minDelay;
  final TextEditingController maxDelay;
  final TextEditingController startFromController;

  const DelaySettingsSection({
    super.key,
    required this.minDelay,
    required this.maxDelay,
    required this.startFromController,
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
                  controller: minDelay,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onSurface),
                  decoration: InputDecoration(
                    labelText: 'Min',
                    labelStyle: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withAlpha(
                          (0.8 * 255).round()), // Replace withOpacity
                      fontSize: 14,
                    ),
                    hintText: 'Enter min delay...',
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
                  controller: maxDelay,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onSurface),
                  decoration: InputDecoration(
                    labelText: 'Max',
                    labelStyle: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withAlpha(
                          (0.8 * 255).round()), // Replace withOpacity
                      fontSize: 14,
                    ),
                    hintText: 'Enter max delay...',
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
                  controller: startFromController,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onSurface),
                  decoration: InputDecoration(
                    labelText: 'Start F',
                    labelStyle: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withAlpha(
                          (0.8 * 255).round()), // Replace withOpacity
                      fontSize: 14,
                    ),
                    hintText: 'Enter start from...',
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
