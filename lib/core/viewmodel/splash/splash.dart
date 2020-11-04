part of '../viewmodels.dart';

class SplashViewmodel extends FutureViewModel<void> with ViewModelLifecycle {
  @override
  Future<void> futureToRun() async {
    // Do Something here
    Future.delayed(Duration(seconds: 3), () {
      // Move Page
      replacePage(
        LoginPage(),
        transition: Transition.noTransition,
      );
    });
  }
}
