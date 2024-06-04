part of 'package:nova/modules/wallet/exports.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _singleServiceIcon(
            context, NovaAssets.fundWalletIcon, "Wallet", NovaColors.appBlackColor,
                () {
              if (!_isUserBVNValidated(context)) return;

              modalBottomSheet(
                  context, const WalletAccountDetailsWidget(), true,
                  context.height / 2.2);
            }),
        _singleServiceIcon(context, NovaAssets.getALoanIcon, "Get A Loan",
            const Color(0xff5D07CD), () {
              if (!_isUserBVNValidated(context)) return;

              if (_isLoanActive(context)) return;

              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const LoanApplyScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            }),
        _singleServiceIcon(context, NovaAssets.marketplaceIcon, "Marketplace",
            NovaColors.appSecondaryText, () {
              if (!_isUserBVNValidated(context)) return;

              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const MarketplaceScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            }),
        _singleServiceIcon(context, NovaAssets.airtimeBillsIcon,
            "Airtime and Bills", NovaColors.appSecondaryColorMain500, () {
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

  _singleServiceIcon(BuildContext context,
      String imgString,
      String title,
      Color bgColor,
      Function() param3,) {
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
                    color: NovaColors.appWhiteColor,
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                  ),
                  child: NovaImageSvg(
                    svgPath: imgString,
                    height: 28,
                    width: 28,
                  ).paddingAll(8)),
              NovaVSpace(12),
              NovaTextWidget(
                title: title,
                textSize: NovaTypography.fontLabelSmall,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isUserBVNValidated(BuildContext context) {
    if (!(AppData.getUserProfileResponseModel?.bvnVerified ?? false)) {
      showAlertDialog(context, '', const VerifyAccountPopUp());
      return false;
    } else if ((AppData.getUserProfileResponseModel?.fullName ?? "").isEmpty ||
        (AppData.getUserProfileResponseModel?.fullName ?? "")
            .contains("N/A")) {
      showAlertDialog(context, '', const UpdateProfilePopUp());
      return false;
    } else {
      return true;
    }
  }

  bool _isLoanActive(BuildContext context) {
    if (AppData.loogedInUserLoan?.loanStatus == 1 ||
        AppData.loogedInUserLoan?.loanStatus == 2 ||
        AppData.loogedInUserLoan?.loanStatus == 5){
      showAlertDialog(context, '', const ExistingLoanPopUp());
      return true;
    }
    return false;
  }
}
