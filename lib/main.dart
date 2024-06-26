import 'package:weartest/counter/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SmartWatch Counter",
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.compact,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
          surface: Colors.white,
          onSurface: Colors.black, // Actualización aquí
        ),
      ),
      home: const WatchScreen(),
    );
  }
}

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WatchShape(builder: (context, shape, child) {
      return AmbientMode(
        builder: (context, mode, child) => const CounterPage(),
      );
    });
  }
}