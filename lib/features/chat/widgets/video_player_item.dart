import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({super.key, required this.videoUrl});

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late CachedVideoPlayerController _videoController;
  late bool _isPlaying;
  late bool _isInitialized;
  late double _videoProgress;
  late bool _isFullScreen;

  @override
  void initState() {
    super.initState();
    _isPlaying = false;
    _isInitialized = false;
    _videoProgress = 0.0;
    _isFullScreen = false;
    _videoController = CachedVideoPlayerController.network(widget.videoUrl)
      ..addListener(() {
        setState(() {
          _videoProgress =
              _videoController.value.position.inMilliseconds.toDouble();
        });
      })
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _playPauseVideo() {
    setState(() {
      if (_videoController.value.isPlaying) {
        _videoController.pause();
        _isPlaying = false;
      } else {
        _videoController.play();
        _isPlaying = true;
      }
    });
  }

  Widget _buildProgressBar() {
    return Slider(
      value: _videoProgress,
      min: 0.0,
      max: _videoController.value.duration.inMilliseconds.toDouble(),
      onChanged: (value) {
        _videoController.seekTo(Duration(milliseconds: value.toInt()));
      },
    );
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final videoWidget = AspectRatio(
      aspectRatio: _videoController.value.aspectRatio,
      child: CachedVideoPlayer(_videoController),
    );

    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              title: const Text(
                'Amistre Video',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
      body: GestureDetector(
        onTap: () => _toggleFullScreen(),
        child: Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: _isFullScreen
              ? videoWidget
              : Column(
                  children: [
                    Expanded(child: videoWidget),
                    IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      onPressed: _isInitialized ? _playPauseVideo : null,
                    ),
                    _buildProgressBar(),
                  ],
                ),
        ),
      ),
    );
  }
}
