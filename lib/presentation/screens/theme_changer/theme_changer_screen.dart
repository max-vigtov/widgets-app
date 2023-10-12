import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final bool isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(  
        title: const Text('Theme Changer'),
        actions: [
           IconButton(
            icon: !isDarkMode ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
            onPressed: (){
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
              
              ref.read(selectedColorProvider.notifier).state;
            }, )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  } 
}
 
class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final List <Color> colors = ref.watch(colorListProvider);
    final int indexSelected = ref.watch(selectedColorProvider);
    
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (contex, index){
        final Color color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('$color.value'),
          activeColor: color,
          value: index, 
          groupValue: indexSelected,
          onChanged: (value){
           ref.read(selectedColorProvider.notifier).state = value!;
           //indexSelected = value!;
    

          }
        );
      },
    );
  }
}