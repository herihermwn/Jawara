import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:jawara/shared/shared.dart';

// Child
part 'navigatior_service.dart';
part 'image_picker_service.dart';
part 'awesome_dialog_service.dart';

//? ---------------------------------------------------------------------
//* Add new service here. Then run command
//* "flutter pub run build_runner build --delete-conflicting-outputs"
//? ---------------------------------------------------------------------
@module
abstract class ServicesModule {
  // Stacked Service
  // @lazySingleton
  // SnackbarService get snackbarService;

  // Custom Service
  @lazySingleton
  NavigatorService get navigatorService;
  @lazySingleton
  ImagePickerService get imagePickerService;
  @lazySingleton
  AwesomeDialogService get awesomeDialogService;
}