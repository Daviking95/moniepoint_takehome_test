part of 'package:peerlendly/modules/profile/exports.dart';

class BankAndCardsScreen extends StatelessWidget {
  const BankAndCardsScreen({Key? key}) : super(key: key);

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
                      title: "Accounts",
                      isTitle: true,
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontHeadlineSmall,
                    ),
                    PLVSpace(16),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: PLAssets.bankAccountIcon,
                          title: "Manage Bank Account",
                          desc: strHelpSupportDesc,
                          func: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const BankAccountsList(),
                              withNavBar: false,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          }),
                    ]),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: PLAssets.cardAccountIcon,
                          title: "Manage Cards",
                          desc: strHelpSupportDesc,
                          func: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const CardAccountsList(),
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
