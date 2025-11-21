import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class VideoCarouselPage extends StatefulWidget {
  const VideoCarouselPage({super.key});

  @override
  State<VideoCarouselPage> createState() => _VideoCarouselPageState();
}

class _VideoCarouselPageState extends State<VideoCarouselPage> {
  final PageController _pageController = PageController();

  late List<VideoPlayerController> _controllers;
  final List<String> _videos = [
    'assets/videos/clip_hotel.mp4',
    'assets/videos/clip_playa.mp4',
    'assets/videos/clip_tour.mp4',
  ];
  final List<String> _titles = [
    'Hotel',
    'Playa',
    'Tour guiado',
  ];

  int _currentIndex = 0;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controllers = _videos
        .map((path) => VideoPlayerController.asset(path))
        .toList();

    Future.wait(_controllers.map((c) => c.initialize())).then((_) {
      setState(() {
        _initialized = true;
      });
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  void _togglePlay(int index) {
    if (!_initialized) return;
    final controller = _controllers[index];
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = _videos.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrusel de videos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _initialized
                ? PageView.builder(
                    controller: _pageController,
                    itemCount: _videos.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final controller = _controllers[index];
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: VideoPlayer(controller),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _titles[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              iconSize: 40,
                              icon: Icon(
                                controller.value.isPlaying
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                              ),
                              onPressed: () => _togglePlay(index),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          const SizedBox(height: 8),
          Text('Video ${_currentIndex + 1} de $total'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
