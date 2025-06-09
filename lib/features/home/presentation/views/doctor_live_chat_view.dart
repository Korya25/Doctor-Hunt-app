import 'package:doctor_hunt/core/widgets/cached_network_image_with_shimmer.dart';
import 'package:doctor_hunt/features/home/data/models/chat_message_model.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/data/models/fake_user_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/header_live_chat.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/message_list_live_chat.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/send_meesage_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorLiveChatView extends StatefulWidget {
  const DoctorLiveChatView({
    super.key,
    required this.doctorModel,
    required this.user,
  });
  final FakeUser user;
  final DoctorModel doctorModel;

  @override
  State<DoctorLiveChatView> createState() => _DoctorLiveChatViewState();
}

class _DoctorLiveChatViewState extends State<DoctorLiveChatView> {
  final TextEditingController messageController = TextEditingController();
  final List<ChatMessage> messages = [];

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.insert(
          0,
          ChatMessage(
            text: messageController.text,
            isDoctor: false,
            timestamp: DateTime.now(),
          ),
        );
        messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(),
          SafeArea(
            child: Column(
              children: [
                HeaderLiveChat(image: widget.doctorModel.image),
                Expanded(
                  child: MessageListLiveChats(
                    messages: messages,
                    user: widget.user,
                  ),
                ),
                SendMessageField(
                  controller: messageController,
                  onSend: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackground() {
    return Positioned.fill(
      child: Stack(
        children: [
          CachedNetworkImageWithShimmer(
            height: double.infinity,
            width: double.infinity,
            imageUrl: widget.doctorModel.image,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
