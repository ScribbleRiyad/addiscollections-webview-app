

import 'package:addiscollections/App/Widgets/gamma_text_widget.dart';
import 'package:go_router/go_router.dart';

import '../../Utils/theme_styles.dart';
import 'package:flutter/material.dart';
import '../../Route/route_name.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    getData();
    super.initState();
  }











  Future<void> getData() async {

    Future.delayed(const Duration(seconds: 2), () {

        context.goNamed(RouteName.homeScreen);


    });


  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ThemeStyles.primary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo/Addi’s-Collections-logo.png", height: 200,),
              const SizedBox(height: 10,),
              GammaTextWidget(text: " Welcome To Addi’s Collections Shop", color: ThemeStyles.whiteColor, fontWeight: FontWeight.bold, fontSize: 16,),


            ],
          )
        ),
      ),
    );
  }
}
