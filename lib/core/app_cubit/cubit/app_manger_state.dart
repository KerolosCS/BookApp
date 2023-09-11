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
