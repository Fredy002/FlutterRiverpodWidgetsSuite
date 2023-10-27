// ignore_for_file: file_names
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/appTheme.dart';

final themeProvider = StateProvider<bool>((ref) => false);

//estado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);