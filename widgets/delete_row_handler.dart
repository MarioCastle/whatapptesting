import '../models/message_status.dart';

void handleDeleteRow(
    int index,
    List<List<String>> data,
    List<MessageStatus> statusList,
    Function(void Function()) setStateCallback) {
  setStateCallback(() {
    if (index >= 0 && index < data.length) {
      data.removeAt(index);
      statusList.removeAt(index);

      // Check if there's only one duplicate left.
      final duplicateIndices = statusList
          .asMap()
          .entries
          .where((entry) => entry.value.isDuplicate)
          .map((entry) => entry.key)
          .toList();

      if (duplicateIndices.length == 1) {
        // If only one duplicate is left, mark it as not a duplicate.
        final remainingIndex = duplicateIndices.first;
        statusList[remainingIndex] = MessageStatus(
          statusList[remainingIndex].contact, // Positional contact
          statusList[remainingIndex].done, // Positional done
          isDuplicate: false,
          error: statusList[remainingIndex].error,
        );
      }
    }
  });
}
