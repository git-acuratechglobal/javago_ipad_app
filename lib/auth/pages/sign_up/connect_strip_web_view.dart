import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../config/common/api_end_points.dart';
import '../../../home/notifier/cafe_info_notifier/cafe_info_notifier.dart';

class CustomWebView extends ConsumerStatefulWidget {
  const CustomWebView({super.key, this.initialUrl, required this.title});
  final String? initialUrl;
  final String title;
  @override
  ConsumerState<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends ConsumerState<CustomWebView> {
  late final WebViewController _controller;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            print('Page started loading: $url');
            if (mounted) {
              setState(() {
                isLoading = true;
                errorMessage = null;
              });
            }
          },
          onPageFinished: (url) {
            print('Page finished loading: $url');
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
            if (url.startsWith("${Api.baseUrl}/cafe-api/square/oauth/callback")) {
              ref
                  .read(cafeInfoNotifierProvider.notifier)
                  .squareAccountCreated();
            }
          },
          onWebResourceError: (error) {
            print('Web resource error: ${error.description}');
            if (mounted) {
              setState(() {
                isLoading = false;
                errorMessage = 'Failed to load page: ${error.description}';
              });
            }
          },
          onNavigationRequest: (request) {
            if (request.url == "${Api.baseUrl}/api/stripe/onboarding/return") {
              ref.read(cafeInfoNotifierProvider.notifier).stripAccountStatus();
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (change) {},
        ),
      );

    _loadUrl();
  }

  void _loadUrl() async {
    try {
      if (mounted) {
        setState(() {
          isLoading = true;
          errorMessage = null;
        });
      }

      await _controller.loadRequest(Uri.parse(widget.initialUrl!));
    } catch (e) {
      print('Error loading URL: $e');
      if (mounted) {
        setState(() {
          errorMessage = 'Error loading URL: $e';
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
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
