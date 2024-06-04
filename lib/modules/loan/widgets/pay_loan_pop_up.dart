part of 'package:nova/modules/loan/exports.dart';

class PayLoanPopUp extends StatefulWidget {
  final bool isWallet;
  final double amount;
  final LoanProvider loanWatcher;
  final LoogedInUserLoanResponseModel? loanDetails;


  const PayLoanPopUp(
      {Key? key,
      this.isWallet = true,
      required this.amount,
      required this.loanDetails,
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

    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          const NovaImageSvg(svgPath: NovaAssets.warningIcon),
          NovaVSpace(24),
          NovaTextWidget(
            title:
                'You are about to repay your loan via ${widget.isWallet ? 'your wallet' : 'debit card'}',
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
                    textTitle: "Yes pay",
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                    loadingString: widget.loanWatcher.loadingString,
                    isLoader: widget.loanWatcher.isLoading,
                    functionToRun: () {

                      Navigator.of(context).pop();

                      widget.isWallet ?
                      modalBottomSheet(
                          context,
                          TransferPinActivationWidget(
                            prevContext: context,
                            callBackFunc: (value) {
                              widget.loanWatcher.processLoanRepaymentViaWallet(context, widget.amount, widget.loanDetails!.loanId.toInt());
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
