part of 'package:nova/modules/profile/exports.dart';

class AppSecurityScreen extends StatelessWidget {
  const AppSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                          title: strAppSecurity),
                      NovaVSpace(16),
                      ProfileItemCard(profileItems: [
                        ProfileItem(
                            icon: NovaAssets.logoPng,
                            title: strChangeManagerID,
                            desc: strAppSecurityDesc,
                            func: () {
                              modalBottomSheet(context, const ChangeManagerIdScreen(), true, context.height / 1.5);

                            }),
                      ]),
                      ProfileItemCard(profileItems: [
                        ProfileItem(
                            icon: NovaAssets.appChangePasswordIcon,
                            title: strChangePassword,
                            desc: strAppSecurityDesc,
                            func: () {
                              modalBottomSheet(context, const ChangePasswordScreen(), true, context.height / 1.5);

                            }),
                      ]),
                      ProfileItemCard(profileItems: [
                        ProfileItem(
                            icon: NovaAssets.appChangePinIcon,
                            title: strChangePin,
                            desc: strAppSecurityDesc,
                            func: () {
                              modalBottomSheet(context, const ChangePinScreen(), true, context.height / 1.5);

                            }),
                      ]),
                      ProfileItemCard(profileItems: [
                        ProfileItem(
                            icon: NovaAssets.appChangePhoneNumberIcon,
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
