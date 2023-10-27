import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/appRouter.dart';
import 'package:widgets_app/config/theme/appTheme.dart';
import 'package:widgets_app/src/providers/themeProvider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch(themeProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final AppTheme appTheme = ref.watch(themNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme(
      //   selectedColor: selectedColor,
      //   isDarkMode: isDarkMode,
      // ).getTheme(),
      theme: appTheme.getTheme()
    );
  }
}
