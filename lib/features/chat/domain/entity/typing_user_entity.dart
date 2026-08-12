import 'package:equatable/equatable.dart';

class TypingUserEntity extends Equatable {
  const TypingUserEntity({required this.chatId, required this.userId});

  final String chatId;
  final String userId;

  @override
  List<dynamic> get props => [chatId, userId];
}
