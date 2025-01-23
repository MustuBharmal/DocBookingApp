import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../widgets/custom_app_bar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  static const String routeName = '/about-us-screen';

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  bool isLoading = true;
  WebViewController? controller;

  @override
  void initState() {
    super.initState();
    initiateController();
  }

  initiateController() async {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (!request.url.startsWith('https://crazylense.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse(HomeController.instance.dashboard.value!.aboutUs!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'About Us',
        back: true,
        isNotificationVisible: false,
      ),
      body: Stack(
        children: [_buildBody()],
      ),
    );
  }

  Widget _buildBody() {
    return Builder(
      builder: (context) {
        if (controller == null) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return WebViewWidget(
          controller: controller!,
        );
      },
    );
  }
}
