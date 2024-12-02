import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../Utils/theme_styles.dart';
import '../../Widgets/gamma_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final WebViewController controller;
  int loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
          "Mozilla/5.0 (Linux; Android 10; Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36")
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://www.addiscollections.com/'),
      );
  }

  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          content: const GammaTextWidget(text:'Do you want to leave this page?',color: ThemeStyles.blackColor,fontSize: 16,textAlign: TextAlign.center,),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.all(10),
          actions: <Widget>[
            OutlinedButton(
              onPressed: ()  async {
                if (await controller.canGoBack()) {
                  controller.goBack();
                } else {

                  SystemNavigator.pop();

                }
                controller.goBack();
                Navigator.pop(context,true);


              },
              child: const GammaTextWidget(text: 'Yes', color: ThemeStyles.greenColor,),
            ),
            const SizedBox(width: 20,),
            OutlinedButton(



              onPressed: () {
                Navigator.pop(context,false);
              },
              child: const GammaTextWidget(text: 'No', color: ThemeStyles.redColor,),

            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showBackDialog() ?? false;
        if (context.mounted && shouldPop) {
          controller.goBack();
        }
      },
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //
          //   backgroundColor: ThemeStyles.whiteColor,
          //   title: const GammaTextWidget(text: " Welcome to RMFAR", color: ThemeStyles.blackColor, fontSize:18 , fontWeight:FontWeight.w900),
          //   actions: [
          //     IconButton(
          //       icon: const Icon(Icons.arrow_back_ios, color: ThemeStyles.greenColor,),
          //       onPressed: () async {
          //         if (await controller.canGoBack()) {
          //           controller.goBack();
          //         }
          //       },
          //     ),
          //     IconButton(
          //       icon: const Icon(Icons.arrow_forward_ios, color: ThemeStyles.greenColor,),
          //       onPressed: () async {
          //         if (await controller.canGoForward()) {
          //           controller.goForward();
          //         }
          //       },
          //     ),
          //     IconButton(
          //       icon: const Icon(Icons.replay, color: ThemeStyles.redColor,),
          //       onPressed: () {
          //         controller.reload();
          //       },
          //     ),
          //   ],
          // ),
          body: Stack(
            children: [
              WebViewWidget(
                controller: controller,
              ),
              if (loadingPercentage < 100)
                LinearProgressIndicator(
                  color: Colors.red,
                  value: loadingPercentage / 100.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}