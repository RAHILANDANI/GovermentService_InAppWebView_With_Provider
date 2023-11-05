import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:govermentservice/model/web_model.dart';

class WebProvider extends ChangeNotifier {
  PullToRefreshController? pullToRefreshController;
  InAppWebViewController? inAppWebViewController;
  List<WebModel> website = [
    WebModel(
        webname: 'Passport',
        weburl:
            'https://www.passportindia.gov.in/AppOnlineProject/welcomeLink#'),
    WebModel(webname: 'UIDAI', weburl: 'https://uidai.gov.in'),
    WebModel(
        webname: 'Parivahan', weburl: 'https://parivahan.gov.in/parivahan'),
    WebModel(webname: 'RMC', weburl: 'https://www.rmc.gov.in'),
  ];

  void pulltorefresh() {
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        inAppWebViewController!.reload();
      },
      options: PullToRefreshOptions(color: Colors.red),
    );
    notifyListeners();
  }

  void initcontroller(InAppWebViewController controller) {
    inAppWebViewController = controller;
    notifyListeners();
  }

  void stoprefresh() {
    pullToRefreshController!.endRefreshing();
    notifyListeners();
  }

  Future<void> forward() async {
    if (await inAppWebViewController!.canGoForward()) {
      await inAppWebViewController!.goForward();
    }
    notifyListeners();
  }

  Future<void> backward() async {
    if (await inAppWebViewController!.canGoBack()) {
      await inAppWebViewController!.goBack();
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    await inAppWebViewController!.reload();
    notifyListeners();
  }

  Future<void> home(String uri) async {
    inAppWebViewController!.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse(uri),
      ),
    );
  }
}
