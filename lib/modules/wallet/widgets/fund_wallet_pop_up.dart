part of 'package:nova/modules/wallet/exports.dart';

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
    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          const NovaImageSvg(svgPath: NovaAssets.warningIcon),
          NovaVSpace(24),
          NovaTextWidget(
            title: 'You are about to fund your wallet with',
            textSize: NovaTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: NovaColors.appGrayText,
          ),
          NovaVSpace(4),
          NovaTextWidget(
            title: widget.amount.toString().formatWithCommasAndDecimals(),
            textStyle: NovaTypography.textTitleSmallStyle,
            textSize: NovaTypography.fontBodyMedium,
            fontWeight: FontWeight.w600,
            textColor: NovaColors.appPrimaryText,
            maxLines: 1,
            isCurrency: true,
          ),
          NovaVSpace(24),
          Container(
            decoration: BoxDecoration(
                borderRadius:
                NovaDecorations.borderRadiusGeometryCircular8,
                color: NovaColors.appPrimaryColorMain500
                    .withOpacity(.05)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NovaImageSvg(svgPath: NovaAssets.infoIcon),
                NovaHSpace(8),
                Expanded(
                  child: NovaTextWidget(
                    title: 'We use PayStack. PayStack charges 1.5% + N100, up to N2,000 for every transaction.',
                    textStyle: NovaTypography.textTitleLargeStyle,
                    textColor: NovaColors.appGrayText,
                    textSize: NovaTypography.fontLabelSmall,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16),
          ),
          NovaVSpace(24),
          Row(
            children: [
              Expanded(
                child: PLButtonOutline(
                  borderColor: NovaColors.appPrimaryColorMain500,
                  borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                  textTitle: "No cancel",
                  functionToRun: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              NovaHSpace(16),
              Expanded(
                child: NovaButtonRound(
                    textTitle: "Yes fund",
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
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
