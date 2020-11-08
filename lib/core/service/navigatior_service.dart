part of 'services.dart';

class NavigatorService {
  GlobalKey<NavigatorState> get navigatorKey => Get.key;

  Future<dynamic> navigateWithTransition(
    Widget page, {
    Transition transition,
    Duration duration,
  }) {
    return Get.to(
      page,
      transition: transition ?? Transition.fade,
      duration: duration ?? Get.defaultTransitionDuration,
      curve: Curves.easeInOutBack,
    );
  }

  Future<dynamic> replaceWithTransition(
    Widget page, {
    Transition transition,
    Duration duration,
  }) {
    return Get.off(
      page,
      transition: transition ?? Transition.fade,
      duration: duration ?? Get.defaultTransitionDuration,
      curve: Curves.easeInOutBack,
    );
  }

  Future<dynamic> replaceAllWithTransition(
    Widget page, {
    Transition transition,
    Duration duration,
  }) {
    return Get.offAll(
      page,
      transition: transition ?? Transition.fade,
      duration: duration ?? Get.defaultTransitionDuration,
      curve: Curves.easeInOutBack,
    );
  }

  void back({dynamic result, int id}) {
    Get.close(1);
  }

}
