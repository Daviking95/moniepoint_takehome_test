part of 'package:nova/modules/home/exports.dart';

class DashboardScreen extends StatefulWidget {

  final int currentIndex;

  const DashboardScreen({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardProvider myProvider;
  late WalletProvider walletProvider;
  late ProfileProvider profileProvider;
  late LoanProvider loanProvider;

  bool isStopped = false;
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myProvider = Provider.of<DashboardProvider>(context, listen: false);
      walletProvider = Provider.of<WalletProvider>(context, listen: false);
      profileProvider = Provider.of<ProfileProvider>(context, listen: false);
      loanProvider = Provider.of<LoanProvider>(context, listen: false);

      loadData();
      profileProvider.getNigeriaBanks();


    });
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    "didChangeDependencies ${widget.currentIndex}".logger();
  }

  @override
  void didUpdateWidget(covariant DashboardScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    // if(widget.currentIndex == 0) {
    //   isStopped = false;
    //   _runPeriodicUpdate(myProvider);
    //
    // } else {
    //   isStopped = true;
    //   _timer.cancel();
    // }

    "didUpdateWidget $mounted  ${widget.currentIndex}".logger();
    "isStopped didUpdateWidget $isStopped".logger();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    myProvider.dispose();
    _timer.cancel();
    isStopped = true;
    super.dispose();
  }

  loadData(){
    if(mounted) {
      walletProvider.getShowBalance();
      myProvider.getUserProfile();
      myProvider.getLendlyScoreProfile();
      myProvider.getProfilePic();

      profileProvider.getBankDetails();
      loanProvider.getUserLoanDetails();
    }
  }

  // @override
  @override
  Widget build(BuildContext context) {

    "userID ${AppData.loogedInUserLoan?.loanStatus}".logger();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          // floatingActionButton: const FabForDashboard(),
          // floatingActionButtonLocation: ExpandableFab.location,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: RefreshIndicator(
                onRefresh: () {
                  return loadData();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: NovaPaddedWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaVSpace(48),
                        TopRowWidget(
                            dashboardRefreshCallback: () => loadData()
                        ),
                        NovaVSpace(16),
                        AppPreferences.isUserBvnVerified &&
                                AppData.loogedInUserLoan != null
                            ? const WalletCardCarouselWidget()
                            : const WalletCardWidget(),
                        NovaVSpace(16),
                        const QuickActionsWidget(),
                        NovaVSpace(16),
                        AppPreferences.isUserBvnVerified
                            &&
                                AppPreferences.isUserDocumentVerified
                            ? const BannerCarouselWidget()
                            : const ProfileCompletionCardWidget(),
                        NovaVSpace(16),

                        // if((UserData.getUserProfileResponseModel?.bvnVerified ?? false))
                        DashboardCTAWidget(
                          "Get a Loan",
                          "Money in your bank account within minutes ",
                          AppData.loogedInUserLoan?.loanStatus == 0 ||
                                  AppData.loogedInUserLoan?.loanStatus == null ||
                                  AppData.loogedInUserLoan?.loanStatus == 3 ||
                                  AppData.loogedInUserLoan?.loanStatus == 4 ||
                                  AppData.loogedInUserLoan?.loanStatus == 6
                              ? "Apply Now"
                              : "View Loan",
                          NovaAssets.getALoanIcon,
                          () {
                            if (!_isUserBVNValidated(context)) return;

                            if ((AppData.loogedInUserLoan?.loanStatus ?? 0) ==
                                1) {
                              AppNavigator.push(RepayLoanScreen(
                                loanDetails: AppData.loogedInUserLoan,
                                loanStatus:
                                    AppData.loogedInUserLoan?.loanStatus == 5
                                        ? LoanStatus.delayed
                                        : LoanStatus.active,
                              ));
                            } else if ((AppData.loogedInUserLoan?.loanStatus ??
                                    0) ==
                                2) {
                              AppNavigator.push(AcceptLoanOffersScreen(
                                loanDetails: AppData.loogedInUserLoan,
                              ));
                            } else {
                              AppNavigator.push(const LoanApplyScreen());
                            }

                            // AppNavigator.push(UserData.loanStatus == LoanStatus.delayed ? const RepayLoanScreen(loanStatus: LoanStatus.delayed,) : const LoanApplyScreen());
                          },
                          ctaColor: AppData.loogedInUserLoan?.loanStatus == 5
                              ? NovaColors.appErrorColor
                              : NovaColors.appPrimaryColorMain500,
                        ),
                        NovaVSpace(16),
                        DashboardCTAWidget(
                            "Lendly Marketplace",
                            "Explore the Marketplace and earn returns",
                            "View Requests",
                            NovaAssets.marketplaceIcon, () {

                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const MarketplaceLoanList(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        }),
                        NovaVSpace(24),
                      ],
                    ),
                  ),
                ),
              )),
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


  void _runPeriodicUpdate(DashboardProvider myProvider) {

    "isStopped _runPeriodicUpdate $isStopped $mounted".logger();
    if (isStopped) {
      _timer.cancel();
    }else {
      _timer = Timer.periodic(
        const Duration(seconds: 20),
            (Timer timer) async {

          if (isStopped || !mounted) {
            timer.cancel();
            _timer.cancel();
          }

          loadData();

        },
      );
    }
  }
}
