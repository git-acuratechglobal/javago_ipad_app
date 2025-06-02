import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/auth/notifier/auth_notifier.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../home/notifier/cafe_info_notifier/cafe_info_notifier.dart';

class CustomWebView extends ConsumerStatefulWidget {
  const CustomWebView({super.key, this.initialUrl});
  final String? initialUrl;
  @override
  ConsumerState<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends ConsumerState<CustomWebView> {
  late final WebViewController _controller;
  int targetUrlHitCount = 0;
  bool isLoading = true;
  String? errorMessage;
  String currentUrl = '';

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            print('Page started loading: $url');
            setState(() {
              isLoading = true;
              errorMessage = null;
              currentUrl = url;
            });
          },
          onPageFinished: (url) {
            print('Page finished loading: $url');
            setState(() {
              isLoading = false;
              currentUrl = url;
            });

            // Check for target URL
            if (url.contains("18.132.176.176/cafe/set-cafe-profile")) {
              targetUrlHitCount++;
              print('Target URL hit count: $targetUrlHitCount');
              //
              // if (targetUrlHitCount == 2) {
              //   print('Navigating back - target URL hit twice');
              //   Navigator.pop(context);
              // }
            }
          },
          onWebResourceError: (error) {
            print('Web resource error: ${error.description}');
            setState(() {
              isLoading = false;
              errorMessage = 'Failed to load page: ${error.description}';
            });
          },
          onNavigationRequest: (request) {
            if (request.url ==
                "http://18.132.176.176/api/stripe/onboarding/return") {
              ref.read(cafeInfoNotifierProvider.notifier).stripAccountStatus();
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (change) {

          },
        ),
      );

    _loadUrl();
  }

  void _loadUrl() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      await _controller.loadRequest(Uri.parse(widget.initialUrl!));
    } catch (e) {
      print('Error loading URL: $e');
      setState(() {
        errorMessage = 'Error loading URL: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connect your Stripe Account"),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),

          // Loading indicator
          if (isLoading)
            Container(
              color: Colors.white.withOpacity(0.8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Error message
          if (errorMessage != null && !isLoading)
            Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Oops! Something went wrong',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        errorMessage!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          targetUrlHitCount = 0; // Reset counter on retry
                          _loadUrl();
                        },
                        icon: Icon(Icons.refresh),
                        label: Text('Try Again'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
