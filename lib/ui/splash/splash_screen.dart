part of '../pages.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ViewModelBuilder<SplashViewmodel>.nonReactive(
      viewModelBuilder: () => SplashViewmodel(),
      builder: (context, viewmodel, child) {
        return LifecycleManager(
          viewmodel: viewmodel,
          child: Scaffold(
            backgroundColor: Colors.black54,
            appBar: noAppBar,
            body: Stack(
              children: [
                Image.asset(
                  "$imageAsset/jawara_background.jpg",
                  fit: BoxFit.fitHeight,
                  height: 1920.h,
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "$imageAsset/icon_jawara.png",
                        width: 350.w,
                      ),
                      TextFormat(
                        "Jawara",
                        fontSize: 54.ssp,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.9),
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
