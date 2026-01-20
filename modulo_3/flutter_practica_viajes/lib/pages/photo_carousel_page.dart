import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhotoCarouselPage extends StatefulWidget {
  const PhotoCarouselPage({super.key});

  @override
  State<PhotoCarouselPage> createState() => _PhotoCarouselPageState();
}

class _PhotoCarouselPageState extends State<PhotoCarouselPage> {
  final PageController _pageController = PageController();
  final List<String> _images = [
    'assets/images/playa1.jpg',
    'assets/images/playa2.jpg',
    'assets/images/playa3.jpg',
  ];

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = _images.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrusel de fotos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      _images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text('Foto ${_currentIndex + 1} de $total'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
