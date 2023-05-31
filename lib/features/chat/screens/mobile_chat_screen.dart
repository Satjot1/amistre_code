import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/chat/widgets/bottom_chat_field.dart';
import 'package:whatsapp_ui/features/common/loader.dart';
import 'package:whatsapp_ui/models/user_model.dart';
import 'package:whatsapp_ui/widgets/chat_list.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  const MobileChatScreen({Key? key, required this.name, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 130, 9, 190),
        leading: const Image(
          image: AssetImage("assets/applogo.png"),
        ),
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(name),
                      const SizedBox(
                        width: 10,
                      ),
                      snapshot.data!.isOnline
                          ? const Icon(
                              Icons.circle,
                              color: Color.fromARGB(255, 0, 255, 8),
                              size: 10,
                            )
                          : const Icon(
                              Icons.circle,
                              color: Color.fromARGB(255, 255, 17, 0),
                              size: 10,
                            ),
                    ],
                  ),
                ],
              );
            }),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call_outlined,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call_outlined,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 34, 105, 248),
              Color.fromARGB(255, 247, 60, 247),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ChatList(
                recieverUserId: uid,
              ),
            ),
            BottomChatField(uid),
            const SizedBox(
              height: 2,
            )
          ],
        ),
      ),
    );
  }
}
