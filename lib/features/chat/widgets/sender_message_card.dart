import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/enums/message_enums.dart';
import 'package:whatsapp_ui/features/chat/widgets/diaplay_text_image_gif.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({
    Key? key,
    required this.message,
    required this.date,
    required this.type,
  }) : super(key: key);
  final String message;
  final String date;
  final MessageEnum type;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: senderMessageColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: type == MessageEnum.text
                    ? const EdgeInsets.only(
                        left: 20,
                        right: 5,
                        top: 0,
                        bottom: 20,
                      )
                    : const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 5,
                        bottom: 5,
                      ),
                child: DislplayTextImageGif(message: message, type: type),
              ),
              Positioned(
                bottom: 2,
                right: 10,
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
