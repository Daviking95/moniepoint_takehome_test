part of 'package:peerlendly/modules/profile/exports.dart';

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
    final profileReader = context.read<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Navigator.canPop(context)
            ? Future.value(true)
            : Future.value(false),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
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
                        PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        PLVSpace(8),
                        PLTextWidget(
                          title: "Cards",
                          isTitle: true,
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontHeadlineSmall,
                        ),
                        for (var i = 0;
                            i < profileWatcher.cardDetail.length;
                            i++) ...[
                          PLVSpace(24),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    // boxShadow: [PLDecorations.customShadow],
                                    borderRadius:
                                        PLDecorations.borderRadiusGeometryCircular8,
                                    color: PLColors.appWhiteColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PLVSpace(16),
                                    PLImagePng(imgPath: PLAssets.chipCard),
                                    PLVSpace(40),
                                    PLTextWidget(
                                      title:
                                      "**** **** **** ${profileWatcher
                                          .cardDetail[i].cardNumber.substring(profileWatcher
                                          .cardDetail[i].cardNumber.length - 6, profileWatcher
                                          .cardDetail[i].cardNumber.length, )}",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryText,
                                      textSize: PLTypography.fontBodyMedium,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    PLVSpace(12),
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PLTextWidget(
                                              title: "Card Holder",
                                              textStyle:
                                                  PLTypography.textTitleLargeStyle,
                                              textColor: PLColors.appGrayText,
                                              textSize: PLTypography.fontLabelSmall,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            PLTextWidget(
                                              title: profileWatcher
                                                  .cardDetail[i].cardName,
                                              textStyle:
                                                  PLTypography.textTitleLargeStyle,
                                              textColor: PLColors.appGrayText,
                                              textSize: PLTypography.fontBodyMedium,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            PLTextWidget(
                                              title: "Card Holder",
                                              textStyle:
                                                  PLTypography.textTitleLargeStyle,
                                              textColor: PLColors.appGrayText,
                                              textSize: PLTypography.fontLabelSmall,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            PLTextWidget(
                                              title: profileWatcher
                                                  .cardDetail[i].expiryDate,
                                              textStyle:
                                                  PLTypography.textTitleLargeStyle,
                                              textColor: PLColors.appGrayText,
                                              textSize: PLTypography.fontBodyMedium,
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
                                      color: PLColors.appPrimaryColorMain500,
                                      size: 25,
                                    ),
                                  ))
                            ],
                          ),
                        ],
                        PLVSpace(24),
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
                                const PLImagePng(imgPath: PLAssets.addCardAccount)),
                        PLVSpace(24),
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
