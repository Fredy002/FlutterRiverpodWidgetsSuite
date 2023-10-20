// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('data'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        //obliga al usuario presionar uno de los botones adheridos
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('Are you sure'),
              content: const Text(
                  'Tempor excepteur ullamco culpa consectetur cillum nisi.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancel')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Acept'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and Dialogs'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Dolor in dolor dolore ad laboris sit ipsum consequat quis quis velit enim. Nulla minim cupidatat aliqua laborum officia id est commodo. Voluptate deserunt et do adipisicing reprehenderit voluptate deserunt eiusmod elit eu esse qui. Esse sint consectetur ipsum dolor minim non incididunt elit consectetur consequat cillum laborum.')
                ]);
              },
              child: const Text('Used licenses')),
          FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Show dialog'))
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Display Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackbar(context)),
    );
  }
}
