class MessageItemState {
  MessageItemState({
    required this.markAsRead,
    required this.showUnreadChip,
    required this.showDate,
    required this.isMine,
  });

  final bool markAsRead;

  final bool showUnreadChip;

  final bool showDate;

  final bool isMine;
}
