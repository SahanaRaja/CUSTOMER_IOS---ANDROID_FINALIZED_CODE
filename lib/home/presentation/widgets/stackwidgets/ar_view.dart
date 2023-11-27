import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:permission_handler/permission_handler.dart';

class ARHomeScreen extends StatefulWidget {
  const ARHomeScreen({super.key});

  @override
  State<ARHomeScreen> createState() => _ARHomeScreenState();
}

class _ARHomeScreenState extends State<ARHomeScreen> {
  final _urlString = 'https://andverz.com/immersive/webar/demos/earrings2D/';
  InAppWebViewController? _webViewController;
  final InAppWebViewGroupOptions _options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false));

  bool _showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // appBar: AppBar(title: Text('AR Demo Page')),
      children: [
        _buildBody,
      ],
      // floatingActionButton: _buildFloatingButton,
    );
  }

  Widget get _buildFloatingButton => FloatingActionButton(
      onPressed: _reloadPage, child: const Icon(Icons.refresh));

  Widget get _buildBody => Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            _buildWebView,
            _buildLoader,
          ],
        ),
      );

  Widget get _buildLoader => _showLoader
      ? const Center(
          child: CupertinoActivityIndicator(
          color: Colors.blue,
        ))
      : Container();

  Widget get _buildWebView => InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(_urlString)),
      initialOptions: _options,
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
    /*  onLoadStart: (c, u) {
        _willShowLoader;
      },
      onLoadError: (c, u, i, s) {
        _willHideLoader;
      },
      onLoadStop: (c, u) {
        _willHideLoader;
      },
      onLoadHttpError: (c, u, i, s) {
        _willHideLoader;
      },
      onProgressChanged: (c, p) {
        p == 100 ? _willHideLoader : _willShowLoader;
      },
      */
      androidOnPermissionRequest: (InAppWebViewController controller,
          String origin, List<String> resources) async {
        return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT);
      });

  void _reloadPage() async {
    var url = Uri.parse(_urlString);
    _webViewController?.loadUrl(urlRequest: URLRequest(url: url));
  }

  void get _willShowLoader => setState(() => _showLoader = true);

  void get _willHideLoader => setState(() => _showLoader = false);
}
