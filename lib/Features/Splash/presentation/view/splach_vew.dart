import 'package:books_app/Features/Splash/presentation/view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  //@immutable --> const
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}


//Stateful
// widget (immutable) vs state Object --> mutable  