part of 'package:nova/modules/authentication/complete_account_setup/exports.dart';


class CompleteAccountScreen extends StatelessWidget {
  const CompleteAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBaseWidget(
      iconSet: NovaImagePng(
        imgPath: NovaAssets.handOk,
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
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaVSpace(32),
                      NovaTextWidget(
                        title: "Verify Account",
                        isTitle: true,
                        textStyle: NovaTypography.textHeadlineMediumStyle,
                        textSize: NovaTypography.fontHeadlineSmall,
                      ),
                      NovaVSpace(5),
                      NovaTextWidget(
                        title:
                        "To verify your identity, we will be needing the following:",
                        textColor: NovaColors.appGrayText,
                        textSize: NovaTypography.fontLabelMedium,
                      ),
                      NovaVSpace(20),
                      PLCardsWithTextAndImage(
                          bgColor: NovaColors.appPrimaryColorMain500,
                          imageWidget: NovaImagePng(
                            imgPath: NovaAssets.verifyBvnIcon,
                            width: 100.w,
                            height: 100.h,
                            boxFit: BoxFit.contain,
                          ),
                          textWidget: [
                            const NovaTextWidget(
                              title: "Verify your BVN",
                              textColor: NovaColors.appWhiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                            NovaVSpace(8),
                            NovaTextWidget(
                              title: "This is your Bank Verification Number",
                              textColor: NovaColors.appWhiteColor,
                              textSize: NovaTypography.fontBodySmall,
                            )
                          ]),
                      NovaVSpace(8),
                      PLCardsWithTextAndImage(
                          bgColor: NovaColors.appPrimaryColorMain500,
                          imageWidget: NovaImagePng(
                            imgPath: NovaAssets.verifyIdIcon,
                            width: 100.w,
                            height: 100.h,
                            boxFit: BoxFit.contain,
                          ),
                          textWidget: [
                            const NovaTextWidget(
                              title: "Verify your ID",
                              textColor: NovaColors.appWhiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                            NovaVSpace(8),
                            NovaTextWidget(
                              title: "This is a Government issued ID, preferably your vNIN or your international passport. Your drivers license is also acceptable.",
                              textColor: NovaColors.appBackgroundColor,
                              textSize: NovaTypography.fontBodySmall,
                            )
                          ]),
                    ],
                  ),
                  Column(
                    children: [
                      NovaButtonRound(
                        textTitle: strProceed,
                        functionToRun: () {
                          // if(!(AppData.getUserProfileResponseModel?.bvnVerified ?? false)){
                            AppNavigator.push(const AddBvnScreen());
                          // }
                          // else if(!AppPreferences.isUserPhotoTaken){
                          //   AppNavigator.push(const BvnImageCapture());
                          //
                          // }
                          // else{
                          //   AppNavigator.push(const VerifyIdScreen());
                          // }
                        },
                      ),
                      PLButtonOutline(
                          borderColor: NovaColors.appWhiteColor,
                          textTitle: "Skip",
                          functionToRun: () {
                            AppNavigator.pushAndRemoveUtil(const PersistentTab());
                          }),
                      NovaVSpace(4),

                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}


