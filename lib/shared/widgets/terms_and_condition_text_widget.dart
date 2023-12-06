part of "package:peerlendly/shared/widgets/exports.dart";


class TermsAndConditionTextWidget extends StatelessWidget {
  const TermsAndConditionTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: "By continuing, you agree to our ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: PLTypography.fontLabelSmall,
                  fontFamily:
                  PLTypography.fontFamilyLight
              )),
          TextSpan(
            text: "Terms and Condition ",
            style: TextStyle(
              fontSize: PLTypography.fontLabelSmall,
              color: PLColors.appPrimaryColorMain500,
            ),
          ),
          TextSpan(
              text: "and ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: PLTypography.fontLabelSmall,
                  fontFamily:
                  PLTypography.fontFamilyLight
              )),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              fontSize: PLTypography.fontLabelSmall,
              color: PLColors.appPrimaryColorMain500,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      softWrap: true,
      maxLines: 2,
    );
  }
}
