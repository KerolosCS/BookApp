import 'package:books_app/core/app_cubit/cubit/app_manger_cubit.dart';
import 'package:books_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppMangerCubit, AppMangerState>(
        builder: (context, state) {
      return Row(
        children: [
          Image.asset(
            AssetsData.logo,
            color: BlocProvider.of<AppMangerCubit>(context).c,
            height: 20,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              BlocProvider.of<AppMangerCubit>(context).changeMode();
              BlocProvider.of<AppMangerCubit>(context).toggleColor(
                  isDark: BlocProvider.of<AppMangerCubit>(context).isDark);
            },
            icon: const Icon(FontAwesomeIcons.solidMoon),
          ),
        ],
      );
    });
  }
}
