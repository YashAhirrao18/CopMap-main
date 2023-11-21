import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yash_s_application3/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:yash_s_application3/theme/theme_helper.dart';
import 'package:yash_s_application3/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yash_s_application3/firebase_options.dart';

// Create a global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Please update the theme as needed.
  ThemeHelper().changeTheme('primary');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navigatorKey,
      theme: theme,
      title: 'yash_s_application3',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      home: DashboardScreen(),
      routes: AppRoutes.routes,
    );
  }
}
