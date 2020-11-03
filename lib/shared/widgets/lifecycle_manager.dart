part of '../shared.dart';

class LifecycleManager extends StatefulWidget {
  final Widget child;
  final ViewModelLifecycle viewmodel;
  LifecycleManager({this.child, this.viewmodel});

  @override
  _LifecycleManaStateger createState() => _LifecycleManaStateger();
}

class _LifecycleManaStateger extends State<LifecycleManager>
    with WidgetsBindingObserver {
  ViewModelLifecycle viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = widget.viewmodel;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        viewmodel.resume();
        break;
      case AppLifecycleState.paused:
        viewmodel.pause();
        break;
      case AppLifecycleState.inactive:
        viewmodel.inActive();
        break;
      default:
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
