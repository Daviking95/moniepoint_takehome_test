part of "package:nova/shared/widgets/exports.dart";


class AccountBalanceSnippet extends StatelessWidget {
  const AccountBalanceSnippet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
        color: Color(0xffC9D0FF)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          NovaTextWidget(
            title: "Account Balance: ",
            textStyle: NovaTypography.textTitleLargeStyle,
            textColor: NovaColors.appPrimaryText,
            fontFamily: NovaTypography.fontFamilyMedium,
            textSize: NovaTypography.fontTitleSmall,
            textAlign: TextAlign.center,
          ),
          NovaHSpace(4),
          NovaTextWidget(
            title: 1593222.00.toString().formatWithCommasAndDecimals(),
            textStyle: NovaTypography.textTitleLargeStyle,
            textColor: NovaColors.appPrimaryText,
            fontFamily: NovaTypography.fontFamilyMedium,
            textSize: NovaTypography.fontTitleSmall,
            textAlign: TextAlign.center,
            isCurrency: true,
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 8),
    );
  }
}
