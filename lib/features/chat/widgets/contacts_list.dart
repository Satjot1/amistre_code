import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/chat/controllers/chat_controller.dart';
import 'package:whatsapp_ui/features/chat/screens/mobile_chat_screen.dart';
import 'package:whatsapp_ui/features/common/loader.dart';
import 'package:whatsapp_ui/models/chat_contact.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: StreamBuilder<List<ChatContact>>(
            stream: ref.watch(chatControllerProvider).chatContacts(),
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshots.data!.length,
                itemBuilder: (context, index) {
                  var chatContactData = snapshots.data![index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MobileChatScreen.routeName,
                              arguments: {
                                'name': chatContactData.name,
                                'uid': chatContactData.contactId,
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: ListTile(
                            title: Text(
                              chatContactData.name,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Text(
                                chatContactData.lastMessage,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  chatContactData.profilePic),
                              radius: 25,
                            ),
                            trailing: Text(
                              DateFormat.Hm().format(chatContactData.timeSent),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(color: dividerColor),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
