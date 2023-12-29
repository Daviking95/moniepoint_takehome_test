part of 'package:peerlendly/modules/loan/exports.dart';


class CancelLoanRequestPopup extends StatelessWidget {
  final LoogedInUserLoanResponseModel? loanDetail;

  const CancelLoanRequestPopup({Key? key, this.loanDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();

    return PLPaddedWidget(
      child: Column(
        children: [
          PLVSpace(12),
          PLImageSvg(
            svgPath: PLAssets.infoIconRed,
            width: 50.w,
            height: 50.h,
          ),
          PLVSpace(24),
          PLTextWidget(
            title: 'You are about to cancel your loan request',
            textSize: PLTypography.fontLabelMedium,
            textAlign: TextAlign.center,
            textColor: PLColors.appGrayText,
          ),
          PLVSpace(4),
          PLTextWidget(
            title: loanDetail?.amount.toString().formatWithCommasAndDecimals(),
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
                  textTitle: "No",
                  functionToRun: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              PLHSpace(16),
              Expanded(
                child: PLButtonRound(
                    textTitle: "Yes cancel",
                    borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                    bgColor: PLColors.appErrorColor,
                    functionToRun: () {
                      Navigator.pop(context);
                      loanWatcher.canceloanApplication(loanDetail!);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
