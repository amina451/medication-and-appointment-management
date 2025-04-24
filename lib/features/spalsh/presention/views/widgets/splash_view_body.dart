import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/core/widgets/custom_logo_screen.dart';
import 'package:pharmacy_app/features/auth/views/screens/login_view.dart';
import 'package:pharmacy_app/features/home/presention/view/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavgation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomLogo(
      imageLogo: AppImages.assetsImagesLogoSplashScreen,
      colorTitle: Colors.white,
      colorSupTitle: Colors.white,
    );
  }

  void excuteNavgation() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
  }
}
