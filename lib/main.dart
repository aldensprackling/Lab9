import 'main_page.dart';
import 'package:provider/provider.dart';
import 'cluans_model.dart';
import 'package:flutter/material.dart';

/// The entry point of the application.
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CluansModel(), 
      child: const MainApp(),
    )
  );
}

/// The main application widget.
class MainApp extends StatelessWidget {
  /// Constructs a new [MainApp] instance.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const MainPage()
    );
  }
}