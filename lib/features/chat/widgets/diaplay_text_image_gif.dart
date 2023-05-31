import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/enums/message_enums.dart';
import 'package:whatsapp_ui/features/chat/widgets/video_player_item.dart';

class DislplayTextImageGif extends StatelessWidget {
  final String message;
  final MessageEnum type;
  const DislplayTextImageGif(
      {super.key, required this.message, required this.type});

  @override
  Widget build(BuildContext context) {
    return type == MessageEnum.text
        ? Text(
            message,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        : type == MessageEnum.video
            ? ElevatedButton(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 15),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
                  overlayColor: MaterialStateProperty.all(Colors.red),
                  maximumSize: MaterialStateProperty.all(const Size(105, 40)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoPlayerItem(videoUrl: message),
                      ));
                },
                child: Row(
                  children: const [
                    Icon(Icons.play_circle_outline_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Video")
                  ],
                ))
            : CachedNetworkImage(imageUrl: message);
  }
}
