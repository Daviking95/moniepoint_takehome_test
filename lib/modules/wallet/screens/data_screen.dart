part of 'package:peerlendly/modules/wallet/exports.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key}) : super(key: key);

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
                key: walletWatcher.formKeyForData,
                child: SingleChildScrollView(
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
                            PLBackIcon(onTap: () => Navigator.pop(context), title: strData),
                            PLVSpace(8),
                            PLTextWidget(
                              title: strSelectNetwork,
                              fontWeight: FontWeight.w600,
                            ),
                            PLDropDownButtonWithIcon(
                              list: const [
                                {PLAssets.mtnIcon: "MTN"},
                                {PLAssets.gloIcon: "GLO"},
                                {PLAssets.airtelIcon: "Airtel"},
                                {PLAssets.nineMobileIcon: "9Mobile"},
                              ],
                              title: strSelectNetwork,
                              value: walletWatcher.networkType,
                              callBack: (val) => walletWatcher.listenForDataChanges(),
                            ),
                            PLDropDownButtonWithIcon(
                              list: const [
                                { "" : "1GB"},
                                { "" : "2GB"},
                                { "" : "3GB"},
                                { "" : "4GB"},
                              ],
                              title: strSelectPackage,
                              value: walletWatcher.networkPackageType,
                              callBack: (val) => walletWatcher.listenForDataChanges(),
                            ),
                            PLPrimaryTextField(
                              textInputType: TextInputType.number,
                              controller: walletWatcher.mobileNo,
                              formatter: FilteringTextInputFormatter.digitsOnly,
                              maxLength: 10,
                              fillColor: PLColors.appWhiteColor,
                              validation: (val) => val.validateString(strFieldRequiredError),
                              hintText: strMobileNumber,
                              onChange: (val) => walletWatcher.listenForDataChanges(),
                            ),
                            PLPrimaryTextField(
                              textInputType: TextInputType.number,
                              controller: walletWatcher.amount,
                              formatter: CurrencyTextInputFormatter(symbol: strCurrency2),
                              fillColor: PLColors.appWhiteColor,
                              validation: (val) => val.validateAmount(strFieldRequiredError),
                              hintText: strAmount,
                              onChange: (val) => walletWatcher.listenForDataChanges(),
                            ),
                            PLVSpace(32),
                            PLButtonRound(
                              textTitle: strProceed,
                              isFormValidated: walletWatcher.isFormValidatedForData,
                              functionToRun: () => walletWatcher.validateDataForm(context),
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
}
