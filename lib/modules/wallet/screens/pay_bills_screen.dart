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
                child: SingleChildScrollView(
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
                            NovaBackIcon(onTap: () => Navigator.pop(context)),
                            NovaVSpace(16),
                            NovaTextWidget(
                              title: title,
                              textStyle: NovaTypography.textTitleLargeStyle,
                              textColor: NovaColors.appPrimaryText,
                              fontWeight: FontWeight.w700,
                              textSize: NovaTypography.fontTitleLarge,
                            ),
                            NovaVSpace(24),
                            PLDropDownButtonWithIcon(
                              list: const [
                                {"": "IKEDC"},
                                {"": "EKEDC"},
                              ],
                              title: getPackageTitle(title.toLowerCase()),
                              value: model.networkType,
                              callBack: (val) =>
                                  model.listenForPayBillsChanges(),
                            ),
                            if (title.toLowerCase() == "internet" ||
                                title.toLowerCase() == "tv") ...[
                              NovaVSpace(16),
                              PLDropDownButtonWithIcon(
                                list: const [
                                  {"": "PrePaid"},
                                  {"": "PostPaid"},
                                ],
                                title: getSubPackageTitle(title.toLowerCase()),
                                value: model.networkPackageType,
                                callBack: (val) =>
                                    model.listenForPayBillsChanges(),
                              ),
                            ],
                            NovaVSpace(16),
                            NovaPrimaryTextField(
                              textInputType: TextInputType.number,
                              controller: model.accountNo,
                              formatter: [FilteringTextInputFormatter.digitsOnly],
                              maxLength: title.toLowerCase() == "internet" ? 10 : null,
                              fillColor: NovaColors.appWhiteColor,
                              validation: (val) =>
                                  val.validateString(strFieldRequiredError),
                              hintText: getAccountIDTitle(title.toLowerCase()),
                              onChange: (val) =>
                                  model.listenForPayBillsChanges(),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: NovaTextWidget(
                                isPrimary: true,
                                fontWeight: FontWeight.w600,
                                title: model.customerName.text,
                              ),
                            ),
                            NovaVSpace(8),
                            NovaPrimaryTextField(
                              textInputType: TextInputType.number,
                              controller: model.amount,
                              formatter: [CurrencyTextInputFormatter(
                                  symbol: strCurrency2)],
                              fillColor: NovaColors.appWhiteColor,
                              validation: (val) =>
                                  val.validateAmount(strFieldRequiredError, 0),
                              hintText: strAmount,
                              onChange: (val) =>
                                  model.listenForPayBillsChanges(),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    walletWatcher.amount.text = 5000.00.toString();
                                  },
                                  child: chipSet(
                                      "N ${5000.toString().formatWithCommasAndDecimals()}"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    walletWatcher.amount.text = 10000.00.toString();
                                  },
                                  child: chipSet(
                                      "N ${10000.toString().formatWithCommasAndDecimals()}"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    walletWatcher.amount.text = 15000.00.toString();
                                  },
                                  child: chipSet(
                                      "N ${15000.toString().formatWithCommasAndDecimals()}"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    walletWatcher.amount.text = 20000.00.toString();
                                  },
                                  child: chipSet(
                                      "N ${20000.toString().formatWithCommasAndDecimals()}"),
                                ),
                              ],
                            ),
                            NovaVSpace(32),
                            NovaButtonRound(
                              textTitle: strNext,
                              borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                              loadingString: walletWatcher.loadingString,
                              isLoader: walletWatcher.isLoading,
                              isFormValidated: model.isFormValidatedForPayBills,
                              functionToRun: () {
                                showAlertDialog(
                                    context,
                                    '',
                                    BillsPaymentPopup(
                                        amount: double.parse(walletWatcher.amount.text.removeCommaAndCurrency()), callback: () {
                                      walletWatcher.validateBillPaymentForm(context);
                                    }));
                              },
                            ),
                            NovaVSpace(32),
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

  getPackageTitle(String title) {
    String text = '';
    switch (title) {
      case 'internet':
        text = 'Internet Provider';
        break;
      case 'betting':
        text = 'Bet Provider';
        break;
      case 'tv':
        text = 'Cable TV';
        break;
      case 'electricity':
        text = 'Electricity Provider';
        break;
      default:
        text = 'Provider';
    }

    return text;
  }

  getSubPackageTitle(String title) {
    String text = '';
    switch (title) {
      case 'internet':
        text = 'Data Bundle';
        break;
      case 'betting':
        text = '';
        break;
      case 'tv':
        text = 'Select plan';
        break;
      case 'electricity':
        text = '';
        break;
      default:
        text = '';
    }

    return text;
  }

  getAccountIDTitle(String title) {
    String text = '';
    switch (title) {
      case 'internet':
        text = 'Phone Number';
        break;
      case 'betting':
        text = 'Wallet ID';
        break;
      case 'tv':
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
