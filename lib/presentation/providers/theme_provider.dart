
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// El themeProvider hace referencia a si el temea esta oscuro, por defecto esto es falso, o sea, esta en modo claro
final isDarkModeProvider = StateProvider((ref) => false);

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 1);

 