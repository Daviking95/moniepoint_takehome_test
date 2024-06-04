part of 'package:nova/modules/wallet/exports.dart';

class FundWalletAmountScreen extends StatelessWidget {
  const FundWalletAmountScreen({Key? key}) : super(key: key);

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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaVSpace(48),
                        NovaBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        NovaVSpace(16),
                        NovaTextWidget(
                          title: "Fund Wallet",
                          textStyle: NovaTypography.textTitleLargeStyle,
                          textColor: NovaColors.appPrimaryText,
                          fontWeight: FontWeight.w700,
                          textSize: NovaTypography.fontTitleLarge,
                        ),
                        NovaVSpace(24),
                        Center(
                          child: NovaTextWidget(
                            title: "ENTER AMOUNT",
                            textColor: NovaColors.appGrayText,
                            fontWeight: FontWeight.w600,
                            textSize: NovaTypography.fontBodyMedium,
                          ),
                        ),
                        NovaVSpace(10),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                walletWatcher.changeAmount(true);
                              },
                              child: NovaImageSvg(
                                svgPath: NovaAssets.minusIcon,
                                width: 36.w,
                                height: 36.h,
                              ),
                            ),
                            NovaHSpace(8),
                            Expanded(
                              child: NovaPrimaryTextField(
                                textInputType: TextInputType.number,
                                controller: walletWatcher.amount,
                                textAlign: TextAlign.center,
                                borderRadius: 0,
                                fontSize: 30,
                                // autoFocus: true,
                                fillColor: Colors.transparent,
                                formatter: [CurrencyTextInputFormatter(
                                    symbol: strCurrency2)],
                                validation: (val) =>
                                    val.validateAmount(strFieldRequiredError, 0),
                                // onChange: (val) => walletWatcher.listenForTransferChanges(),
                              ),
                            ),
                            NovaHSpace(16),
                            InkWell(
                              onTap: () {
                                walletWatcher.changeAmount(false);
                              },
                              child: NovaImageSvg(
                                svgPath: NovaAssets.plusIcon,
                                width: 36.w,
                                height: 36.h,
                              ),
                            ),
                          ],
                        ),
                        NovaVSpace(16),
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
                        NovaVSpace(24),
                      ],
                    ),
                    Column(
                      children: [
                        NovaButtonRound(
                          textTitle: strProceed,
                          borderRadius:
                              NovaDecorations.borderRadiusGeometryCircular8,
                          loadingString: walletWatcher.loadingString,
                          isLoader: walletWatcher.isLoading,
                          functionToRun: () {
                            showAlertDialog(
                                context,
                                '',
                                FundWalletPopUp(
                                    amount: double.parse(walletWatcher.amount.text.removeCommaAndCurrency())));
                          },
                        ),
                        NovaVSpace(24),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
