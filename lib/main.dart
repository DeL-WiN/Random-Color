import 'package:flutter/material.dart';

import 'routers/routes.dart';
import 'style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: BC.black,
        bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
