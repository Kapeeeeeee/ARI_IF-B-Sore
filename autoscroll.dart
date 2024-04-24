import 'package:flutter/material.dart';

class SlideScreen extends StatefulWidget {
  final List<String> imagePaths; 

  SlideScreen({required this.imagePaths}); 

  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      if (_currentPage < widget.imagePaths.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0);
      }
      _autoSlide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemCount: widget.imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            widget.imagePaths[index],
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}
