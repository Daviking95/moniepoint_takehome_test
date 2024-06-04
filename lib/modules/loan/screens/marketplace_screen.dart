part of 'package:nova/modules/loan/exports.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoanProvider>(
      vmBuilder: (context) =>
          LoanProvider(context: context, shouldInitialize: true, shouldGetActivePendingLoans: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoanProvider model) {
    final loanWatcher = context.watch<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          // floatingActionButton: const FabForDashboard(),
          // floatingActionButtonLocation: ExpandableFab.location,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(48),
                    // const TopRowWidget(),
                    NovaBackIcon(
                      onTap: () => Navigator.pop(context),
                      // onTap: () => AppNavigator.push(const PersistentTab()),
                    ),
                    NovaVSpace(24),
                    MarketplaceWalletCardWidget(
                        selectedIndex: loanWatcher.selectedIndex),
                    NovaVSpace(24),
                    Expanded(
                      child: CustomTabRounded(
                        tabTitleStringList: const ['Active', 'Pending'],
                        callBack: (indexSelected) {
                          "indexSelected $indexSelected".logger();
                          loanWatcher.selectedIndex = indexSelected;
                        },
                        currentSelectionController: loanWatcher.selectedIndex,
                        tabWidgetsList: [
                          ActivePendingLoanList(
                              loanDetails: loanWatcher.activeLoanDetails),
                          ActivePendingLoanList(
                              loanDetails: loanWatcher.pendingLoanDetails)
                        ],
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
