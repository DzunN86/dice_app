import 'package:flutter/material.dart';
import "package:dice_app/gradient_container.dart";

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: GradientContainer(
            Color.fromARGB(255, 176, 44, 199),
            Color.fromARGB(255, 87, 26, 97),
          ),
        ),
      ),
    )
  );
}