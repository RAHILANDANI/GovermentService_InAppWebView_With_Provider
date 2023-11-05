import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:govermentservice/model/web_model.dart';
import 'package:govermentservice/provider/web_provider.dart';
import 'package:provider/provider.dart';

class webpage extends StatefulWidget {
  const webpage({super.key});

  @override
  State<webpage> createState() => _webpageState();
}

class _webpageState extends State<webpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WebProvider>(context, listen: false).pulltorefresh();
  }

  @override
  Widget build(BuildContext context) {
    WebModel args = ModalRoute.of(context)!.settings.arguments as WebModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.webname),
      ),
      body: InAppWebView(
        onLoadStart: (controller, url) {
          Provider.of<WebProvider>(context, listen: false)
              .initcontroller(controller);
        },
        onLoadStop: (controller, url) {
          Provider.of<WebProvider>(context, listen: false).stoprefresh();
        },
        pullToRefreshController:
            Provider.of<WebProvider>(context).pullToRefreshController,
        initialUrlRequest: URLRequest(
          url: Uri.parse(args.weburl),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<WebProvider>(context, listen: false).backward();
            },
            child: Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<WebProvider>(context, listen: false).forward();
            },
            child: Icon(Icons.arrow_forward),
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<WebProvider>(context, listen: false)
                  .home(args.weburl);
            },
            child: Icon(Icons.home),
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<WebProvider>(context, listen: false).refresh();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
