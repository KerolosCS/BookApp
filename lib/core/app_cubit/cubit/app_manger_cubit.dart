/*
 *
 *
 *
 * ----------------
 * | 241030072002 |
 * ----------------
 * Copyright © [2023] KERO CS FLUTTER DEVELOPMENT.
 * All Rights Reserved. For inquiries or permissions, contact  me ,
 * https://www.linkedin.com/in/kerolos-fady-software-engineer/
 *
 * /
 */

import 'package:bloc/bloc.dart';
import 'package:books_app/core/utils/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_manger_state.dart';

class AppMangerCubit extends Cubit<AppMangerState> {
  AppMangerCubit() : super(AppMangerInitial());

  bool isDark = false;
  void changeMode({bool? fromShared}) {
    emit(AppMangerChangeModeLoading());
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheHelper.putData('isDark', isDark).then(
        (value) => emit(AppMangerChangeMode()),
      );
    }
  }

  Color? c;

  void toggleColor({required bool isDark}) {
    if (isDark == true) {
      c = Colors.white;
      emit(AppMangerChangeLogo());
    } else {
      c = Colors.black;
      emit(AppMangerChangeLogo());
    }
  }
}
