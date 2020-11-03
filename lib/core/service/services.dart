import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

// Child
part 'navigatior_service.dart';

//? ---------------------------------------------------------------------
//* Add new service here. Then run command
//* "flutter pub run build_runner build --delete-conflicting-outputs"
//? ---------------------------------------------------------------------
@module
abstract class ServicesModule {
  // Stacked Service
  @lazySingleton
  SnackbarService get snackbarService;

  // Custom Service
  @lazySingleton
  NavigatorService get navigatorService;
}