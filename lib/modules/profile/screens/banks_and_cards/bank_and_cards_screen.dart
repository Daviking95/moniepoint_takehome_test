part of 'package:nova/modules/profile/exports.dart';

class BankAndCardsScreen extends StatelessWidget {
  const BankAndCardsScreen({Key? key}) : super(key: key);

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
                      title: "Accounts",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineSmall,
                    ),
                    NovaVSpace(16),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: NovaAssets.bankAccountIcon,
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
                          icon: NovaAssets.cardAccountIcon,
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
