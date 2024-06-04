part of 'package:nova/modules/profile/exports.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Future.value(true),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: NovaScaffold(
          appBarWidget: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: NovaColors.appWhiteColor,
            elevation: 0,
            title: Column(
              children: [
                NovaVSpace(12),
                NovaBackIcon(
                    onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : AppNavigator.pushAndRemoveUtil(const ProfileScreen()),
                    title: strHelpSupport),
              ],
            ),
          ),
          body: Tawk(
            directChatLink: dotenv.get('TAWKTO_CHAT_LINK'),
            visitor: TawkVisitor(
              name: "${AppData.getUserProfileResponseModel?.fullName ?? ''}",
              email: "${AppData.getUserProfileResponseModel?.emailAddress ?? ''}",
            ),
          ),
        ),
      ),
    );
  }
}
