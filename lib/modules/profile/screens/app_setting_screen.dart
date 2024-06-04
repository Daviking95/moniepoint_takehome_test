part of 'package:nova/modules/profile/exports.dart';

class AppSettingScreen extends StatelessWidget {
  const AppSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(48),
                    NovaBackIcon(
                      onTap: () => Navigator.pop(context),
                    ),
                    NovaVSpace(8),
                    NovaTextWidget(
                      title: "Settings",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineSmall,
                    ),
                    NovaVSpace(24),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: NovaAssets.faceId,
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
                            activeColor: NovaColors.appPrimaryColorMain500,
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
                          icon: NovaAssets.transactionPin,
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
