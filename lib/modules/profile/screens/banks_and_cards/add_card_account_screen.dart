part of 'package:peerlendly/modules/profile/exports.dart';

class AddCardAccountScreen extends StatefulWidget {
  const AddCardAccountScreen({Key? key}) : super(key: key);

  @override
  State<AddCardAccountScreen> createState() => _AddCardAccountScreenState();
}

class _AddCardAccountScreenState extends State<AddCardAccountScreen> {
  String cardNumber = "";
  String cardHolderName = "";
  String expiryDate = "";

  late ProfileProvider profileProvider;

  PLCardType cardType = PLCardType.Invalid;

  void getCardTypeFrmNumber() {
    if (profileProvider.cardNumber.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(profileProvider.cardNumber.text);
      PLCardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileProvider = Provider.of<ProfileProvider>(context, listen: false).defaultAllToEmpty();

      profileProvider.cardNumber.addListener(
            () {
          getCardTypeFrmNumber();
        },
      );
    });
  }

  @override
  void dispose() {
    // cardNumber.dispose();
    // cvvCode.dispose();
    // cardHolderName.dispose();
    // expiryDate.dispose();
    super.dispose();
  }

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
                child: EasyDebounceBuilder(
                    delay: const Duration(milliseconds: 1000),
                    builder: (context, debounce) {
                    return SingleChildScrollView(
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
                            title: "Add Card",
                            isTitle: true,
                            textStyle: PLTypography.textHeadlineMediumStyle,
                            textSize: PLTypography.fontHeadlineSmall,
                          ),
                          PLVSpace(8),
                          PLTextWidget(
                            title: "Kindly enter your card details",
                            textColor: PLColors.appGrayText,
                            textStyle: PLTypography.textHeadlineMediumStyle,
                            textSize: PLTypography.fontLabelSmall,
                          ),
                          PLVSpace(24),
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
                                  title: cardNumber,
                                  textStyle: PLTypography.textTitleLargeStyle,
                                  textColor: PLColors.appPrimaryText,
                                  textSize: PLTypography.fontBodyMedium,
                                  fontWeight: FontWeight.w700,
                                ),
                                PLVSpace(12),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                          title: cardHolderName,
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appGrayText,
                                          textSize: PLTypography.fontBodyMedium,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        PLTextWidget(
                                          title: "Exp Date",
                                          textStyle:
                                              PLTypography.textTitleLargeStyle,
                                          textColor: PLColors.appGrayText,
                                          textSize: PLTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        PLTextWidget(
                                          title: expiryDate,
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
                          PLVSpace(40),
                          Form(
                            key: profileWatcher.addCardFormKey,
                            child: Column(
                              children: [
                                PLPrimaryTextField(
                                  textInputType: TextInputType.number,
                                  controller: profileWatcher.cardNumber,
                                  fillColor: PLColors.appWhiteColor,
                                  onChange: (val){
                                    profileWatcher.listenForAddCardChanges();

                                    setState(() {
                                      cardNumber = val;
                                    });
                                  },
                                  validation: (val) => CardUtils.validateCardNum(val),
                                  hintText: "Card Number",
                                  formatter: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(19),
                                    CardNumberInputFormatter()
                                  ],
                                  // suffixIcon: CardUtils.getCardIcon(cardType),
                                ),
                                PLPrimaryTextField(
                                  textInputType: TextInputType.text,
                                  controller: profileWatcher.cardHolderName,
                                  fillColor: PLColors.appWhiteColor,
                                  onChange: (val){
                                    profileWatcher.listenForAddCardChanges();

                                    setState(() {
                                      cardHolderName = val;
                                    });
                                  },
                                  hintText: "Card Name",
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: PLPrimaryTextField(
                                        textInputType: TextInputType.number,
                                        controller: profileWatcher.cvvCode,
                                        fillColor: PLColors.appWhiteColor,
                                        onChange: (val){
                                          profileWatcher.listenForAddCardChanges();

                                          // setState(() {
                                          //   cardNumber = val;
                                          // });
                                        },
                                        validation: (val) => CardUtils.validateCVV(val),
                                        hintText: "CVV",
                                        formatter: [
                                          FilteringTextInputFormatter.digitsOnly,
                                          LengthLimitingTextInputFormatter(5),
                                        ],
                                      )
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: PLPrimaryTextField(
                                        textInputType: TextInputType.number,
                                        controller: profileWatcher.expiryDate,
                                        fillColor: PLColors.appWhiteColor,
                                        onChange: (val){
                                          profileWatcher.listenForAddCardChanges();

                                          setState(() {
                                            expiryDate = val;
                                          });
                                        },
                                        validation: (val) => CardUtils.validateDate(val),
                                        hintText: "MM/YY",
                                        formatter: [
                                          FilteringTextInputFormatter.digitsOnly,
                                          LengthLimitingTextInputFormatter(5),
                                          CardMonthInputFormatter()
                                        ],
                                      )
                                    ),
                                  ],
                                ),
                                PLVSpace(32),
                                PLButtonRound(
                                  textTitle: "Add Card",
                                  isFormValidated: profileWatcher.isAddCardFormValidated,
                                  isLoader: profileWatcher.isLoading,
                                  loadingString: profileWatcher.loadingString,
                                  borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                                  functionToRun: () => profileWatcher.addCardDetails(context),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                ),
              )),
        ),
      ),
    );
  }
}
