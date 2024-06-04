part of 'package:nova/modules/loan/exports.dart';

class MarketplaceLoanList extends StatelessWidget {
  const MarketplaceLoanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoanProvider>(
      vmBuilder: (context) =>
          LoanProvider(context: context, shouldInitialize: true, shouldGetMarketplaceLoans: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoanProvider model) {
    final loanWatcher = context.watch<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Navigator.canPop(context)
            ? Future.value(true)
            : Future.value(false),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: RefreshIndicator(
                onRefresh: () {
                  return loanWatcher.getMarketplaceLoans();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: NovaPaddedWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NovaVSpace(48),
                            NovaBackIcon(
                              onTap: () => Navigator.canPop(context)
                                  ? Navigator.pop(context)
                                  : AppNavigator.pushAndRemoveUtil(
                                      const PersistentTab()),
                              title: "Select a request to fund",
                              extraWidget: Row(
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: const NovaImageSvg(
                                        svgPath: NovaAssets.filterIcon,
                                        height: 15,
                                        width: 25,
                                      )),
                                  NovaHSpace(8),
                                ],
                              ),
                            ),
                            NovaVSpace(24),
                            loanWatcher.isLoading ?
                            const Center(child: CircularProgressIndicator()) :
                            loanWatcher.isLoading && AppData.marketplaceLoans.isEmpty
                                ? const Center(child: CircularProgressIndicator())
                                : Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (AppData.marketplaceLoans.isEmpty) ...[
                                        Center(
                                          child: EmptyLoanScreenWithTextOnly(
                                              text: 'No loan request yet'),
                                        )
                                      ] else ...[
                                        for (var index = 0;
                                            index <
                                                AppData.marketplaceLoans.length;
                                            index++) ...[

                                              // if(UserData.marketplaceLoans[index].loanStatus == 2)
                                          _showCardWithDate(
                                              context,
                                              index,
                                              NotificationType.loanOffer,
                                              AppData.marketplaceLoans[index]),
                                        ]
                                      ]
                                    ],
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  _showCardWithDate(BuildContext context, int index,
      NotificationType notificationType, MarketplaceResponseModelLoanDetail marketplaceLoan) {
    DateTime currentDateFormatted = marketplaceLoan.endDate;
    DateTime prevCurrentDateFormatted = index - 1 == -1
        ? DateTime.now()
        : marketplaceLoan.endDate.subtract(const Duration(days: 1));

    if (index == 0 ||
        currentDateFormatted.day != prevCurrentDateFormatted.day) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: NovaTextWidget(
              title: marketplaceLoan.endDate.formatDate(),
              textSize: NovaTypography.fontLabelSmall,
              fontWeight: FontWeight.w600,
              textColor: NovaColors.appGrayText,
            ),
            // Text(),
          ),
          LoanRequestCardWidget(
              dateCreated: marketplaceLoan.endDate.formatDate(),
              marketplaceLoan: marketplaceLoan),
        ],
      );
    } else {
      return LoanRequestCardWidget(
          dateCreated: marketplaceLoan.endDate.formatDate(),
          marketplaceLoan: marketplaceLoan);
    }
  }
}
