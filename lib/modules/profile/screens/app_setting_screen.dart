part of 'package:peerlendly/modules/profile/exports.dart';

class AppSettingScreen extends StatelessWidget {
  const AppSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();
    final profileReader = context.read<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PLVSpace(48),
                    PLBackIcon(
                      onTap: () => Navigator.pop(context),
                    ),
                    PLVSpace(8),
                    PLTextWidget(
                      title: "Settings",
                      isTitle: true,
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontHeadlineSmall,
                    ),
                    PLVSpace(24),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: PLAssets.faceId,
                          title: "Biometric Login",
                          suffixIcon: FlutterSwitch(
                            width: 40.0,
                            height: 20.0,
                            valueFontSize: 25.0,
                            toggleSize: 15.0,
                            value: AppPreferences.isFingerPrintAllowedAtLogin,
                            borderRadius: 30.0,
                            padding: 2.0,
                            showOnOff: true,
                            activeColor: PLColors.appPrimaryColorMain500,
                            onToggle: (val) {
                              profileWatcher.loginBiometricsToggle = !profileWatcher.loginBiometricsToggle;
                              AppPreferences.isFingerPrintAllowedAtLogin = !AppPreferences.isFingerPrintAllowedAtLogin;
                            },
                          ),
                          desc: strAppSecurityDesc,
                          func: () {

                          },
                      ),
                    ]),
                    // ProfileItemCard(profileItems: [
                    //   ProfileItem(
                    //       icon: PLAssets.transactionPin,
                    //       title: "Login PIN",
                    //       desc: strAppSecurityDesc,
                    //       func: () {
                    //         PersistentNavBarNavigator.pushNewScreen(
                    //           context,
                    //           screen: const LoginPinChangeScreen(),
                    //           withNavBar: false,
                    //           pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    //         );
                    //       }),
                    // ]),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: PLAssets.transactionPin,
                          title: "Transaction PIN",
                          desc: strAppSecurityDesc,
                          func: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const TransactionPinScreen(),
                              withNavBar: false,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          }),
                    ]),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
