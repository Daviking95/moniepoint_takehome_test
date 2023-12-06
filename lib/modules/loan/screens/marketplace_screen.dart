part of 'package:peerlendly/modules/loan/exports.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

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
                    const Expanded(
                      child: CustomTab(
                        tabTitleStringList: ['Active', 'Pending'],
                        tabWidgetsList: [EmptyLoanScreen(), ActivePendingLoanList()],
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
