import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShaoe (){
    final random = Random();

    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    //color = Colors.primaries[random.nextInt(Colors.primaries.length)];
    borderRadius = random.nextDouble() + 20;
    color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShaoe(),
        child: const Icon(Icons.play_arrow_rounded)
        ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: width < 1 ? 1 : width,
          height: height < 1 ? 1 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 1 ? 1 : borderRadius)
          ),
        ),
      ),
    );
  }
}

