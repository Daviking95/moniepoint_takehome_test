part of 'package:nova/modules/profile/exports.dart';

class CardAccountsList extends StatefulWidget {
  const CardAccountsList({Key? key}) : super(key: key);

  @override
  State<CardAccountsList> createState() => _CardAccountsListState();
}

class _CardAccountsListState extends State<CardAccountsList> {
  late ProfileProvider myProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myProvider = Provider.of<ProfileProvider>(context, listen: false);
      myProvider.getCardDetails();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myProvider.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Navigator.canPop(context)
            ? Future.value(true)
            : Future.value(false),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: RefreshIndicator(
                  onRefresh: () {
                    return myProvider.getCardDetails();
                  },
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
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
                          title: "Cards",
                          isTitle: true,
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontHeadlineSmall,
                        ),
                        for (var i = 0;
                            i < profileWatcher.cardDetail.length;
                            i++) ...[
                          NovaVSpace(24),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    // boxShadow: [PLDecorations.customShadow],
                                    borderRadius:
                                        NovaDecorations.borderRadiusGeometryCircular8,
                                    color: NovaColors.appWhiteColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    NovaVSpace(16),
                                    NovaImagePng(imgPath: NovaAssets.chipCard),
                                    NovaVSpace(40),
                                    NovaTextWidget(
                                      title:
                                      "**** **** **** ${profileWatcher
                                          .cardDetail[i].cardNumber.substring(profileWatcher
                                          .cardDetail[i].cardNumber.length - 6, profileWatcher
                                          .cardDetail[i].cardNumber.length, )}",
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryText,
                                      textSize: NovaTypography.fontBodyMedium,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    NovaVSpace(12),
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            NovaTextWidget(
                                              title: "Card Holder",
                                              textStyle:
                                                  NovaTypography.textTitleLargeStyle,
                                              textColor: NovaColors.appGrayText,
                                              textSize: NovaTypography.fontLabelSmall,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            NovaTextWidget(
                                              title: profileWatcher
                                                  .cardDetail[i].cardName,
                                              textStyle:
                                                  NovaTypography.textTitleLargeStyle,
                                              textColor: NovaColors.appGrayText,
                                              textSize: NovaTypography.fontBodyMedium,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            NovaTextWidget(
                                              title: "Card Holder",
                                              textStyle:
                                                  NovaTypography.textTitleLargeStyle,
                                              textColor: NovaColors.appGrayText,
                                              textSize: NovaTypography.fontLabelSmall,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            NovaTextWidget(
                                              title: profileWatcher
                                                  .cardDetail[i].expiryDate,
                                              textStyle:
                                                  NovaTypography.textTitleLargeStyle,
                                              textColor: NovaColors.appGrayText,
                                              textSize: NovaTypography.fontBodyMedium,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 16, vertical: 12),
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                      showAlertDialog(
                                          context,
                                          '',
                                          RemoveBankCardPopup(
                                              id: profileWatcher
                                                  .cardDetail[i].cardId.toString(), isCard: true));
                                    },
                                    child: const Icon(
                                      Icons.cancel_rounded,
                                      color: NovaColors.appPrimaryColorMain500,
                                      size: 25,
                                    ),
                                  ))
                            ],
                          ),
                        ],
                        NovaVSpace(24),
                        InkWell(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const AddCardAccountScreen(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child:
                                const NovaImagePng(imgPath: NovaAssets.addCardAccount)),
                        NovaVSpace(24),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
