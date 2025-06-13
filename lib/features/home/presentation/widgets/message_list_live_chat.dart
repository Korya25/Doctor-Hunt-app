import 'package:doctor_hunt/features/home/data/models/chat_message_model.dart';
import 'package:doctor_hunt/features/home/data/models/fake_user_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/chat_comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageListLiveChat extends StatelessWidget {
  const MessageListLiveChat({
    super.key,
    required this.messages,
    required this.user,
  });

  final List<ChatMessage> messages;
  final FakeUser user;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];

        return ChatCommentCard(fakeUser: user, message: message.text);
      },
    );
  }
}
