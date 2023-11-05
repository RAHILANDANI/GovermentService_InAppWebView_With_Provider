import 'package:flutter/material.dart';
import 'package:govermentservice/provider/connectivity_provider.dart';
import 'package:govermentservice/provider/web_provider.dart';
import 'package:govermentservice/screens/homepage.dart';
import 'package:govermentservice/screens/webpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WebProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        routes: {
          '/': (context) => const MyApp(),
          'web': (context) => const webpage(),
        },
      ),
    ),
  );
}
