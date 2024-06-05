part of 'package:nova/modules/wallet/exports.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NovaTextWidget(
              title: "Quick Access",
              textStyle: NovaTypography.textTitleSmallStyle,
              textSize: NovaTypography.fontDesc20,
              fontWeight: FontWeight.w700,
              fontFamily: NovaTypography.fontFamilyMedium,
              textColor: Color(0xff2E3A59),
              maxLines: 1,
            ),
            NovaTextWidget(
              title: "View All",
              textStyle: NovaTypography.textTitleSmallStyle,
              textSize: NovaTypography.fontBodyLarge,
              fontWeight: FontWeight.w500,
              textColor: NovaColors.appPrimaryColorMain500,
              maxLines: 1,
            ),
          ],
        ),
        NovaVSpace(16),
        GridView.count(
            primary: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            crossAxisSpacing: 8.0,
            // childAspectRatio: 2.1,
            mainAxisSpacing: 8.0,
            shrinkWrap: true,
            crossAxisCount: 4,
            children: [
              _singleServiceIcon(context, NovaAssets.transferIcon, "Transfer",
                  NovaColors.appBlackColor, () {
                // if (!_isUserBVNValidated(context)) return;
                //
                // modalBottomSheet(context, const WalletAccountDetailsWidget(),
                //     true, context.height / 2.2);
              }),
              _singleServiceIcon(context, NovaAssets.airtimeBillsIcon, "Airtime/Data",
                  const Color(0xff5D07CD), () {
                // if (!_isUserBVNValidated(context)) return;
                //
                // if (_isLoanActive(context)) return;
                //
                // PersistentNavBarNavigator.pushNewScreen(
                //   context,
                //   screen: const LoanApplyScreen(),
                //   withNavBar: false,
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
              }),
              _singleServiceIcon(context, NovaAssets.payBillsIcon,
                  "Pay Bill", NovaColors.appSecondaryText, () {
                // if (!_isUserBVNValidated(context)) return;
                //
                // PersistentNavBarNavigator.pushNewScreen(
                //   context,
                //   screen: const MarketplaceScreen(),
                //   withNavBar: false,
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
              }),
              _singleServiceIcon(context, NovaAssets.utilityIcon,
                  "Utility", NovaColors.appSecondaryColorMain500, () {
                // if (!_isUserBVNValidated(context)) return;
                //
                // PersistentNavBarNavigator.pushNewScreen(
                //   context,
                //   screen: const BillsPaymentOptionsScreen(),
                //   withNavBar: false,
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
              }),
              _singleServiceIcon(context, NovaAssets.quickLoanIcon,
                  "Quick Loan", NovaColors.appSecondaryColorMain500, () {
                // if (!_isUserBVNValidated(context)) return;
                //
                // PersistentNavBarNavigator.pushNewScreen(
                //   context,
                //   screen: const BillsPaymentOptionsScreen(),
                //   withNavBar: false,
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
              }),
              _singleServiceIcon(context, NovaAssets.statementIcon,
                  "Statement", NovaColors.appSecondaryColorMain500, () {
                // if (!_isUserBVNValidated(context)) return;
                //
                // PersistentNavBarNavigator.pushNewScreen(
                //   context,
                //   screen: const BillsPaymentOptionsScreen(),
                //   withNavBar: false,
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
              }),
              _singleServiceIcon(context, NovaAssets.scanToPayIcon,
                  "Scan To Pay", NovaColors.appSecondaryColorMain500, () {
                // if (!_isUserBVNValidated(context)) return;
                //
                // PersistentNavBarNavigator.pushNewScreen(
                //   context,
                //   screen: const BillsPaymentOptionsScreen(),
                //   withNavBar: false,
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
              }),
              _singleServiceIcon(context, NovaAssets.eventsIcon,
                  "Events", NovaColors.appSecondaryColorMain500, () {
                // if (!_isUserBVNValidated(context)) return;
                //
                // PersistentNavBarNavigator.pushNewScreen(
                //   context,
                //   screen: const BillsPaymentOptionsScreen(),
                //   withNavBar: false,
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
              }),
            ])
      ],
    );
  }

  _singleServiceIcon(
    BuildContext context,
    String imgString,
    String title,
    Color bgColor,
    Function() param3,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: param3,
        child: SizedBox(
          width: context.width,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NovaImageSvg(
                  svgPath: imgString,
                  height: 28,
                  width: 28,
                ).paddingAll(8),
                NovaVSpace(8),
                NovaTextWidget(
                  title: title,
                  textSize: NovaTypography.fontLabelMedium,
                  fontWeight: FontWeight.w600,
                ),
                NovaVSpace(8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
