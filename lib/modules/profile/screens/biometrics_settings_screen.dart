part of 'package:nova/modules/profile/exports.dart';

class BiometricsSettingsScreen extends StatelessWidget {
  const BiometricsSettingsScreen({Key? key}) : super(key: key);

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
              child: SingleChildScrollView(
                child: NovaPaddedWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaVSpace(48),
                      NovaBackIcon(
                          onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : AppNavigator.pushAndRemoveUtil(const ProfileScreen()),
                          title: strBiometrics),
                      NovaVSpace(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NovaTextWidget(
                            title: strLoginBiometrics,
                            fontWeight: FontWeight.w600,
                          ),
                          FlutterSwitch(
                            width: 40.0,
                            height: 20.0,
                            valueFontSize: 25.0,
                            toggleSize: 15.0,
                            value: profileWatcher.loginBiometricsToggle,
                            borderRadius: 30.0,
                            padding: 2.0,
                            showOnOff: true,
                            activeColor: NovaColors.appPrimaryColorMain500,
                            onToggle: (val) {
                              profileWatcher.loginBiometricsToggle = !profileWatcher.loginBiometricsToggle;
                            },
                          )
                        ],
                      ),
                      NovaVSpace(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NovaTextWidget(
                            title: strTransferBiometrics,
                            fontWeight: FontWeight.w600,
                          ),
                          FlutterSwitch(
                            width: 40.0,
                            height: 20.0,
                            valueFontSize: 25.0,
                            toggleSize: 15.0,
                            value: profileWatcher.transferBiometricsToggle,
                            borderRadius: 30.0,
                            padding: 2.0,
                            showOnOff: true,
                            activeColor: NovaColors.appPrimaryColorMain500,
                            onToggle: (val) {
                              profileWatcher.transferBiometricsToggle = !profileWatcher.transferBiometricsToggle;
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
