part of 'package:peerlendly/modules/wallet/exports.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _singleServiceIcon(
            context, PLAssets.fundWalletIcon, "Wallet", PLColors.appBlackColor,
            () {
          if (!_isUserBVNValidated(context)) return;

          modalBottomSheet(context, const WalletAccountDetailsWidget(), true, context.height / 2.2);
        }),
        _singleServiceIcon(context, PLAssets.getALoanIcon, "Get A Loan",
            const Color(0xff5D07CD), () {
          if (!_isUserBVNValidated(context)) return;

          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const LoanApplyScreen(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }),
        _singleServiceIcon(context, PLAssets.marketplaceIcon, "Marketplace",
            PLColors.appSecondaryText, () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const MarketplaceScreen(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }),
        _singleServiceIcon(context, PLAssets.airtimeBillsIcon,
            "Airtime and Bills", PLColors.appSecondaryColorMain500, () {
          if (!_isUserBVNValidated(context)) return;

          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const BillsPaymentOptionsScreen(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: PLColors.appWhiteColor,
                    borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                  ),
                  child: PLImageSvg(
                    svgPath: imgString,
                    height: 28,
                    width: 28,
                  ).paddingAll(8)),
              PLVSpace(12),
              PLTextWidget(
                title: title,
                textSize: PLTypography.fontLabelSmall,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isUserBVNValidated(BuildContext context) {
    if (!(UserData.getUserProfileResponseModel?.bvnVerified ?? false)) {
      showAlertDialog(context, '', const VerifyAccountPopUp());
      return false;
    } else {
      return true;
    }
  }
}
