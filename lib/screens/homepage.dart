import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/connectivity_provider.dart';
import '../provider/web_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false)
        .CheckConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Goverment service"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: (Provider.of<ConnectivityProvider>(context)
                    .connectivitymodel
                    .coneectivity ==
                'Offline')
            ? const Text("Offline")
            : GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: Provider.of<WebProvider>(context)
                    .website
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'web', arguments: e);
                        },
                        child: Card(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                e.webname,
                                style: const TextStyle(fontSize: 30),
                              )),
                        ),
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}
