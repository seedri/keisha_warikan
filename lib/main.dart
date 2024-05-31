import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keisha_warikan/views/main_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 187, 0)),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 255, 187, 0), // AppBarの背景色を設定
            foregroundColor: Colors.black, // AppBarの前景色を設定（アイコンやテキストの色）
          ),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('keisha-warikan!'),
            ),
            body: Center(
              child: MainPage(),
            )));
  }
}
