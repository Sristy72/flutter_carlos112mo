import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/owner_home_screen.dart';
import 'package:flutter_carlos112mo/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_carlos112mo/features/player/presentation/screens/player_fields_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'core/common/constants/stripe_key.dart';
import 'core/init/app_initializer.dart';
import 'core/theme/app_theme.dart';
import 'features/Owner/presentation/screens/add_field_screen.dart';
import 'features/Owner/presentation/screens/client_booking_screen.dart';
import 'features/Owner/presentation/screens/owner_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // App initialize
  // await AppInitializer.initializeApp();

  // Stripe setup
  // Stripe.publishableKey = StripeKey.publishableKey;
  // Stripe.merchantIdentifier = 'merchant.com.yourapp';
  // await Stripe.instance.applySettings();

  // Inject BottomNavController globally
  // Get.put(BottomNavController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'carlos112mo',
      theme: AppTheme.light,
      // home: LoginScreen(),
      home : LoginScreen(),
    );
  }
}
