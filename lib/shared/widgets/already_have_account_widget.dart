part of "package:nova/shared/widgets/exports.dart";
class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.switchAccountLogin);
      },
      child: Column(
        children: [

          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: strAlreadyHaveAccount,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: NovaTypography.fontBodyMedium,
                        fontFamily:
                        NovaTypography.fontFamilyLight)),
                TextSpan(
                  text: " $strLogin",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: NovaTypography.fontBodyMedium,
                      color: NovaColors.appPrimaryColorMain500,
                      fontFamily: NovaTypography.fontFamilyLight),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          NovaVSpace(64),
        ],
      ),
    );
  }
}


class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.signUp);
      },
      child: Column(
        children: [

          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: strDontHaveAccount,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: NovaTypography.fontBodyMedium,
                        fontFamily:
                        NovaTypography.fontFamilyLight)),
                TextSpan(
                  text: " $strSignUp",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: NovaTypography.fontBodyMedium,
                      color: NovaColors.appPrimaryColorMain500,
                      fontFamily: NovaTypography.fontFamilyLight),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          NovaVSpace(64),
        ],
      ),
    );
  }
}
