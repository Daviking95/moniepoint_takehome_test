part of 'package:peerlendly/modules/wallet/exports.dart';

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
    final walletReader = context.read<WalletProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: walletWatcher.formKeyForAirtime,
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
                          PLBackIcon(onTap: () => Navigator.pop(context)),
                          PLVSpace(16),
                          PLTextWidget(
                            title: strAirtime,
                            textStyle: PLTypography.textTitleLargeStyle,
                            textColor: PLColors.appPrimaryText,
                            fontWeight: FontWeight.w700,
                            textSize: PLTypography.fontTitleLarge,
                          ),
                          PLVSpace(24),
                          PLDropDownButtonWithIcon(
                            list: const [
                              {PLAssets.mtnIcon: "MTN"},
                              {PLAssets.gloIcon: "GLO"},
                              {PLAssets.airtelIcon: "Airtel"},
                              {PLAssets.nineMobileIcon: "9Mobile"},
                            ],
                            title: "Airtime Provider",
                            value: walletWatcher.networkType,
                            callBack: (val) =>
                                walletWatcher.listenForAirtimeChanges(),
                          ),
                          PLVSpace(16),
                          PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: walletWatcher.amount,
                            formatter: CurrencyTextInputFormatter(
                                symbol: strCurrency2),
                            fillColor: PLColors.appWhiteColor,
                            validation: (val) =>
                                val.validateAmount(strFieldRequiredError),
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
                          PLVSpace(16),
                          PLPrimaryTextField(
                            textInputType: TextInputType.number,
                            controller: walletWatcher.mobileNo,
                            formatter: FilteringTextInputFormatter.digitsOnly,
                            maxLength: 10,
                            fillColor: PLColors.appWhiteColor,
                            suffixIcon: const PLImageSvg(svgPath: PLAssets.phoneContactIcon, width: 20, height: 20,),
                            validation: (val) =>
                                val.validateString(strFieldRequiredError),
                            hintText: "Phone Number",
                            onChange: (val) =>
                                walletWatcher.listenForAirtimeChanges(),
                          ),

                          PLVSpace(32),

                        ],
                      ),
                      Column(
                        children: [
                          PLButtonRound(
                            textTitle: strNext,
                            borderRadius: PLDecorations.borderRadiusGeometryCircular8,
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
                          PLVSpace(32),

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
}
