part of 'package:peerlendly/modules/authentication/signup/exports.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignupProvider>(
      vmBuilder: (context) =>
          SignupProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, SignupProvider model) {
    return AppBaseWidget(
      iconSet: PLImagePng(
        imgPath: PLAssets.phoneWalletInHand,
        width: 150.w,
        height: 180.h,
        boxFit: BoxFit.contain,
      ),
      buildWidget: const EmailAddressWidget(),
      topHeight: 250.h,
    );
  }
}
