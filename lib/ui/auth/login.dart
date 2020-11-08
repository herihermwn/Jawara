part of '../pages.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ViewModelBuilder<LoginViewmodel>.reactive(
      viewModelBuilder: () => LoginViewmodel(),
      builder: (context, viewmodel, child) {
        return LifecycleManager(
          viewmodel: viewmodel,
          child: Scaffold(
            appBar: noAppBar,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-1, -1),
                    child: Transform.translate(
                      offset: Offset(-300.w, -480.w),
                      child: Container(
                        width: 960.w,
                        height: 960.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: iconColor2.withAlpha(80),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 52.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 64.h),
                        Hero(
                          tag: "icon_jawara",
                          child: Image.asset(
                            "$imageAsset/icon_jawara.png",
                            width: 300.w,
                          ),
                        ),
                        Container(
                          width: 250.w,
                          color: iconColor1,
                          height: 20.h,
                          margin: EdgeInsets.symmetric(
                            vertical: 20.h,
                            horizontal: 20.w,
                          ),
                        ),
                        SizedBox(height: 62.h),
                        TextFormat(
                          "Selamat datang,\nJawara!",
                          fontSize: 64.ssp,
                        ),
                        SizedBox(height: 150.h),
                        InputField(
                          hint: "Email",
                          textSize: 42.ssp,
                          controller: viewmodel.emailController,
                          inputType: TextInputType.emailAddress,
                          validateInput: viewmodel.checkEmail,
                        ),
                        SizedBox(height: 48.h),
                        InputField(
                          hint: "Kata sandi",
                          textSize: 42.ssp,
                          controller: viewmodel.passwordController,
                          inputType: TextInputType.visiblePassword,
                          validateInput: viewmodel.checkPassword,
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          children: [
                            TextFormat(
                              " Lupa kata sandi ?",
                              fontSize: 32.ssp,
                            ),
                            TextFormat(
                              " ubah sekarang",
                              fontSize: 32.ssp,
                              fontColor: iconColor2,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(height: 90.h),
                        Center(
                          child: SizedBox(
                            height: 150.h,
                            child: FloatingActionButton(
                              child: Icon(Icons.arrow_forward),
                              onPressed:
                                  viewmodel.isValid ? viewmodel.login : null,
                              elevation: viewmodel.isValid ? 4 : 0,
                              highlightElevation: 0,
                              backgroundColor: viewmodel.isValid
                                  ? iconColor4
                                  : disableButton,
                            ),
                          ),
                        ),
                        SizedBox(height: 90.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormat(
                              "Belum memiliki akun ?",
                              fontSize: 38.ssp,
                            ),
                            GestureDetector(
                              onTap: viewmodel.registerPage,
                              child: Hero(
                                tag: "fromLogin",
                                child: TextFormat(
                                  " daftar sekarang",
                                  fontSize: 38.ssp,
                                  fontColor: iconColor2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 90.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
