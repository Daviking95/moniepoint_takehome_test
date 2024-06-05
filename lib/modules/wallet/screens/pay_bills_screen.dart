part of 'package:nova/modules/wallet/exports.dart';

class PayBillsScreen extends StatelessWidget {
  final String title;

  const PayBillsScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WalletProvider>(
      vmBuilder: (context) =>
          WalletProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, WalletProvider model) {
    final walletWatcher = context.watch<WalletProvider>();

    "walletWatcher ${model.customerName}";

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: model.formKeyForBillsPayment,
                child: NovaPaddedWidget(
                  child: Container(
                    height: context.height,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NovaVSpace(48),
                              NovaBackIcon(
                                onTap: () => Navigator.pop(context),
                                title: title,
                              ),
                              NovaVSpace(16),
                              Center(child: AccountBalanceSnippet()),
                              NovaVSpace(24),
                              PLDropDownButtonWithIcon(
                                list: const [
                                  {"": "IKEDC"},
                                  {"": "EKEDC"},
                                ],
                                showIconToTheLeft: false,
                                title: getPackageTitle(title.toLowerCase()),
                                value: model.networkType,
                                callBack: (val) =>
                                    model.listenForPayBillsChanges(),
                              ),
                              if (title.toLowerCase() == "internet bill" ||
                                  title.toLowerCase() == "cable tv" ||
                                  title.toLowerCase() == "electricity") ...[
                                // NovaVSpace(16),
                                PLDropDownButtonWithIcon(
                                  list: const [
                                    {"": "PrePaid"},
                                    {"": "PostPaid"},
                                  ],
                                  showIconToTheLeft: false,
                                  title:
                                      getSubPackageTitle(title.toLowerCase()),
                                  value: model.networkPackageType,
                                  callBack: (val) =>
                                      model.listenForPayBillsChanges(),
                                ),
                              ],
                              // NovaVSpace(16),
                              NovaPrimaryTextField(
                                textInputType: TextInputType.number,
                                controller: model.accountNo,
                                formatter: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: title.toLowerCase() == "internet bill"
                                    ? 10
                                    : null,
                                fillColor: NovaColors.appWhiteColor,
                                validation: (val) =>
                                    val.validateString(strFieldRequiredError),
                                hintText:
                                    getAccountIDTitle(title.toLowerCase()),
                                onChange: (val) =>
                                    model.listenForPayBillsChanges(),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: NovaTextWidget(
                                  isPrimary: true,
                                  fontWeight: FontWeight.w600,
                                  title: model.customerName.text,
                                  textColor: NovaColors.appPrimaryText,
                                ),
                              ),
                              NovaVSpace(8),
                              NovaPrimaryTextField(
                                textInputType: TextInputType.number,
                                controller: model.amount,
                                formatter: [
                                  CurrencyTextInputFormatter(
                                      symbol: strCurrency2)
                                ],
                                fillColor: NovaColors.appWhiteColor,
                                validation: (val) => val.validateAmount(
                                    strFieldRequiredError, 0),
                                hintText: strAmount,
                                onChange: (val) =>
                                    model.listenForPayBillsChanges(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      walletWatcher.amount.text =
                                          5000.00.toString();
                                    },
                                    child: chipSet(
                                        "N ${5000.toString().formatWithCommasAndDecimals()}"),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      walletWatcher.amount.text =
                                          10000.00.toString();
                                    },
                                    child: chipSet(
                                        "N ${10000.toString().formatWithCommasAndDecimals()}"),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      walletWatcher.amount.text =
                                          15000.00.toString();
                                    },
                                    child: chipSet(
                                        "N ${15000.toString().formatWithCommasAndDecimals()}"),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      walletWatcher.amount.text =
                                          20000.00.toString();
                                    },
                                    child: chipSet(
                                        "N ${20000.toString().formatWithCommasAndDecimals()}"),
                                  ),
                                ],
                              ),
                              NovaVSpace(32),
                              RecentPurchasesWidget(),
                              NovaVSpace(120),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 5,
                            left: 0,
                            right: 0,
                            child: IntrinsicWidth(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  NovaButtonRound(
                                    textTitle: strPay,
                                    borderRadius:
                                    NovaDecorations.borderRadiusGeometryCircular8,
                                    loadingString: walletWatcher.loadingString,
                                    isLoader: walletWatcher.isLoading,
                                    hasBgImg: true,
                                    // isFormValidated: model.isFormValidatedForPayBills,
                                    functionToRun: () {
                                      modalBottomSheet(
                                          context,
                                          BillsPaymentPopup(
                                              amount: double.parse(walletWatcher
                                                  .amount.text
                                                  .removeCommaAndCurrency()),
                                              callback: () {
                                                walletWatcher
                                                    .validateBillPaymentForm(context);
                                              }), true, context.height / 1.3);
                                    },
                                  ),
                                  NovaVSpace(32),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  getPackageTitle(String title) {
    String text = '';
    switch (title) {
      case 'internet bill':
        text = 'Internet Provider';
        break;
      case 'sport betting':
        text = 'Bet Provider';
        break;
      case 'cable tv':
        text = 'Cable TV';
        break;
      case 'electricity':
        text = 'Select Provider';
        break;
      default:
        text = 'Provider';
    }

    return text;
  }

  getSubPackageTitle(String title) {
    String text = '';
    switch (title) {
      case 'internet bill':
        text = 'Data Bundle';
        break;
      case 'sport betting':
        text = '';
        break;
      case 'cable tv':
        text = 'Select plan';
        break;
      case 'electricity':
        text = 'Select Payment Type';
        break;
      default:
        text = '';
    }

    return text;
  }

  getAccountIDTitle(String title) {
    String text = '';
    switch (title) {
      case 'internet bill':
        text = 'Phone Number';
        break;
      case 'sport betting':
        text = 'Wallet ID';
        break;
      case 'cable tv':
        text = 'Smart Card Number';
        break;
      case 'electricity':
        text = 'Meter Number';
        break;
      default:
        text = '';
    }

    return text;
  }
}
