// ignore_for_file: file_names
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/appTheme.dart';

final themeProvider = StateProvider<bool>((ref) => false);

//estado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider<int>((ref) => 0);


// objeto de tipo AppTheme (custom)
final themNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  //STATE = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}
