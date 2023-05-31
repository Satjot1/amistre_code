import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/enums/message_enums.dart';
import 'package:whatsapp_ui/features/chat/controllers/chat_controller.dart';
import 'package:whatsapp_ui/utils/utils.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  const BottomChatField(
    this.recieverUserId, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  bool isShowSendButton = false;
  final TextEditingController _messageController = TextEditingController();
  bool isShowEmojiContainer = false;
  FocusNode focusNode = FocusNode();

  void sendTextMessage() async {
    if (isShowSendButton) {
      ref.read(chatControllerProvider).sendTextMessage(
            context,
            _messageController.text.trim(),
            widget.recieverUserId,
          );
      setState(() {
        _messageController.text = '';
      });
    }
  }

  void hideEmojiContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojiContainer() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyboard();
    } else {
      showEmojiContainer();
    }
  }

  void showKeyboard() {
    focusNode.requestFocus();
    hideEmojiContainer();
  }

  void hideKeyboard() {
    focusNode.unfocus();
    showEmojiContainer();
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref.read(chatControllerProvider).sentFileMessage(
          context,
          file,
          widget.recieverUserId,
          messageEnum,
        );
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);
    if (image != null) {
      sendFileMessage(image, MessageEnum.image);
    }
  }

  void selectVideo() async {
    File? video = await pickVideoFromGallery(context);
    if (video != null) {
      sendFileMessage(video, MessageEnum.video);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                focusNode: focusNode,
                controller: _messageController,
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    setState(() {
                      isShowSendButton = true;
                    });
                  } else {
                    setState(() {
                      isShowSendButton = false;
                    });
                  }
                },
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Write a message!",
                  fillColor: Colors.black,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  suffixIcon: SizedBox(
                    width: 80 + 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: selectImage,
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        IconButton(
                          onPressed: selectVideo,
                          icon: const Icon(
                            Icons.attach_file,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: SizedBox(
                      width: 48,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (isShowEmojiContainer) {
                                showKeyboard();
                              } else {
                                hideKeyboard();
                              }
                            },
                            icon: Icon(
                              isShowEmojiContainer
                                  ? Icons.keyboard_alt_outlined
                                  : Icons.emoji_emotions_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 4,
                right: 2,
                left: 2,
              ),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: GestureDetector(
                  child: Icon(
                    isShowSendButton
                        ? Icons.send_rounded
                        : Icons.mic_external_on_outlined,
                    color: Colors.black,
                  ),
                  onTap: sendTextMessage,
                ),
              ),
            ),
          ],
        ),
        isShowEmojiContainer
            ? SizedBox(
                height: 270,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                    setState(() {
                      _messageController.text =
                          _messageController.text + emoji.emoji;
                    });
                    if (!isShowSendButton) {
                      setState(() {
                        isShowSendButton = true;
                      });
                    }
                  },
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
