import 'package:flutter/material.dart';

import 'dialogs.dart';

void main() => runApp(const MaterialApp(home: DialogTest()));

class DialogTest extends StatefulWidget {
  const DialogTest({super.key});

  @override
  State<DialogTest> createState() => _DialogTestState();
}

class _DialogTestState extends State<DialogTest> {
  Widget dialog = const SizedBox();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 50.0,
            left: 50.0,
            child: InkWell(
              child: const Text('show about dialog'),
              onTap: () {
                showDialog();
              },
            ),
          ),
          Center(
            child: dialog,
          )
        ],
      ),
    );
  }

  showDialog() {
    setState(() {
      dialog = AnimatedAboutDialog(
        title: const Text('AlertDialog Title'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
}
