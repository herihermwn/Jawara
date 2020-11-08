part of '../pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ViewModelBuilder<HomeViewmodel>.nonReactive(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, viewmodel, child) {
        return LifecycleManager(
          viewmodel: viewmodel,
          child: Scaffold(
            appBar: noAppBar,
            body: Center(
              child: TextFormat("Home Page"),
            ),
          ),
        );
      },
    );
  }
}
