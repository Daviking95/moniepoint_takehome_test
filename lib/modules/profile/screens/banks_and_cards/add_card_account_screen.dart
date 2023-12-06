part of 'package:peerlendly/modules/profile/exports.dart';

class AddCardAccountScreen extends StatefulWidget {
  const AddCardAccountScreen({Key? key}) : super(key: key);

  @override
  State<AddCardAccountScreen> createState() => _AddCardAccountScreenState();
}

class _AddCardAccountScreenState extends State<AddCardAccountScreen> {
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
                child: SingleChildScrollView(
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
                              title: profileWatcher.cardNumber.text,
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
                                      title: profileWatcher.cardHolderName.text,
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
                                      title: "Card Holder",
                                      textStyle:
                                          PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appGrayText,
                                      textSize: PLTypography.fontLabelSmall,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    PLTextWidget(
                                      title: profileWatcher.expiryDate.text,
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
                      CreditCardForm(
                        formKey: profileWatcher.creditCardFormKey,
                        cardNumber: profileWatcher.cardNumber.text,
                        expiryDate: profileWatcher.expiryDate.text,
                        cardHolderName: profileWatcher.cardHolderName.text,
                        cvvCode: profileWatcher.cvvCode.text,
                        // cardNumberKey: cardNumberKey,
                        // cvvCodeKey: cvvCodeKey,
                        // expiryDateKey: expiryDateKey,
                        // cardHolderKey: cardHolderKey,
                        onCreditCardModelChange: (CreditCardModel data) {
                          profileWatcher.cardNumber.text = data.cardNumber;
                          profileWatcher.expiryDate.text = data.expiryDate;
                          profileWatcher.cardHolderName.text =
                              data.cardHolderName;
                          profileWatcher.cvvCode.text = data.cvvCode;

                          setState(() {
                            profileWatcher.listenForAddCardChanges();

                          });
                        },
                        // Required
                        obscureCvv: true,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        enableCvv: true,
                        cvvValidationMessage: 'Please input a valid CVV',
                        dateValidationMessage: 'Please input a valid date',
                        numberValidationMessage: 'Please input a valid number',
                        cardNumberValidator: (String? cardNumber) {
                          return null;
                        },
                        expiryDateValidator: (String? expiryDate) {
                          return null;
                        },
                        cvvValidator: (String? cvv) {
                          return null;
                        },
                        cardHolderValidator: (String? cardHolderName) {
                          return null;
                        },
                        onFormComplete: () {
                          // callback to execute at the end of filling card data
                          "onFormComplete".logger();
                        },
                        autovalidateMode: AutovalidateMode.always,
                        disableCardNumberAutoFillHints: false,
                        inputConfiguration: const InputConfiguration(
                          cardNumberDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                          ),
                          expiryDateDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Holder',
                          ),
                          cardNumberTextStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          cardHolderTextStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          expiryDateTextStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          cvvCodeTextStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      PLVSpace(32),
                      PLButtonRound(
                        textTitle: "Add Card",
                        // isFormValidated: profileWatcher.isAddCardFormValidated,
                        isLoader: profileWatcher.isLoading,
                        loadingString: profileWatcher.loadingString,
                        borderRadius:
                            PLDecorations.borderRadiusGeometryCircular8,
                        functionToRun: () =>
                            profileWatcher.addCardDetails(context),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
