part of 'package:peerlendly/modules/loan/exports.dart';

class MarketplaceLoanList extends StatelessWidget {
  const MarketplaceLoanList({Key? key}) : super(key: key);

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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _showCardWithDate(
                                  context,
                                  0,
                                  NotificationType.loanAccepted,
                                  DateTime.now().add(const Duration(days: 1))),
                              _showCardWithDate(
                                  context,
                                  1,
                                  NotificationType.loanReceived,
                                  DateTime.now().add(const Duration(days: 1))),
                              _showCardWithDate(
                                  context,
                                  2,
                                  NotificationType.loanOffer,
                                  DateTime.now().add(const Duration(days: 2))),
                              _showCardWithDate(context, 3,
                                  NotificationType.loanCharges, DateTime.now()),
                              _showCardWithDate(
                                  context,
                                  4,
                                  NotificationType.walletWithdrawal,
                                  DateTime.now()),
                              _showCardWithDate(
                                  context,
                                  5,
                                  NotificationType.walletFunded,
                                  DateTime.now().add(const Duration(days: 2))),
                              _showCardWithDate(
                                  context,
                                  6,
                                  NotificationType.loanOffer,
                                  DateTime.now().add(const Duration(days: 3))),
                              _showCardWithDate(context, 7,
                                  NotificationType.loanCharges, DateTime.now()),

                              // for (var index = 0; index < 6; index++) ...[
                              //   _showCardWithDate(context, index),
                              // ]
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



  _showCardWithDate(
      BuildContext context, int index, NotificationType notificationType, DateTime dateCreated) {
    DateTime currentDateFormatted = dateCreated;
    DateTime prevCurrentDateFormatted = index - 1 == -1 ? DateTime.now() : dateCreated.subtract(const Duration(days: 1));

    if (index == 0 || currentDateFormatted.day != prevCurrentDateFormatted.day) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: PLTextWidget(
              title: dateCreated.formatDate(),
              textSize: PLTypography.fontLabelSmall,
              fontWeight: FontWeight.w600,
              textColor: PLColors.appGrayText,
            ),
            // Text(),
          ),
          LoanRequestCardWidget(dateCreated: dateCreated.formatDate()),
        ],
      );
    } else {
      return LoanRequestCardWidget(dateCreated: dateCreated.formatDate());
    }
  }
}
