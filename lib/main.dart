import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedIconDemo(),
    );
  }
}

class AnimatedIconDemo extends StatefulWidget {
  @override
  _AnimatedIconDemoState createState() => _AnimatedIconDemoState();
}

class _AnimatedIconDemoState extends State<AnimatedIconDemo> with
    SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Duration of the animation (1 second)
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  void _toggleIcon() {
    setState(() {
      isPlaying = !isPlaying; // Toggle between play and pause
      isPlaying ? _controller.forward() : _controller.reverse(); // Start or reverse animation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Icon Demo"),
      ),
      body: Center(
        child: IconButton(
          iconSize: 100, // Set the size of the icon
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause, // Predefined play/pause animation
            progress: _controller, // Use the controller's progress to control the animation
          ),
          onPressed: _toggleIcon, // Toggle the animation on button press
        ),
      ),
    );
  }
}