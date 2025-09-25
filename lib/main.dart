import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/cubit/auth_cubit.dart';
import 'package:store/firebase_options.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/screens/login_view.dart';
import 'package:store/screens/update_product_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit()..checkUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          UpdateProductScreen.id: (context) => UpdateProductScreen(),
          LoginView.id: (context) => LoginView(),
        },
        home: AnimatedSplashScreen(
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splash.png",
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                "Fashion Store",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
            ],
          ),
          duration: 2000,
          splashIconSize: 250,
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: const Color.fromARGB(255, 196, 142, 142),
          nextScreen: const LoginView(),
        ),
      ),
    );
  }
}
