part of 'package:peerlendly/modules/home/exports.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardProvider myProvider;
  late WalletProvider walletProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myProvider = Provider.of<DashboardProvider>(context, listen: false);
      walletProvider = Provider.of<WalletProvider>(context, listen: false);

      walletProvider.getShowBalance();
      myProvider.getUserProfile();
      myProvider.getLendlyScoreProfile();
      myProvider.getProfilePic();
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    myProvider.dispose();
    super.dispose();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    final dashboardWatcher = context.watch<DashboardProvider>();
    final dashboardReader = context.read<DashboardProvider>();

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
                      AppPreferences.isUserBvnVerified
                          // && UserData.loanStatus != LoanStatus.noLoan
                          ? const WalletCardCarouselWidget()
                          : const WalletCardWidget(),
                      PLVSpace(16),
                      const QuickActionsWidget(),
                      PLVSpace(24),
                      AppPreferences.isUserBvnVerified && AppPreferences.isUserDocumentVerified
                          ? const BannerCarouselWidget() :
                      const ProfileCompletionCardWidget(),
                      PLVSpace(24),

                      // if((UserData.getUserProfileResponseModel?.bvnVerified ?? false))
                      DashboardCTAWidget(
                          "Get a Loan",
                          "Money in your bank account within minutes ",
                          UserData.loanStatus == LoanStatus.noLoan ? "Apply Now" : "View Loan",
                          PLAssets.getALoanIcon,
                          () {

                            if (!_isUserBVNValidated(context)) return;

                            // AppNavigator.push( const RepayLoanScreen(loanStatus: LoanStatus.delayed,));
                            // AppNavigator.push( const LoanApplyScreen());

                            AppNavigator.push( const AcceptLoanOffersScreen());

                            // AppNavigator.push(UserData.loanStatus == LoanStatus.delayed ? const RepayLoanScreen(loanStatus: LoanStatus.delayed,) : const LoanApplyScreen());
                          }),
                      PLVSpace(16),
                      DashboardCTAWidget(
                          "Lendly Marketplace",
                          "Explore the Marketplace and earn returns",
                          "View Requests",
                          PLAssets.marketplaceIcon,
                          () {}),
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
    } else {
      return true;
    }
  }
}
