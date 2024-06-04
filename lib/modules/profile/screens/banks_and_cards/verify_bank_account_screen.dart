part of 'package:nova/modules/profile/exports.dart';

class VerifyBankAccountScreen extends StatelessWidget {
  const VerifyBankAccountScreen({Key? key}) : super(key: key);

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
                      title: "Verify your Bank Account",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineSmall,
                    ),
                    NovaVSpace(16),
                    ProfileItemCard(profileItems: [
                      ProfileItem(
                          icon: NovaAssets.monoIcon,
                          title: "Verify with Mono",
                          desc: strHelpSupportDesc,
                          func: () {
                            MonoFlutter().launch(
                              context,
                              dotenv.env['MONO_PUBLIC_KEY'] ?? "",
                              reference: DateTime.now().millisecondsSinceEpoch.toString(),
                              config: {
                                "selectedInstitution": {
                                  "id": "5f2d08bf60b92e2888287703",
                                  "auth_method": "internet_banking"
                                }
                              },
                              onEvent: (event, data) {
                                print('event: $event, data: $data');
                              },
                              onClosed: () {
                                print('Modal closed');
                              },
                              onLoad: () {
                                print('Mono loaded successfully');
                              },
                              onSuccess: (code) {
                                print('Mono Success $code');
                              },
                            );
                          }),
                    ]),
                    // ProfileItemCard(profileItems: [
                    //   ProfileItem(
                    //       icon: PLAssets.okraIcon,
                    //       title: "Verify with Okra",
                    //       desc: strHelpSupportDesc,
                    //       func: () {
                    //         // PersistentNavBarNavigator.pushNewScreen(
                    //         //   context,
                    //         //   screen: const CardAccountsList(),
                    //         //   withNavBar: false,
                    //         //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    //         // );
                    //       }),
                    // ]),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
