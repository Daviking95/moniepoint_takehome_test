part of 'package:peerlendly/modules/profile/exports.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Future.value(true),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: PLScaffold(
          appBarWidget: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: PLColors.appWhiteColor,
            elevation: 0,
            title: Column(
              children: [
                PLVSpace(12),
                PLBackIcon(
                    onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : AppNavigator.pushAndRemoveUtil(const ProfileScreen()),
                    title: strHelpSupport),
              ],
            ),
          ),
          body: Tawk(
            directChatLink: dotenv.get('TAWKTO_CHAT_LINK'),
            visitor: TawkVisitor(
              name: "${UserData.getUserProfileResponseModel?.fullName ?? ''}",
              email: "${UserData.getUserProfileResponseModel?.emailAddress ?? ''}",
            ),
          ),
        ),
      ),
    );
  }
}
