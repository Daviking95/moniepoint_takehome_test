part of 'package:peerlendly/modules/wallet/exports.dart';

class FundWalletPopUp extends StatefulWidget {
  final double amount;

  const FundWalletPopUp({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  _FundWalletPopUpState createState() => _FundWalletPopUpState();
}

class _FundWalletPopUpState extends State<FundWalletPopUp> {
  var publicKey = dotenv.env['YOUR_PAYSTACK_PUBLIC_KEY'];
  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey!);
  }

  @override
  Widget build(BuildContext context) {
    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(12),
          const PLImageSvg(svgPath: PLAssets.warningIcon),
          PLVSpace(24),
          PLTextWidget(
            title: 'You are about to fund your wallet with',
            textSize: PLTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: PLColors.appGrayText,
          ),
          PLVSpace(4),
          PLTextWidget(
            title: widget.amount.toString().formatWithCommasAndDecimals(),
            textStyle: PLTypography.textTitleSmallStyle,
            textSize: PLTypography.fontBodyMedium,
            fontWeight: FontWeight.w600,
            textColor: PLColors.appPrimaryText,
            maxLines: 1,
            isCurrency: true,
          ),
          PLVSpace(24),
          Container(
            decoration: BoxDecoration(
                borderRadius:
                PLDecorations.borderRadiusGeometryCircular8,
                color: PLColors.appPrimaryColorMain500
                    .withOpacity(.05)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PLImageSvg(svgPath: PLAssets.infoIcon),
                PLHSpace(8),
                Expanded(
                  child: PLTextWidget(
                    title: 'We use PayStack. PayStack charges 1.5% + N100, up to N2,000 for every transaction.',
                    textStyle: PLTypography.textTitleLargeStyle,
                    textColor: PLColors.appGrayText,
                    textSize: PLTypography.fontLabelSmall,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16),
          ),
          PLVSpace(24),
          Row(
            children: [
              Expanded(
                child: PLButtonOutline(
                  borderColor: PLColors.appPrimaryColorMain500,
                  borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                  textTitle: "No cancel",
                  functionToRun: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              PLHSpace(16),
              Expanded(
                child: PLButtonRound(
                    textTitle: "Yes fund",
                    borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                    functionToRun: () {
                      Navigator.pop(context);

                      _paystackCharge(context);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  _paystackCharge(BuildContext context) async {
    Charge charge = Charge()
      ..amount = widget.amount.toInt() * 100
      ..reference = "ieuwiueiwui2342323"
      // or ..accessCode = _getAccessCodeFrmInitialization()
      ..email = 'customer@email.com';
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );

    "PaystackResponse ${response.status}".logger();

    // if (response.status) {
    //   widget.loanWatcher.processPayment(context);
    // }
  }
}
