import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentcar/controllers/users/auth.dart';
import 'package:rentcar/pages/adminControl/setPageAdmin.dart';
import 'package:rentcar/pages/homepage.dart';
import 'controllers/users/usersController.dart';
import 'pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:rentcar/routes/pages_route.dart';
import 'widgets/loading.dart';
import 'routes/routes_name.dart';
import 'package:rentcar/controllers/users/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}

class myApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                bottomAppBarTheme: BottomAppBarTheme(),
                fontFamily: 'Poppins',
                appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(color: Colors.white),
                    backgroundColor: Color.fromARGB(255, 4, 28, 50),
                    iconTheme: IconThemeData(color: Colors.white))),
            initialRoute:
                snapshot.data != null ? RouteName.navigasi : RouteName.splash,
            getPages: AppPage.pages,
          );
        }
        return const loadingView();
      },
    );
  }
}
