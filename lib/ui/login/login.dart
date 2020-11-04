part of '../pages.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ViewModelBuilder<AuthViewmodel>.reactive(
      viewModelBuilder: () => AuthViewmodel(),
      builder: (context, viewmodel, child) {
        return LifecycleManager(
          viewmodel: viewmodel,
          child: Scaffold(
            appBar: noAppBar,
            body: Padding(
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
                  SizedBox(height: 54.h),
                  TextFormat(
                    "Selamat datang,\nJawara!",
                    fontSize: 54.ssp,
                  ),
                  SizedBox(height: 124.h),
                  InputField(
                    hint: "Email",
                    controller: viewmodel.emailController,
                    inputType: TextInputType.emailAddress,
                    validateInput: viewmodel.checkEmail,
                  ),
                  SizedBox(height: 48.h),
                  InputField(
                    hint: "Kata sandi",
                    controller: viewmodel.passwordController,
                    inputType: TextInputType.visiblePassword,
                    validateInput: viewmodel.checkPassword,
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      TextFormat(
                        " Lupa password ?",
                        fontSize: 32.ssp,
                      ),
                      TextFormat(
                        " ganti sekarang",
                        fontSize: 32.ssp,
                        fontColor: iconColor2,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(height: 64.h),
                  Center(
                    child: SizedBox(
                      height: 150.h,
                      child: FloatingActionButton(
                        child: Icon(Icons.arrow_forward),
                        onPressed: () {},
                        backgroundColor:
                            viewmodel.isEmailValid && viewmodel.isPasswordValid
                                ? iconColor4
                                : disableButton,
                      ),
                    ),
                  ),
                  SizedBox(height: 124.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormat(
                        "Belum memiliki akun ?",
                        fontSize: 38.ssp,
                      ),
                      TextFormat(
                        " daftar sekarang",
                        fontSize: 38.ssp,
                        fontColor: iconColor3,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
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
