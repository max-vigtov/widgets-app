import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

   ScaffoldMessenger.of(context).clearSnackBars();
   
   final snakback = SnackBar(
      content: const Text('Hola mudno'),
      action: SnackBarAction(label: 'Ok', onPressed: (){},),
      duration: const Duration(seconds: 2),
    );
    
   ScaffoldMessenger.of(context).showSnackBar(snakback);
  
  }

  void openDialog (BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder:(context) =>  AlertDialog(
        title:  const Text('Estas seguro?'),
        content: const Text('Nisi sint id dolor reprehenderit eiusmod deserunt eu. Mollit ex ut duis aliquip aute. Lorem excepteur do aliquip cillum Lorem dolor irure consequat tempor quis exercitation. Laboris ut officia pariatur id elit esse. Esse labore cupidatat ad proident dolor ex deserunt labore laboris.'),
        actions: [
            TextButton(  onPressed: () => context.pop(), child: const Text('Cancelar')),
            FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackar y Dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context), 
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_circle_outline_outlined),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.tonal(
                onPressed: (){
                  showAboutDialog(
                    context: context, 
                    children: [
                      const Text('Velit voluptate aute excepteur irure reprehenderit mollit. Tempor fugiat ad incididunt est nostrud ea reprehenderit amet qui magna aliqua mollit ex. Duis amet non est ut culpa veniam laborum nisi cupidatat eu reprehenderit quis pariatur. Dolore voluptate tempor pariatur consectetur eiusmod duis adipisicing cillum duis voluptate proident duis. Eu ipsum eiusmod fugiat fugiat in in ea fugiat.'),
                    
                    ]
                  );
                }, 
                child: const Text('Licencias usadas')
                ),
              FilledButton.tonal(
                onPressed:() =>  openDialog(context), 
                child: const Text('Mostrar dialogos')
                ),                
            ],
          ),
        ),
    );
  }
}

