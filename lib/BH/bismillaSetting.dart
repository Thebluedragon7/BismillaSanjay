import 'package:bismilla/providers/bismillaProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BismillaSetting extends StatefulWidget {
  const BismillaSetting({Key? key}) : super(key: key);

  @override
  _BismillaSettingState createState() => _BismillaSettingState();
}

class _BismillaSettingState extends State<BismillaSetting> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BismillaProvider>(
      builder: (context, notifier, child) => Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              ListTile(
                title: Text("Reset"),
                leading: Icon(Icons.flip_camera_android),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Center(child: Text('Warning')),
                      content: const Text("Are you sure you want to Reset the progress?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              notifier.reset();
                              Navigator.pop(context);
                              },
                            child: const Text("Yes")),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("No"))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
