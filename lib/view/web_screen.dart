import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ott_platform/provider/ott_provider.dart';
import 'package:provider/provider.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  OTTProvider? opT;
  OTTProvider? opF;

  InAppWebViewController? webViewController;
  PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    super.initState();
    pullToRefreshController=PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int index =ModalRoute.of(context)!.settings.arguments as int;

    opF=Provider.of<OTTProvider>(context,listen: false);
    opT=Provider.of<OTTProvider>(context,listen: true);


    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse("${opF!.ottList[index].link}")),
              onLoadStart: (controller, url) {
                webViewController=controller;
                pullToRefreshController!.endRefreshing();
              },
              onLoadStop: (controller, url) {
                webViewController = controller;
                pullToRefreshController!.endRefreshing();
              },
              onLoadError: (controller, url, code, message) {
                webViewController=controller;
                pullToRefreshController!.endRefreshing();
              },
              onProgressChanged: (controller, progress) {
                webViewController=controller;
                pullToRefreshController!.endRefreshing();
              },
              pullToRefreshController: pullToRefreshController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => webViewController!.goBack(),
                icon: Icon(Icons.arrow_back_rounded,color: Colors.white),
                iconSize: 25,
                color: Colors.black87,
              ),
              IconButton(
                onPressed: () => webViewController!.reload(),
                icon: Icon(Icons.refresh_rounded,color: Colors.white),
                iconSize: 25,
                color: Colors.black87,
              ),
              IconButton(
                onPressed: () => webViewController!.goForward(),
                icon: Icon(Icons.arrow_forward_rounded,color: Colors.white),
                iconSize: 25,
                color: Colors.black87,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
