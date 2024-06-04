part of 'package:nova/modules/profile/exports.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(48),
                    NovaBackIcon(
                      onTap: () => Navigator.pop(context),
                    ),
                    NovaVSpace(8),
                    NovaTextWidget(
                      title: "About Us",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineSmall,
                    ),
                    NovaVSpace(24),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: """Nova was created with the goal to transform the way we borrow and lend.  In today's financial landscape, the barriers to lending and accessing capital are pronounced, driven by high operation and underwriting costs that do a disservice to both borrowers and lenders alike. Nova challenges this status quo.   At Nova, we harness the power of cutting-edge technology to strip away unnecessary expenses and processes. Our mission is simple: offer borrowers clear, quick access to capital, while enabling lenders to operate without the burdens of traditional overheads, from staffing to borrower verification, thereby transferring the benefits of reduced costs to the borrowers in the form of lower interest rates and increased available capital.   Join us in this journey. With Nova, lending and borrowing is not just more efficient, but also more equitable.

Visit: """,
                        style: TextStyle(color: NovaColors.appGrayText),
                      ),
                      TextSpan(
                        text: 'www.nova.com',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrlString('https://www.nova.com'),
                      ),
                      const TextSpan(
                        text: ' to learn more.',
                        style: TextStyle(color: NovaColors.appGrayText),
                      )
                    ],
                  ),
                ),

//                 PLTextWidget(
//                       title:
//                           """Nova was created with the goal to transform the way we borrow and lend.  In today's financial landscape, the barriers to lending and accessing capital are pronounced, driven by high operation and underwriting costs that do a disservice to both borrowers and lenders alike. Nova challenges this status quo.   At Nova, we harness the power of cutting-edge technology to strip away unnecessary expenses and processes. Our mission is simple: offer borrowers clear, quick access to capital, while enabling lenders to operate without the burdens of traditional overheads, from staffing to borrower verification, thereby transferring the benefits of reduced costs to the borrowers in the form of lower interest rates and increased available capital.   Join us in this journey. With Nova, lending and borrowing is not just more efficient, but also more equitable.
//
// Visit: www.nova.com to learn more.""",
//                       textColor: PLColors.appGrayText,
//                       textStyle: PLTypography.textHeadlineMediumStyle,
//                       textSize: PLTypography.fontLabelLarge,
//                     ),
                    NovaVSpace(24),
                    NovaTextWidget(
                      title: """Legal""",
                      textColor: NovaColors.appPrimaryColorMain500,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontLabelLarge,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
