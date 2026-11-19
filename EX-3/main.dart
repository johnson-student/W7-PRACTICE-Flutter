import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: ImageGalleryScreen()
  ),
);

class ImageGalleryScreen extends StatefulWidget{
  const ImageGalleryScreen({super.key});
  @override
  State<ImageGalleryScreen> createState() => _ImageGalleryScreenState();
  
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen>{
  int _currentIndex = 0;

  void prevImage(){
    setState(() {
      _currentIndex = (_currentIndex - 1 + images.length) % images.length;
    });
  }
  void nextImage(){
    setState(() {
      _currentIndex = (_currentIndex + 1 ) % images.length;
    });
  }
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: prevImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[_currentIndex]),
    );
  }

}

