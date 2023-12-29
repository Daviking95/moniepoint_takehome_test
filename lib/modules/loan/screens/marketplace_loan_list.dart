part of 'package:peerlendly/modules/loan/exports.dart';

class MarketplaceLoanList extends StatefulWidget {
  const MarketplaceLoanList({Key? key}) : super(key: key);

  @override
  State<MarketplaceLoanList> createState() => _MarketplaceLoanListState();
}

class _MarketplaceLoanListState extends State<MarketplaceLoanList> {
  late LoanProvider loanProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loanProvider = Provider.of<LoanProvider>(context, listen: false);
    loanProvider.getMarketplaceLoans();
  }

  @override
  Widget build(BuildContext context) {
    final loanWatcher = context.watch<LoanProvider>();
    final loanReader = context.read<LoanProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Navigator.canPop(context)
            ? Future.value(true)
            : Future.value(false),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: PLPaddedWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PLVSpace(48),
                          PLBackIcon(
                            onTap: () => Navigator.canPop(context)
                                ? Navigator.pop(context)
                                : AppNavigator.pushAndRemoveUtil(
                                    const PersistentTab()),
                            title: "Select a request to fund",
                            extraWidget: Row(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: const PLImageSvg(
                                      svgPath: PLAssets.filterIcon,
                                      height: 15,
                                      width: 25,
                                    )),
                                PLHSpace(8),
                              ],
                            ),
                          ),
                          PLVSpace(24),
                          loanWatcher.isLoading && UserData.marketplaceLoans.isEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (UserData.marketplaceLoans.isEmpty) ...[
                                      Center(
                                        child: EmptyLoanScreenWithTextOnly(
                                            text: 'No loan request yet'),
                                      )
                                    ] else ...[
                                      for (var index = 0;
                                          index <
                                              UserData.marketplaceLoans.length;
                                          index++) ...[
                                        _showCardWithDate(
                                            context,
                                            index,
                                            NotificationType.loanOffer,
                                            UserData.marketplaceLoans[index]),
                                      ]
                                    ]
                                  ],
                                ),
                        ],
                      ),
                    ],
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
            child: PLTextWidget(
              title: marketplaceLoan.endDate.formatDate(),
              textSize: PLTypography.fontLabelSmall,
              fontWeight: FontWeight.w600,
              textColor: PLColors.appGrayText,
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
