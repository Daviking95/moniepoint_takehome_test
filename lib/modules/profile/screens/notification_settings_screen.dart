part of 'package:peerlendly/modules/profile/exports.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

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
              child: SingleChildScrollView(
                child: PLPaddedWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLVSpace(48),
                      PLBackIcon(
                          onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : AppNavigator.pushAndRemoveUtil(const ProfileScreen()),
                          title: strNotifications),
                      PLVSpace(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PLTextWidget(
                            title: strPushNotification,
                            fontWeight: FontWeight.w600,
                          ),
                          FlutterSwitch(
                            width: 40.0,
                            height: 20.0,
                            valueFontSize: 25.0,
                            toggleSize: 15.0,
                            value: profileWatcher.pushNotificationToggle,
                            borderRadius: 30.0,
                            padding: 2.0,
                            showOnOff: true,
                            activeColor: PLColors.appPrimaryColorMain500,
                            onToggle: (val) {
                              profileWatcher.pushNotificationToggle = !profileWatcher.pushNotificationToggle;
                            },
                          )
                        ],
                      ),
                      PLVSpace(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PLTextWidget(
                            title: strInAppNotification,
                            fontWeight: FontWeight.w600,
                          ),
                          FlutterSwitch(
                            width: 40.0,
                            height: 20.0,
                            valueFontSize: 25.0,
                            toggleSize: 15.0,
                            value: profileWatcher.pushInAppNotificationToggle,
                            borderRadius: 30.0,
                            padding: 2.0,
                            showOnOff: true,
                            activeColor: PLColors.appPrimaryColorMain500,
                            onToggle: (val) {
                              profileWatcher.pushInAppNotificationToggle = !profileWatcher.pushInAppNotificationToggle;
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
