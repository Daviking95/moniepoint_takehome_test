part of 'package:nova/modules/loan/exports.dart';

class CancelLoanOfferPopup extends StatelessWidget {
  final ActivePendingLoansResponseModelLoanDetail loanDetail;
  // final LoanProvider loanWatcher;

  const CancelLoanOfferPopup({Key? key, required this.loanDetail,
    // required this.loanWatcher
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();

    return NovaPaddedWidget(
      child: Column(
        children: [
          NovaVSpace(12),
          NovaImageSvg(
            svgPath: NovaAssets.infoIconRed,
            width: 50.w,
            height: 50.h,
          ),
          NovaVSpace(24),
          NovaTextWidget(
            title: 'You are about to cancel your loan offer',
            textSize: NovaTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: NovaColors.appGrayText,
          ),
          NovaVSpace(4),
          NovaTextWidget(
            title: loanDetail.loanAmount.toString().formatWithCommasAndDecimals(),
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
                  textTitle: "No",
                  functionToRun: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              NovaHSpace(16),
              Expanded(
                child: NovaButtonRound(
                    textTitle: "Yes cancel",
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                    bgColor: NovaColors.appErrorColor,
                    functionToRun: () {
                      Navigator.pop(context);
                      loanWatcher.canceloanOffer(loanDetail);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
