part of 'package:peerlendly/modules/home/exports.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardProvider myProvider;
  late WalletProvider walletProvider;
  late ProfileProvider profileProvider;
  late LoanProvider loanProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myProvider = Provider.of<DashboardProvider>(context, listen: false);
      walletProvider = Provider.of<WalletProvider>(context, listen: false);
      profileProvider = Provider.of<ProfileProvider>(context, listen: false);
      loanProvider = Provider.of<LoanProvider>(context, listen: false);

      walletProvider.getShowBalance();
      myProvider.getUserProfile();
      myProvider.getLendlyScoreProfile();
      myProvider.getProfilePic();

      profileProvider.getBankDetails();
      profileProvider.getNigeriaBanks();

      loanProvider.getUserLoanDetails();
    });
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   myProvider.dispose();
  //   super.dispose();
  // }

  // @override
  @override
  Widget build(BuildContext context) {
    final dashboardWatcher = context.watch<DashboardProvider>();
    final dashboardReader = context.read<DashboardProvider>();

    "userID ${UserData.loogedInUserLoan?.loanStatus}".logger();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          // floatingActionButton: const FabForDashboard(),
          // floatingActionButtonLocation: ExpandableFab.location,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: PLPaddedWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLVSpace(48),
                      const TopRowWidget(),
                      PLVSpace(16),
                      AppPreferences.isUserBvnVerified &&
                              UserData.loogedInUserLoan != null
                          ? const WalletCardCarouselWidget()
                          : const WalletCardWidget(),
                      PLVSpace(16),
                      const QuickActionsWidget(),
                      PLVSpace(24),
                      AppPreferences.isUserBvnVerified &&
                              AppPreferences.isUserDocumentVerified
                          ? const BannerCarouselWidget()
                          : const ProfileCompletionCardWidget(),
                      PLVSpace(24),

                      // if((UserData.getUserProfileResponseModel?.bvnVerified ?? false))
                      DashboardCTAWidget(
                        "Get a Loan",
                        "Money in your bank account within minutes ",
                        UserData.loogedInUserLoan?.loanStatus == 0 ||
                                UserData.loogedInUserLoan?.loanStatus == null ||
                                UserData.loogedInUserLoan?.loanStatus == 3 ||
                                UserData.loogedInUserLoan?.loanStatus == 4 ||
                                UserData.loogedInUserLoan?.loanStatus == 6
                            ? "Apply Now"
                            : "View Loan",
                        PLAssets.getALoanIcon,
                        () {
                          if (!_isUserBVNValidated(context)) return;

                          if ((UserData.loogedInUserLoan?.loanStatus ?? 0) ==
                              1) {
                            AppNavigator.push(RepayLoanScreen(
                              loanDetails: UserData.loogedInUserLoan,
                              loanStatus:
                                  UserData.loogedInUserLoan?.loanStatus == 5
                                      ? LoanStatus.delayed
                                      : LoanStatus.active,
                            ));
                          } else if ((UserData.loogedInUserLoan?.loanStatus ??
                                  0) ==
                              2) {
                            AppNavigator.push(AcceptLoanOffersScreen(
                              loanDetails: UserData.loogedInUserLoan,
                            ));
                          } else {
                            AppNavigator.push(const LoanApplyScreen());
                          }

                          // AppNavigator.push(UserData.loanStatus == LoanStatus.delayed ? const RepayLoanScreen(loanStatus: LoanStatus.delayed,) : const LoanApplyScreen());
                        },
                        ctaColor: UserData.loogedInUserLoan?.loanStatus == 5
                            ? PLColors.appErrorColor
                            : PLColors.appPrimaryColorMain500,
                      ),
                      PLVSpace(16),
                      DashboardCTAWidget(
                          "Lendly Marketplace",
                          "Explore the Marketplace and earn returns",
                          "View Requests",
                          PLAssets.marketplaceIcon, () {
                        if (!_isUserBVNValidated(context)) return;

                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const MarketplaceLoanList(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      }),
                      PLVSpace(24),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  bool _isUserBVNValidated(BuildContext context) {
    if (!(UserData.getUserProfileResponseModel?.bvnVerified ?? false)) {
      showAlertDialog(context, '', const VerifyAccountPopUp());
      return false;
    } else if ((UserData.getUserProfileResponseModel?.fullName ?? "").isEmpty ||
        (UserData.getUserProfileResponseModel?.fullName ?? "")
            .contains("N/A")) {
      showAlertDialog(context, '', const UpdateProfilePopUp());
      return false;
    } else {
      return true;
    }
  }
}
