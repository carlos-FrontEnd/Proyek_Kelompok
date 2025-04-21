import 'package:flutter/material.dart';
import 'package:home/providers/anime_providers.dart';
import 'package:home/widgets/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 15  , 206, 34),
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  colorScheme: ColorScheme.dark(
    primary: Colors.grey[900]!,
    secondary: Colors.blueAccent,
  ),
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
    ), // Ganti bodyText1 dengan bodyLarge
    bodyMedium: TextStyle(color: Colors.white),
  ),
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier(lightTheme, false)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mangatsu',
      theme: themeNotifier.currentTheme,
      home: HomeScreen(),
    );
  }
}
