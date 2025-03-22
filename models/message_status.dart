class MessageStatus {
  final String contact;
  final bool done;
  final bool isDuplicate;
  final bool error;

  MessageStatus(
    this.contact,
    this.done, {
    this.isDuplicate = false,
    this.error = false,
  });
}
