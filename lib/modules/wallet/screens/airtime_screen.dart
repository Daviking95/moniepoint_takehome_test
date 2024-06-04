part of 'package:nova/modules/wallet/exports.dart';

class AirtimeScreen extends StatelessWidget {
  const AirtimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<WalletProvider>(
      vmBuilder: (context) => WalletProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, WalletProvider model) {
    final walletWatcher = context.watch<WalletProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: walletWatcher.formKeyForAirtime,
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
                              title: strAirtime,
                              textStyle: NovaTypography.textTitleLargeStyle,
                              textColor: NovaColors.appPrimaryText,
                              fontWeight: FontWeight.w700,
                              textSize: NovaTypography.fontTitleLarge,
                            ),
                            NovaVSpace(24),
                            PLDropDownButtonWithIcon(
                              list: const [
                                {NovaAssets.mtnIcon: "MTN"},
                                {NovaAssets.gloIcon: "GLO"},
                                {NovaAssets.airtelIcon: "Airtel"},
                                {NovaAssets.nineMobileIcon: "9Mobile"},
                              ],
                              title: "Airtime Provider",
                              value: walletWatcher.networkType,
                              callBack: (val) =>
                                  walletWatcher.listenForAirtimeChanges(),
                            ),
                            NovaVSpace(16),
                            NovaPrimaryTextField(
                              textInputType: TextInputType.number,
                              controller: walletWatcher.amount,
                              formatter: [CurrencyTextInputFormatter(
                                  symbol: strCurrency2)],
                              fillColor: NovaColors.appWhiteColor,
                              validation: (val) =>
                                  val.validateAmount(strFieldRequiredError, 0),
                              hintText: strAmount,
                              onChange: (val) =>
                                  walletWatcher.listenForAirtimeChanges(),
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
                            NovaVSpace(16),
                            NovaPrimaryTextField(
                              textInputType: TextInputType.number,
                              controller: walletWatcher.mobileNo,
                              formatter: [FilteringTextInputFormatter.digitsOnly],
                              maxLength: 11,
                              fillColor: NovaColors.appWhiteColor,
                              suffixIcon: InkWell(
                                onTap: () {
                                  pickContact(walletWatcher.mobileNo);
                                },
                                  child: const NovaImageSvg(svgPath: NovaAssets.phoneContactIcon, width: 20, height: 20,)),
                              validation: (val) =>
                                  val.validateString(strFieldRequiredError),
                              hintText: "Phone Number",
                              onChange: (val) =>
                                  walletWatcher.listenForAirtimeChanges(),
                            ),

                            NovaVSpace(32),

                          ],
                        ),
                        Column(
                          children: [
                            NovaButtonRound(
                              textTitle: strNext,
                              borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                              loadingString: walletWatcher.loadingString,
                              isLoader: walletWatcher.isLoading,
                              isFormValidated:
                              walletWatcher.isFormValidatedForAirtime,
                              functionToRun: () =>
                                  showAlertDialog(
                                      context,
                                      '',
                                      BillsPaymentPopup(
                                          amount: double.parse(walletWatcher.amount.text.removeCommaAndCurrency()), callback: () {
                                        walletWatcher.validateAirtimeForm(context);
                                      })),

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
}
