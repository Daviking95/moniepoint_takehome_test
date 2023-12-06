part of 'package:peerlendly/modules/profile/exports.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();
    final profileReader = context.read<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PLVSpace(48),
                    PLBackIcon(
                      onTap: () => Navigator.pop(context),
                    ),
                    PLVSpace(8),
                    PLTextWidget(
                      title: "About Us",
                      isTitle: true,
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontHeadlineSmall,
                    ),
                    PLVSpace(24),
                    PLTextWidget(
                      title:
                          """Peer Lendly was created with the goal to transform the way we borrow and lend.  In today's financial landscape, the barriers to lending and accessing capital are pronounced, driven by high operation and underwriting costs that do a disservice to both borrowers and lenders alike. Peer Lendly challenges this status quo.   At Peer Lendly, we harness the power of cutting-edge technology to strip away unnecessary expenses and processes. Our mission is simple: offer borrowers clear, quick access to capital, while enabling lenders to operate without the burdens of traditional overheads, from staffing to borrower verification, thereby transferring the benefits of reduced costs to the borrowers in the form of lower interest rates and increased available capital.   Join us in this journey. With Peer Lendly, lending and borrowing is not just more efficient, but also more equitable.

Visit: www.peerlendly.com to learn more.""",
                      textColor: PLColors.appGrayText,
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontLabelLarge,
                    ),
                    PLVSpace(24),
                    PLTextWidget(
                      title: """Legal""",
                      textColor: PLColors.appPrimaryColorMain500,
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontLabelLarge,
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
