part of 'services.dart';

class AwesomeDialogService {
  void showErrorDialog(
      {@required String message, String title, Function onClick}) {
    AwesomeDialog(
      context: Get.key.currentContext,
      dialogType: DialogType.ERROR,
      animType: AnimType.SCALE,
      padding: EdgeInsets.all(16),
      title: title ?? 'Error',
      desc: message,
      btnOkOnPress: onClick ?? () {},
      btnOkIcon: Icons.cancel,
      btnOkColor: Colors.red,
    )..show();
  }

  void showSuccessDialog(
      {@required String message, String title, Function onClick}) {
    AwesomeDialog(
      context: Get.key.currentContext,
      animType: AnimType.SCALE,
      headerAnimationLoop: true,
      dialogType: DialogType.SUCCES,
      title: title ?? 'Succes',
      desc: message,
      btnOkOnPress: onClick ?? () {},
      btnOkIcon: Icons.check_circle,
      onDissmissCallback: () {
        debugPrint('Dialog Dissmiss from callback');
      },
    )..show();
  }

  AwesomeDialog showLoadingDialog() {
    return AwesomeDialog(
      context: Get.key.currentContext,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            TextFormat("Loading..."),
          ],
        ),
      ),
    )..show();
  }
}
