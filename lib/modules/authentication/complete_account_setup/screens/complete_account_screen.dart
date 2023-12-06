part of 'package:peerlendly/modules/authentication/complete_account_setup/exports.dart';


class CompleteAccountScreen extends StatelessWidget {
  const CompleteAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBaseWidget(
      iconSet: PLImagePng(
        imgPath: PLAssets.handOk,
        width: 138.w,
        height: 130.h,
        boxFit: BoxFit.contain,
      ).paddingAll(50),
      hasNoColumn: true,
      buildWidget: completeAccountWidget(),
      topHeight: 250.h,
    );
  }

  Widget completeAccountWidget() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          backgroundColor: PLColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLVSpace(32),
                      PLTextWidget(
                        title: "Verify Account",
                        isTitle: true,
                        textStyle: PLTypography.textHeadlineMediumStyle,
                        textSize: PLTypography.fontHeadlineSmall,
                      ),
                      PLVSpace(5),
                      PLTextWidget(
                        title:
                        "To verify your identity, we will be needing the following:",
                        textColor: PLColors.appGrayText,
                        textSize: PLTypography.fontLabelMedium,
                      ),
                      PLVSpace(20),
                      PLCardsWithTextAndImage(
                          bgColor: PLColors.appPrimaryColorMain500,
                          imageWidget: PLImagePng(
                            imgPath: PLAssets.verifyBvnIcon,
                            width: 100.w,
                            height: 100.h,
                            boxFit: BoxFit.contain,
                          ),
                          textWidget: [
                            const PLTextWidget(
                              title: "Verify your BVN",
                              textColor: PLColors.appWhiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                            PLVSpace(8),
                            PLTextWidget(
                              title: "This is your Bank Verification Number",
                              textColor: PLColors.appWhiteColor,
                              textSize: PLTypography.fontBodySmall,
                            )
                          ]),
                      PLVSpace(8),
                      PLCardsWithTextAndImage(
                          bgColor: PLColors.appPrimaryColorMain500,
                          imageWidget: PLImagePng(
                            imgPath: PLAssets.verifyIdIcon,
                            width: 100.w,
                            height: 100.h,
                            boxFit: BoxFit.contain,
                          ),
                          textWidget: [
                            const PLTextWidget(
                              title: "Verify your ID",
                              textColor: PLColors.appWhiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                            PLVSpace(8),
                            PLTextWidget(
                              title: "This is a Government issued ID, preferably your vNIN or your international passport. Your drivers license is also acceptable.",
                              textColor: PLColors.appBackgroundColor,
                              textSize: PLTypography.fontBodySmall,
                            )
                          ]),
                    ],
                  ),
                  Column(
                    children: [
                      PLButtonRound(
                        textTitle: strProceed,
                        functionToRun: () {
                          // if(!AppPreferences.isUserBvnVerified){
                            AppNavigator.push(const AddBvnScreen());
                          // }
                          // else if(!AppPreferences.isUserPhotoTaken){
                          //   AppNavigator.push(const BvnImageCapture());
                          //
                          // }else{
                          //   AppNavigator.push(const VerifyIdScreen());
                          // }
                        },
                      ),
                      PLButtonOutline(
                          borderColor: PLColors.appWhiteColor,
                          textTitle: "Skip",
                          functionToRun: () {
                            AppNavigator.pushAndRemoveUtil(const PersistentTab());
                          }),
                      PLVSpace(4),

                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}


