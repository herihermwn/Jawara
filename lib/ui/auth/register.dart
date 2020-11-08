part of '../pages.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ViewModelBuilder<RegisterViewmodel>.reactive(
      viewModelBuilder: () => RegisterViewmodel(),
      builder: (context, viewmodel, child) {
        return LifecycleManager(
          viewmodel: viewmodel,
          child: Scaffold(
            appBar: noAppBar,
            resizeToAvoidBottomInset: false,
            body: PageSlider(
              key: viewmodel.sliderKey,
              pages: [
                SelfInformation(viewmodel),
                InstitutionalInformation(viewmodel),
                AccountInformation(viewmodel),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SelfInformation extends ViewModelBuilderWidget<RegisterViewmodel> {
  final RegisterViewmodel viewmodel;
  SelfInformation(this.viewmodel);

  @override
  bool get disposeViewModel => false;

  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  Widget builder(BuildContext context, RegisterViewmodel model, Widget child) {
    return Stack(
      children: [
        body(),
        Align(
          alignment: Alignment(-0.9, -0.9),
          child: SizedBox(
            width: 100.w,
            child: backIcon(context),
          ),
        ),
        Align(
          alignment: Alignment(0.9, 0.9),
          child: Hero(
            tag: "fromLogin",
            child: ActionButton(
              text: "Berikutnya",
              isActive: viewmodel.isSelfInformationValid,
              buttonColor: iconColor4,
              textColor: Colors.black87,
              onClick: viewmodel.next,
            ),
          ),
        ),
      ],
    );
  }

  Widget genderRadio(Gender gender, String title) {
    return Row(
      children: [
        Radio(
          value: gender,
          groupValue: viewmodel.selectedGender,
          onChanged: viewmodel.setGender,
        ),
        Icon(
          (gender == Gender.Pria) ? MdiIcons.genderMale : MdiIcons.genderFemale,
        ),
        TextFormat(
          title,
          fontSize: 44.ssp,
        ),
      ],
    );
  }

  Widget body() {
    return Container(
      width: double.infinity,
      height: 1920.h,
      margin: EdgeInsets.symmetric(horizontal: 52.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 90.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_box_rounded),
              SizedBox(width: 50.w),
              TextFormat(
                'Informasi diri',
                fontWeight: FontWeight.bold,
                fontSize: 44.ssp,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (viewmodel.imageFile == null) {
                viewmodel.getImage();
              } else {
                viewmodel.removeImage();
              }
            },
            child: Container(
              width: 240.w,
              height: 240.w,
              margin: EdgeInsets.only(
                top: 120.h,
                bottom: 90.h,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 6.w,
                  color: iconColor4,
                ),
                image: DecorationImage(
                  image: (viewmodel.imageFile == null)
                      ? AssetImage("$imageAsset/user_pic.png")
                      : FileImage(viewmodel.imageFile),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0, 1.7),
                    child: Image.asset(
                      (viewmodel.imageFile == null)
                          ? "$imageAsset/btn_add_photo.png"
                          : "$imageAsset/btn_del.png",
                      width: 80.w,
                      height: 80.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InputField(
            prefixIcon: Icon(Icons.account_circle),
            hint: "Nama Lengkap",
            textSize: 42.ssp,
            controller: viewmodel.nameController,
            inputType: TextInputType.text,
            validateInput: (value) {
              return viewmodel.checkValue(value, 0);
            },
            maxInput: 30,
          ),
          SizedBox(height: 40.h),
          InputField(
            prefixIcon: Icon(Icons.phone),
            hint: "Nomor Telepon",
            textSize: 42.ssp,
            controller: viewmodel.phoneNumberController,
            inputType: TextInputType.number,
            validateInput: viewmodel.checkPNumber,
            maxInput: 13,
          ),
          SizedBox(height: 50.h),
          TextFormat(
            "Jenis Kelamin",
            fontSize: 42.ssp,
            fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              genderRadio(Gender.Pria, "Pria"),
              genderRadio(Gender.Wanita, "Wanita"),
              SizedBox(width: 10.w),
            ],
          ),
          SizedBox(height: 90.h),
        ],
      ),
    );
  }

  @override
  RegisterViewmodel viewModelBuilder(BuildContext context) => viewmodel;
}

class InstitutionalInformation
    extends ViewModelBuilderWidget<RegisterViewmodel> {
  final RegisterViewmodel viewmodel;
  InstitutionalInformation(this.viewmodel);

  @override
  bool get disposeViewModel => false;

  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  Widget builder(BuildContext context, RegisterViewmodel model, Widget child) {
    return Stack(
      children: [
        body(),
        Align(
          alignment: Alignment(-0.9, -0.9),
          child: SizedBox(
            width: 100.w,
            child: backIcon(
              context,
              onTap: viewmodel.pref,
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.9, 0.9),
          child: ActionButton(
            text: "Berikutnya",
            isActive: viewmodel.isInstitutionalInformationValid,
            buttonColor: iconColor4,
            textColor: Colors.black87,
            onClick: viewmodel.next,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Container(
      width: double.infinity,
      height: 1920.h,
      margin: EdgeInsets.symmetric(horizontal: 52.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 90.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.domain),
              SizedBox(width: 50.w),
              TextFormat(
                'Informasi institusi',
                fontWeight: FontWeight.bold,
                fontSize: 44.ssp,
              ),
            ],
          ),
          SizedBox(height: 180.h),
          InputField(
            prefixIcon: Icon(Icons.apartment),
            hint: "Institusi",
            textSize: 42.ssp,
            controller: viewmodel.institutionalController,
            inputType: TextInputType.text,
            validateInput: (value) {
              return viewmodel.checkValue(value, 1);
            },
          ),
          SizedBox(height: 90.h),
          InputField(
            prefixIcon: Icon(MdiIcons.sealVariant),
            hint: "Jabatan",
            textSize: 42.ssp,
            controller: viewmodel.positionController,
            inputType: TextInputType.number,
            validateInput: (value) {
              return viewmodel.checkValue(value, 2);
            },
          ),
          SizedBox(height: 90.h),
          InputField(
            prefixIcon: Icon(Icons.place),
            hint: "Lokasi",
            textSize: 42.ssp,
            controller: viewmodel.placeController,
            inputType: TextInputType.number,
            validateInput: (value) {
              return viewmodel.checkValue(value, 3);
            },
          ),
        ],
      ),
    );
  }

  @override
  RegisterViewmodel viewModelBuilder(BuildContext context) => viewmodel;
}

class AccountInformation extends ViewModelBuilderWidget<RegisterViewmodel> {
  final RegisterViewmodel viewmodel;
  AccountInformation(this.viewmodel);

  @override
  bool get disposeViewModel => false;

  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  Widget builder(BuildContext context, RegisterViewmodel model, Widget child) {
    return Stack(
      children: [
        body(),
        Align(
          alignment: Alignment(-0.9, -0.9),
          child: SizedBox(
            width: 100.w,
            child: backIcon(
              context,
              onTap: viewmodel.pref,
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.9),
          child: ActionButton(
            text: "Daftarkan Saya",
            isActive: viewmodel.isAccountInformationValid,
            buttonColor: iconColor4,
            textColor: Colors.black87,
            onClick: viewmodel.next,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Container(
      width: double.infinity,
      height: 1920.h,
      margin: EdgeInsets.symmetric(horizontal: 52.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 90.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle_rounded),
              SizedBox(width: 50.w),
              TextFormat(
                'Informasi akun',
                fontWeight: FontWeight.bold,
                fontSize: 44.ssp,
              ),
            ],
          ),
          SizedBox(height: 180.h),
          InputField(
            prefixIcon: Icon(Icons.alternate_email),
            hint: "Email",
            textSize: 42.ssp,
            controller: viewmodel.emailController,
            inputType: TextInputType.text,
            validateInput: viewmodel.checkEmail,
          ),
          SizedBox(height: 90.h),
          InputField(
            prefixIcon: Icon(MdiIcons.lock),
            hint: "Kata Sandi",
            textSize: 42.ssp,
            controller: viewmodel.passwordController,
            inputType: TextInputType.number,
            validateInput: viewmodel.checkPassword,
          ),
          SizedBox(height: 90.h),
          InputField(
            prefixIcon: Icon(Icons.lock),
            hint: "Konfirmasi Kata Sandi",
            textSize: 42.ssp,
            controller: viewmodel.confirmPasswordController,
            inputType: TextInputType.number,
            validateInput: viewmodel.checkCofirmPassword,
          ),
        ],
      ),
    );
  }

  @override
  RegisterViewmodel viewModelBuilder(BuildContext context) => viewmodel;
}
