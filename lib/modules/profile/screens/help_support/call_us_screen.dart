part of 'package:peerlendly/modules/profile/exports.dart';

class CallUsScreen extends StatelessWidget {
  const CallUsScreen({Key? key}) : super(key: key);

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
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PLVSpace(48),
                    PLBackIcon(
                      onTap: () => Navigator.pop(context),
                    ),
                    PLVSpace(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const PLImageSvg(svgPath: PLAssets.customerCall),
                        PLVSpace(8),
                        PLTextWidget(
                          title: "Hi, Call us anyday",
                          isTitle: true,
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontHeadlineSmall,
                        ),
                        PLVSpace(4),
                        PLTextWidget(
                          title: "Phone lines are available between 8:00am and 5:00pm",
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontLabelSmall,
                        ),
                      ],
                    ),
                    PLVSpace(24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: PLTextWidget(
                        title: "Call",
                        textColor: PLColors.appPrimaryText,
                        textStyle: PLTypography.textHeadlineMediumStyle,
                        textSize: PLTypography.fontLabelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    PLVSpace(8),
                    Container(
                      decoration: BoxDecoration(
                          color: PLColors.appWhiteColor,
                          borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                          border: Border.all(color: Color(0xffe4e4e4))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: PLTextWidget(
                              title: "0800 123 1234",
                              textColor: PLColors.appPrimaryText,
                              textSize: PLTypography.fontLabelMedium,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              launchPhoneApp('0800 123 1234');
                            },
                              child: PLImageSvg(svgPath: PLAssets.callUs))
                        ],
                      ).paddingSymmetric(horizontal: 20, vertical: 16),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
