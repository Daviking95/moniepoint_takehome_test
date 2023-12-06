part of 'package:peerlendly/modules/profile/exports.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

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
                      title: "Get Help",
                      isTitle: true,
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontHeadlineSmall,
                    ),
                    PLVSpace(4),
                    PLTextWidget(
                      title: "Get support or send feedback",
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontLabelSmall,
                    ),
                    PLVSpace(24),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: PLAssets.callUs,
                          title: "Call Us",
                          desc: strAppSecurityDesc,
                          func: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CallUsScreen(),
                              withNavBar: false,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          }),
                    ]),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: PLAssets.chatUs,
                          title: "Chat With Us",
                          desc: strAppSecurityDesc,
                          func: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const SupportScreen(),
                              withNavBar: false,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          }),
                    ]),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: PLAssets.faq,
                          title: "FAQs",
                          desc: strAppSecurityDesc,
                          func: () {
                            // PersistentNavBarNavigator.pushNewScreen(
                            //   context,
                            //   screen: const ProfileDetailsScreen(),
                            //   withNavBar: false,
                            //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            // );
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
