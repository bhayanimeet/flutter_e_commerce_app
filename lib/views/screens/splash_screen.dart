import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import '../../controllers/google_ad_controller.dart';
import '../../controllers/notification_controller.dart';
import '../../res/global.dart';
import 'homepage.dart';
import 'intro_1.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    LocalPushNotificationHelper.localPushNotificationHelper
        .initializeLocalPushNotification();
    Timer(
      const Duration(seconds: 6),
      () => Get.off(
        () => (Global.isVisited == false)
            ? const IntroScreen1()
            : (Global.isLogged == false)
                ? const LoginScreen()
                : const HomePage(),
        curve: Curves.easeInOut,
        transition: Transition.cupertino,
      ),
    );
    AdHelper.adHelper.loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.shade400,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              filterQuality: FilterQuality.high,
              scale: 0.8,
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Click4Purchase",
                  curve: Curves.easeInOut,
                  cursor: '',
                  speed: const Duration(milliseconds: 300),
                  textStyle: GoogleFonts.arya(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
