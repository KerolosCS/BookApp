import 'package:books_app/Features/Splash/presentation/view/widgets/sliding_text.dart';
import 'package:books_app/core/utils/app_router.dart';
import 'package:books_app/core/utils/assets.dart';
import 'package:books_app/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool? isDark = CacheHelper.getData(key: 'isDark');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        isDark == true
            ? Image.asset(AssetsData.logo)
            : Image.asset(
                AssetsData.logo,
                color: Colors.black,
              ),
        const SizedBox(height: 8),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      },
    );
  }
}
