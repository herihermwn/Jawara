import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jawara/app/locator.dart';
import 'package:jawara/core/service/services.dart';
import 'package:stacked/stacked.dart';

// child
part 'splash/splash.dart';

//? ----------
//* Service
//? ----------
final navigation = locator<NavigatorService>();

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
