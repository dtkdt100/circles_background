import 'package:flutter/material.dart';

import 'home_page.dart';

/// App-wide theme mode, toggled from the app bars.
final themeMode = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeMode,
      builder: (context, mode, _) => MaterialApp(
        title: 'Circles Background',
        debugShowCheckedModeBanner: false,
        themeMode: mode,
        theme: ThemeData(colorSchemeSeed: Colors.blue),
        darkTheme: ThemeData(
          colorSchemeSeed: Colors.blue,
          brightness: Brightness.dark,
        ),
        home: const HomePage(),
      ),
    );
  }
}

/// Switches between light and dark mode.
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      tooltip: isDark ? 'Light mode' : 'Dark mode',
      icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      onPressed: () =>
          themeMode.value = isDark ? ThemeMode.light : ThemeMode.dark,
    );
  }
}
