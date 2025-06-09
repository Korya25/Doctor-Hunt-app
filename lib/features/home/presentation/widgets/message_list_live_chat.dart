import 'package:doctor_hunt/features/home/data/models/chat_message_model.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/chat_comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageListLiveChats extends StatelessWidget {
  const MessageListLiveChats({
    super.key,
    required this.messages,
    required this.doctorModel,
  });

  final List<ChatMessage> messages;
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];

        if (message.isDoctor) {
          return ChatCommentCard(
            doctorModel: doctorModel,
            message: message.text,
          );
        }

        return ChatCommentCard(doctorModel: doctorModel, message: message.text);
      },
    );
  }
}
