import 'package:bismilla/BH/bismillaReport.dart';
import 'package:bismilla/BH/bismillaSetting.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BismillaDrawer extends StatelessWidget {
  const BismillaDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Image(
              image: AssetImage("assets/appIcon/sanjay.png"),
            ),
          ),
          ListTile(
              leading: Icon(Icons.report),
              title: const Text('Report'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BismillaReport()))),
          ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Preferences'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BismillaSetting()))),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: const Text('About Developer'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Center(child: Text('About Developer')),
                  content: Column(
                    children: [
                      const Text("""
This app was created and released by Milan Gurung in 2022 AD as a student of Informatics College Pokhara.\n
This project was built for fun purposes especially for Sanjay.
"""),
                      Spacer(),
                      InkWell(
                        child: Text("Send feedback"),
                        focusColor: Colors.red,
                        onTap: () {
                          launch('mailto:milan.gurung.a21.2@icp.edu.np');
                        },
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"))
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
