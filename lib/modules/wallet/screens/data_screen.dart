part of 'package:nova/modules/wallet/exports.dart';

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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: walletWatcher.formKeyForData,
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
                            NovaBackIcon(onTap: () => Navigator.pop(context), title: strData),
                            NovaVSpace(8),
                            NovaTextWidget(
                              title: strSelectNetwork,
                              fontWeight: FontWeight.w600,
                            ),
                            PLDropDownButtonWithIcon(
                              list: const [
                                {NovaAssets.mtnIcon: "MTN"},
                                {NovaAssets.gloIcon: "GLO"},
                                {NovaAssets.airtelIcon: "Airtel"},
                                {NovaAssets.nineMobileIcon: "9Mobile"},
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
                            NovaPrimaryTextField(
                              textInputType: TextInputType.number,
                              controller: walletWatcher.mobileNo,
                              formatter: [FilteringTextInputFormatter.digitsOnly],
                              maxLength: 10,
                              fillColor: NovaColors.appWhiteColor,
                              validation: (val) => val.validateString(strFieldRequiredError),
                              hintText: strMobileNumber,
                              onChange: (val) => walletWatcher.listenForDataChanges(),
                            ),
                            NovaPrimaryTextField(
                              textInputType: TextInputType.number,
                              controller: walletWatcher.amount,
                              formatter: [CurrencyTextInputFormatter(symbol: strCurrency2)],
                              fillColor: NovaColors.appWhiteColor,
                              validation: (val) => val.validateAmount(strFieldRequiredError, 0),
                              hintText: strAmount,
                              onChange: (val) => walletWatcher.listenForDataChanges(),
                            ),
                            NovaVSpace(32),
                            NovaButtonRound(
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
