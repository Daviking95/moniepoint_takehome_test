part of "package:nova/shared/widgets/exports.dart";

class TermsAndConditionTextWidget extends StatelessWidget {
  final Function(bool val) isChecked;
  final bool showCheckbox;

  const TermsAndConditionTextWidget(
      {Key? key, required this.isChecked, this.showCheckbox = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onboardingWatcher = context.watch<OnboardingProvider>();

    return InkWell(
      onTap: () {
        onboardingWatcher.isTermsChecked = !onboardingWatcher.isTermsChecked;
      },
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showCheckbox) ...[
            SizedBox(
              height: 25.h,
              width: 25.w,
              child: Checkbox(
                value: onboardingWatcher.isTermsChecked,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: NovaColors.appPrimaryColorMain500,
                checkColor: Color(0xffE0E0E0),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        NovaDecorations.borderRadiusGeometryCircular4),
                onChanged: (bool? value) {
                  onboardingWatcher.isTermsChecked =
                      !onboardingWatcher.isTermsChecked;
                },
              ),
            ),
            NovaHSpace(8),
          ],
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "By continuing, you agree to our ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: NovaTypography.fontLabelLarge,
                          fontFamily: NovaTypography.fontFamilyLight)),
                  TextSpan(
                    text: "Terms of Service ",
                    style: TextStyle(
                        fontSize: NovaTypography.fontLabelLarge,
                        color: NovaColors.appPrimaryColorMain500,
                        decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                      text: "and ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: NovaTypography.fontLabelLarge,
                        fontFamily: NovaTypography.fontFamilyLight,
                      )),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                        fontSize: NovaTypography.fontLabelLarge,
                        color: NovaColors.appPrimaryColorMain500,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              textAlign: showCheckbox ? TextAlign.start : TextAlign.center,
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
