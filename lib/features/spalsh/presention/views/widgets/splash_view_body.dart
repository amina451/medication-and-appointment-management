import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/core/widgets/custom_logo_screen.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/screens/login_view.dart';
import 'package:pharmacy_app/features/home/presention/view/home_view.dart';
import 'package:pharmacy_app/features/home/presention/widgets/custom_nav_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    final SupabaseClient client = Supabase.instance.client;
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 
      
      client.auth.currentUser !=null ?CustomBottomNavBar.routeName
      : LoginView.routeName);
    });
  }
}
