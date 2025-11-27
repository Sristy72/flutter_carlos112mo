import 'package:flutter/widgets.dart';
import 'package:flutter_carlos112mo/core/network/services/socket_client.dart';
import '../di/service_locator.dart';
import 'hive_intialization.dart';
import 'stripe_initializer.dart';


class AppInitializer {
  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await HiveInitialization.initHive();

    setupServiceLocator();

    StripeInitializer.intiStripe();
    SocketClient().connect();
    SocketClient().onReady;

    // SocketService.initializeSocket(sl());
  }
}
