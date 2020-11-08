import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jawara/app/locator.dart';
import 'package:jawara/core/service/services.dart';
import 'package:jawara/shared/shared.dart';
import 'package:jawara/ui/pages.dart';
import 'package:page_slider/page_slider.dart';
import 'package:stacked/stacked.dart';
import 'dart:io';

// child
part 'splash/splash.dart';

/// [child]
part 'auth/login.dart';
part 'auth/register.dart';

//? ----------
//* Service
//? ----------
final navigation = locator<NavigatorService>();
final imagePicker = locator<ImagePickerService>();

//? -----------
//* Navigator
//? -----------
Future<void> replacePage(Widget page,
    {Transition transition, Duration duration}) async {
  await navigation.replaceWithTransition(
    page,
    transition: transition ?? Transition.rightToLeftWithFade,
    duration: duration ?? Duration(milliseconds: 500),
  );
}

Future<void> movePage(Widget page, {Transition transition}) async {
  await navigation.navigateWithTransition(
    page,
    transition: transition ?? Transition.rightToLeftWithFade,
    duration: Duration(milliseconds: 500),
  );
}

//? -------------------
//* Lifecycle handler
//? -------------------
abstract class ViewModelLifecycle {
  void pause() {}

  @mustCallSuper
  void resume() async {}

  void inActive() {}
}
