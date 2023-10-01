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

part of 'app_manger_cubit.dart';

sealed class AppMangerState extends Equatable {
  const AppMangerState();

  @override
  List<Object> get props => [];
}

class AppMangerInitial extends AppMangerState {}

class AppMangerChangeMode extends AppMangerState {}

class AppMangerChangeModeLoading extends AppMangerState {}

class AppMangerChangeLogoLoading extends AppMangerState {}

class AppMangerChangeLogo extends AppMangerState {}
