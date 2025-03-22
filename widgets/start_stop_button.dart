import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  final bool isSending;
  final bool hasData;
  final VoidCallback onPressed;

  const StartStopButton({
    super.key,
    required this.isSending,
    required this.hasData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(isSending ? Icons.stop : Icons.send, size: 30),
      label: Text(
        isSending ? 'STOP SENDING' : 'START SENDING',
        style: const TextStyle(fontSize: 22),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 70),
        backgroundColor: isSending
            ? Colors.redAccent.shade700
            : hasData
                ? Colors.deepPurpleAccent
                : Colors.grey.shade700,
      ),
    );
  }
}
