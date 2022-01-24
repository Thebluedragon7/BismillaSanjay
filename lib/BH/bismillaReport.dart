import 'package:bismilla/providers/bismillaProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BismillaReport extends StatelessWidget {
  const BismillaReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BismillaProvider>(
      builder: (context, notifier, child) => Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              ListTile(
                title: Text("Total Bismilla Count : ${notifier.bismillaCount}"),
              ),
              ListTile(
                title: Text("Total Bismilla Count : ${notifier.jadooCount}"),
              ),
            ],
          )
        ),
      ),
    );
  }
}
