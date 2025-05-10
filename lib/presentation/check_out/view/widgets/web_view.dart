import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/order_success_screen/order_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String url;
  final String orderId;

  const PaymentWebView({super.key, required this.url, required this.orderId});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final url = request.url;
            if (url.contains("localhost:3000/allOrders")) {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OrderSuccessScreen(orderId: widget.orderId)));
              toastMessage(
                message: AppStrings.yourOrderPlacedSuccessfully,
                tybeMessage: TybeMessage.positive,
              );
              return NavigationDecision.prevent;
            } else if (url.contains("localhost:3000/cart")) {
              Navigator.pop(context);
              toastMessage(
                message: AppStrings.paymentCanceled,
                tybeMessage: TybeMessage.negative,
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
