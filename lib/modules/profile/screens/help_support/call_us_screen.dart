part of 'package:nova/modules/profile/exports.dart';

class CallUsScreen extends StatelessWidget {
  const CallUsScreen({Key? key}) : super(key: key);

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
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(48),
                    NovaBackIcon(
                      onTap: () => Navigator.pop(context),
                    ),
                    NovaVSpace(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const NovaImageSvg(svgPath: NovaAssets.customerCall),
                        NovaVSpace(8),
                        NovaTextWidget(
                          title: "Hi, Call us anyday",
                          isTitle: true,
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontHeadlineSmall,
                        ),
                        NovaVSpace(4),
                        NovaTextWidget(
                          title: "Phone lines are available between 8:00am and 5:00pm",
                          textStyle: NovaTypography.textHeadlineMediumStyle,
                          textSize: NovaTypography.fontLabelSmall,
                        ),
                      ],
                    ),
                    NovaVSpace(24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: NovaTextWidget(
                        title: "Call",
                        textColor: NovaColors.appPrimaryText,
                        textStyle: NovaTypography.textHeadlineMediumStyle,
                        textSize: NovaTypography.fontLabelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    NovaVSpace(8),
                    Container(
                      decoration: BoxDecoration(
                          color: NovaColors.appWhiteColor,
                          borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                          border: Border.all(color: Color(0xffe4e4e4))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: NovaTextWidget(
                              title: "0800 123 1234",
                              textColor: NovaColors.appPrimaryText,
                              textSize: NovaTypography.fontLabelMedium,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              launchPhoneApp('0800 123 1234');
                            },
                              child: NovaImageSvg(svgPath: NovaAssets.callUs))
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
