part of 'package:nova/modules/profile/exports.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                      title: "Get Help",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineSmall,
                    ),
                    NovaVSpace(4),
                    NovaTextWidget(
                      title: "Get support or send feedback",
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontLabelSmall,
                    ),
                    NovaVSpace(24),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: NovaAssets.callUs,
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
                          icon: NovaAssets.chatUs,
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
                          icon: NovaAssets.faq,
                          title: "FAQs",
                          desc: strAppSecurityDesc,
                          func: () {
                            // https://nova.com/faqs/

                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: WebViewWidget("https://nova.com/faqs/", "FAQs"),
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
