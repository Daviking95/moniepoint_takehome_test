part of 'package:peerlendly/modules/loan/exports.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {

  late LoanProvider loanProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loanProvider = Provider.of<LoanProvider>(context, listen: false);
    loanProvider.getActivePendingLoanOffers(1);
    loanProvider.getActivePendingLoanOffers(2);
  }

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();
    final loanReader = context.read<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          // floatingActionButton: const FabForDashboard(),
          // floatingActionButtonLocation: ExpandableFab.location,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PLVSpace(48),
                    // const TopRowWidget(),
                    PLBackIcon(
                      onTap: () => Navigator.pop(context),
                      // onTap: () => AppNavigator.push(const PersistentTab()),
                    ),
                    PLVSpace(24),
                    const MarketplaceWalletCardWidget(),
                    PLVSpace(24),
                    Expanded(
                      child: CustomTab(
                        tabTitleStringList: const ['Active', 'Pending'],
                        tabWidgetsList: [ActivePendingLoanList(loanDetails: loanWatcher.activeLoanDetails), ActivePendingLoanList(loanDetails: loanWatcher.pendingLoanDetails)],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
