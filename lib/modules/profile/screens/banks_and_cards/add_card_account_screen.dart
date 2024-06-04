part of 'package:nova/modules/profile/exports.dart';

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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: EasyDebounceBuilder(
                    delay: const Duration(milliseconds: 1000),
                    builder: (context, debounce) {
                    return SingleChildScrollView(
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
                            title: "Add Card",
                            isTitle: true,
                            textStyle: NovaTypography.textHeadlineMediumStyle,
                            textSize: NovaTypography.fontHeadlineSmall,
                          ),
                          NovaVSpace(8),
                          NovaTextWidget(
                            title: "Kindly enter your card details",
                            textColor: NovaColors.appGrayText,
                            textStyle: NovaTypography.textHeadlineMediumStyle,
                            textSize: NovaTypography.fontLabelSmall,
                          ),
                          NovaVSpace(24),
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
                                  title: cardNumber,
                                  textStyle: NovaTypography.textTitleLargeStyle,
                                  textColor: NovaColors.appPrimaryText,
                                  textSize: NovaTypography.fontBodyMedium,
                                  fontWeight: FontWeight.w700,
                                ),
                                NovaVSpace(12),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                          title: cardHolderName,
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appGrayText,
                                          textSize: NovaTypography.fontBodyMedium,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        NovaTextWidget(
                                          title: "Exp Date",
                                          textStyle:
                                              NovaTypography.textTitleLargeStyle,
                                          textColor: NovaColors.appGrayText,
                                          textSize: NovaTypography.fontLabelSmall,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        NovaTextWidget(
                                          title: expiryDate,
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
                          NovaVSpace(40),
                          Form(
                            key: profileWatcher.addCardFormKey,
                            child: Column(
                              children: [
                                NovaPrimaryTextField(
                                  textInputType: TextInputType.number,
                                  controller: profileWatcher.cardNumber,
                                  fillColor: NovaColors.appWhiteColor,
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
                                NovaPrimaryTextField(
                                  textInputType: TextInputType.text,
                                  controller: profileWatcher.cardHolderName,
                                  fillColor: NovaColors.appWhiteColor,
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
                                      child: NovaPrimaryTextField(
                                        textInputType: TextInputType.number,
                                        controller: profileWatcher.cvvCode,
                                        fillColor: NovaColors.appWhiteColor,
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
                                      child: NovaPrimaryTextField(
                                        textInputType: TextInputType.number,
                                        controller: profileWatcher.expiryDate,
                                        fillColor: NovaColors.appWhiteColor,
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
                                NovaVSpace(32),
                                NovaButtonRound(
                                  textTitle: "Add Card",
                                  isFormValidated: profileWatcher.isAddCardFormValidated,
                                  isLoader: profileWatcher.isLoading,
                                  loadingString: profileWatcher.loadingString,
                                  borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
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
