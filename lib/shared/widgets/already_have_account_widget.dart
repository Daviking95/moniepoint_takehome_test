part of "package:peerlendly/shared/widgets/exports.dart";


class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.login);
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
                        fontSize: PLTypography.fontBodyMedium,
                        fontFamily:
                        PLTypography.fontFamilyLight)),
                TextSpan(
                  text: " $strLogin",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: PLTypography.fontBodyMedium,
                      color: PLColors.appPrimaryColorMain500,
                      fontFamily: PLTypography.fontFamilyLight),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          PLVSpace(64),
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
                        fontSize: PLTypography.fontBodyMedium,
                        fontFamily:
                        PLTypography.fontFamilyLight)),
                TextSpan(
                  text: " $strSignUp",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: PLTypography.fontBodyMedium,
                      color: PLColors.appPrimaryColorMain500,
                      fontFamily: PLTypography.fontFamilyLight),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          PLVSpace(64),
        ],
      ),
    );
  }
}
