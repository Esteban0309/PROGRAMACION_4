import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class PromoVideoPage extends StatefulWidget {
  const PromoVideoPage({super.key});

  @override
  State<PromoVideoPage> createState() => _PromoVideoPageState();
}

class _PromoVideoPageState extends State<PromoVideoPage> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/promo_playa.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (!_isInitialized) return;
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video promocional'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              iconSize: 40,
              icon: Icon(
                _controller.value.isPlaying ? Icons.pause_circle : Icons.play_circle,
              ),
              onPressed: _togglePlay,
            ),
            const SizedBox(height: 8),
            const Text(
              'Video promocional del destino Playa Paraíso.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
