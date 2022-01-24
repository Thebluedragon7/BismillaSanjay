import 'package:bismilla/BH/bismillaReport.dart';
import 'package:bismilla/drawer/bismillaDrawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bismilla/providers/bismillaProvider.dart';
import 'package:provider/provider.dart';

class BismillaHome extends StatefulWidget {
  const BismillaHome({Key? key}) : super(key: key);

  @override
  State<BismillaHome> createState() => _BismillaHomeState();
}

class _BismillaHomeState extends State<BismillaHome> {
  @override
  void initState() {
    super.initState();
    context.read<BismillaProvider>().loadAll();
  }

  @override
  Widget build(BuildContext context) {
    var buttonColor = Colors.amberAccent;
    return Consumer<BismillaProvider>(
        builder: (context, notifier, child)
    =>
        Scaffold(
          drawer: BismillaDrawer(),
          body: SafeArea(
            child: Column(
              children: [
                Card(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.92,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                                "Bismalla Count",
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                            Text(
                                "${notifier.bismillaCount}",
                              style: TextStyle(
                                fontSize: 40
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                                "Jadoo Count",
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                            Text(
                                "${notifier.jadooCount}",
                              style: TextStyle(
                                  fontSize: 40
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            notifier.bismilla();
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.47,
                          color: buttonColor,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width * 0.20,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            notifier.jadoo();
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.47,
                          color: buttonColor,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width * 0.20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => const BismillaReport()
              )),
            backgroundColor: Colors.lightGreen,
            child: Icon(
                Icons.report
            ),
          ),
        )
    );
  }
}
