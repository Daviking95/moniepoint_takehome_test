part of 'package:peerlendly/modules/loan/exports.dart';

class PayLoanPopUp extends StatefulWidget {
  final bool isWallet;
  final double amount;
  final LoanProvider loanWatcher;

  const PayLoanPopUp(
      {Key? key,
      this.isWallet = true,
      required this.amount,
      required this.loanWatcher})
      : super(key: key);

  @override
  State<PayLoanPopUp> createState() => _PayLoanPopUpState();
}

class _PayLoanPopUpState extends State<PayLoanPopUp> {

  var publicKey = dotenv.env['YOUR_PAYSTACK_PUBLIC_KEY'];
  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey!);
  }

  @override
  Widget build(BuildContext context) {
    // final loanWatcher = context.watch<LoanProvider>();
    // final loanReader = context.read<LoanProvider>();

    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(12),
          const PLImageSvg(svgPath: PLAssets.warningIcon),
          PLVSpace(24),
          PLTextWidget(
            title:
                'You are about to repay your loan via ${widget.isWallet ? 'your wallet' : 'debit card'}',
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
                    textTitle: "Yes pay",
                    borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                    functionToRun: () {
                      Navigator.pop(context);

                      widget.isWallet ?
                      modalBottomSheet(
                          context,
                          TransferPinActivationWidget(
                            prevContext: context,
                            callBackFunc: () {
                              widget.loanWatcher.processPayment(context);
                            },
                          ),
                          true,
                          context.height / 1.5) : _paystackCharge(context);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  _paystackCharge(BuildContext context) async{
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

    if(response.status){
      widget.loanWatcher.processPayment(context);
    }
  }
}
