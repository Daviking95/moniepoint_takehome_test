part of 'package:nova/modules/wallet/exports.dart';


class BillsPaymentPopup extends StatelessWidget {
  final double amount;
  final Function() callback;

  const BillsPaymentPopup({
    Key? key,
    required this.amount,
    required this.callback,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
            body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NovaVSpace(12),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                      child: const NovaImageSvg(svgPath: NovaAssets.cancelIcon)),
                ),
                NovaVSpace(24),
                NovaTextWidget(
                  title: amount.toString().formatWithCommasAndDecimals(),
                  textStyle: NovaTypography.textTitleSmallStyle,
                  textSize: NovaTypography.fontHeadlineLarge,
                  fontFamily: NovaTypography.fontFamilyBold,
                  fontWeight: FontWeight.w600,
                  textColor: NovaColors.appPrimaryText,
                  maxLines: 1,
                  isCurrency: true,
                ),
                NovaVSpace(24),
                _loanDetailsItem(
                    'Provider',
                    NovaTextWidget(
                      title: "IKEDC",
                      textStyle: NovaTypography.textTitleLargeStyle,
                      textColor: NovaColors.appPrimaryText,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      textSize: NovaTypography.fontTitleLarge,
                    )),
                _loanDetailsItem(
                    'Package',
                    NovaTextWidget(
                      title: "Prepaid",
                      textStyle: NovaTypography.textTitleLargeStyle,
                      textColor: NovaColors.appPrimaryText,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      textSize: NovaTypography.fontTitleLarge,
                    )),
                _loanDetailsItem(
                    'Reference Number',
                    NovaTextWidget(
                      title: "1232323",
                      textStyle: NovaTypography.textTitleLargeStyle,
                      textColor: NovaColors.appPrimaryText,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      textSize: NovaTypography.fontTitleLarge,
                    )),
                _loanDetailsItem(
                    'Meter Number',
                    NovaTextWidget(
                      title: "54232323",
                      textStyle: NovaTypography.textTitleLargeStyle,
                      textColor: NovaColors.appPrimaryText,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      textSize: NovaTypography.fontTitleLarge,
                    )),
                _loanDetailsItem(
                    'Mobile Number',
                    NovaTextWidget(
                      title: "08062626262",
                      textStyle: NovaTypography.textTitleLargeStyle,
                      textColor: NovaColors.appPrimaryText,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      textSize: NovaTypography.fontTitleLarge,
                    )),

                _loanDetailsItem(
                    'Amount',
                    NovaTextWidget(
                      title: 20000.toString().formatWithCommasAndDecimals(),
                      textStyle: NovaTypography.textTitleLargeStyle,
                      textColor: NovaColors.appPrimaryText,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      textSize: NovaTypography.fontTitleLarge,
                      isCurrency: true,
                    )),
                _loanDetailsItem(
                    'Transaction Fee',
                    NovaTextWidget(
                      title: 200.toString().formatWithCommasAndDecimals(),
                      textStyle: NovaTypography.textTitleLargeStyle,
                      textColor: NovaColors.appPrimaryText,
                      fontFamily: NovaTypography.fontFamilyMedium,
                      textSize: NovaTypography.fontTitleLarge,
                      isCurrency: true,

                    )),
                NovaVSpace(16),
                AccountBalanceSnippet(),
                NovaVSpace(32),
                NovaButtonRound(
                  textTitle: "Confirm",
                  borderRadius:
                  NovaDecorations.borderRadiusGeometryCircular8,
                  hasBgImg: true,
                  functionToRun: () {
                    callback();
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  _loanDetailsItem(String title, Widget child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NovaTextWidget(
          title: title,
          textStyle: NovaTypography.textTitleLargeStyle,
          textColor: NovaColors.appGrayText,
          textSize: NovaTypography.fontDesc18,
        ),
        child
      ],
    ).marginSymmetric(vertical: 10);
  }
}
