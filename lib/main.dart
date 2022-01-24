import 'package:bismilla/providers/bismillaProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BH/bismillaHome.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BismillaProvider()),
    ],

    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BismillaHome(),
    ),
  ),);
}
