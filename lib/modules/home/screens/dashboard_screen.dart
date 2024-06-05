part of 'package:nova/modules/home/exports.dart';

class DashboardScreen extends StatelessWidget {
  final int currentIndex;

  const DashboardScreen({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardProvider>(
      vmBuilder: (context) => DashboardProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, DashboardProvider model) {
    final dashboardWatcher = context.watch<DashboardProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          // floatingActionButton: const FabForDashboard(),
          // floatingActionButtonLocation: ExpandableFab.location,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: RefreshIndicator(
                onRefresh: () {
                  return dashboardWatcher.refreshDashboard();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: NovaColors.appPrimaryColorMain500,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24)),
                          image: DecorationImage(
                            image: AssetImage(
                              NovaAssets.dashboardImg,
                            ),
                            fit: BoxFit.cover, ),
                        ),
                        child: NovaPaddedWidget(
                          child: Column(
                            children: [
                              NovaVSpace(60),
                              const TopRowWidget(),
                              NovaVSpace(40),
                              const WalletCardWidget(),
                              NovaVSpace(8),
                            ],
                          ),
                        ),
                      ),
                      NovaPaddedWidget(
                        child: Column(children: [
                          NovaVSpace(32),
                          const QuickActionsWidget(),
                          NovaVSpace(20),
                          const ProfileCompletionCardWidget(),
                          NovaVSpace(16),
                          Row(
                            children: [
                              Expanded(
                                child: DashboardCTAWidget(
                                  "Complete Your Verification",
                                  "Click on the profile and complete registration",
                                  NovaAssets.completeVerifyIcon,
                                      () {
                                  },
                                ),
                              ),
                              NovaHSpace(12),
                              Expanded(
                                child: DashboardCTAWidget(
                                    "Refer A Friend",
                                    "Get 5% on every transaction you make",
                                    NovaAssets.referIcon, () {
                                  // PersistentNavBarNavigator.pushNewScreen(
                                  //   context,
                                  //   screen: const MarketplaceLoanList(),
                                  //   withNavBar: false,
                                  //   pageTransitionAnimation:
                                  //       PageTransitionAnimation.cupertino,
                                  // );
                                }),
                              ),
                            ],
                          ),
                          NovaVSpace(24),
                          RecentTransactionWidget(),
                          NovaVSpace(24),
                        ],),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
