part of 'package:peerlendly/modules/profile/exports.dart';

class AppSecurityScreen extends StatelessWidget {
  const AppSecurityScreen({Key? key}) : super(key: key);

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
                          title: strAppSecurity),
                      PLVSpace(16),
                      ProfileItemCard(profileItems: [
                        ProfileItem(
                            icon: PLAssets.logoPng,
                            title: strChangeManagerID,
                            desc: strAppSecurityDesc,
                            func: () {
                              modalBottomSheet(context, const ChangeManagerIdScreen(), true, context.height / 1.5);

                            }),
                      ]),
                      ProfileItemCard(profileItems: [
                        ProfileItem(
                            icon: PLAssets.appChangePasswordIcon,
                            title: strChangePassword,
                            desc: strAppSecurityDesc,
                            func: () {
                              modalBottomSheet(context, const ChangePasswordScreen(), true, context.height / 1.5);

                            }),
                      ]),
                      ProfileItemCard(profileItems: [
                        ProfileItem(
                            icon: PLAssets.appChangePinIcon,
                            title: strChangePin,
                            desc: strAppSecurityDesc,
                            func: () {
                              modalBottomSheet(context, const ChangePinScreen(), true, context.height / 1.5);

                            }),
                      ]),
                      ProfileItemCard(profileItems: [
                        ProfileItem(
                            icon: PLAssets.appChangePhoneNumberIcon,
                            title: strChangePhoneNumber,
                            desc: strAppSecurityDesc,
                            func: () {
                              modalBottomSheet(context, const ChangePhoneNumberScreen(), true, context.height / 1.5);

                            }),
                      ]),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
