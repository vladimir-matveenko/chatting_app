import 'package:chatting_app/features/chats/presentation/widget/chat_screen_body.dart';
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat_cubit/cubit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.id});

  final String id;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    context.read<ChatCubit>().getChatById(widget.id);
    context.read<MessagesCubit>().loadMessages(chatId: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChatScreenBody(chatId: widget.id);
  }
}
