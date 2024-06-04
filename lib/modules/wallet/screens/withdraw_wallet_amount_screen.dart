part of 'package:nova/modules/wallet/exports.dart';

class WithdrawWalletAmountScreen extends StatelessWidget {
  const WithdrawWalletAmountScreen({Key? key}) : super(key: key);

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
    final profileWatcher = context.watch<ProfileProvider>();


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
                          title: "Withdraw Funds",
                          textStyle: NovaTypography.textTitleLargeStyle,
                          textColor: NovaColors.appPrimaryText,
                          fontWeight: FontWeight.w700,
                          textSize: NovaTypography.fontTitleLarge,
                        ),
                        NovaVSpace(24),
                        Center(
                          child: NovaTextWidget(
                            title:
                                "Current Funds: ${500000.toString().formatWithCommasAndDecimals()}",
                            textColor: NovaColors.appGrayText,
                            fontWeight: FontWeight.w600,
                            textSize: NovaTypography.fontBodyMedium,
                          ),
                        ),
                        NovaVSpace(10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
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
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [NovaDecorations.customShadow],
                              borderRadius:
                                  NovaDecorations.borderRadiusGeometryCircular8,
                              color: NovaColors.appWhiteColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NovaTextWidget(
                                title: AppData.getUserProfileResponseModel?.fullName ?? '',
                                textStyle: NovaTypography.textTitleLargeStyle,
                                textColor: NovaColors.appGrayText,
                                textSize: NovaTypography.fontLabelMedium,
                              ),
                              NovaVSpace(12),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      if (!profileWatcher.isLoading &&
                                          profileWatcher
                                              .nigeriaBanks.isNotEmpty && (profileWatcher.bankDetails?.bankName ?? "").isNotEmpty) ...[
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: NovaDecorations
                                                .borderRadiusGeometryCircular16,
                                          ),
                                          child: NovaImageNetwork(
                                            networkPath: profileWatcher.nigeriaBanks
                                                .firstWhere((element) =>
                                            element.bankName.toLowerCase() ==
                                                (profileWatcher.bankDetails?.bankName ?? "").toLowerCase())
                                                .logo,
                                            width: 32.w,
                                            height: 32.h,
                                          ),
                                        ),
                                        NovaHSpace(12),
                                      ],
                                      NovaTextWidget(
                                        title: profileWatcher
                                            .bankDetails?.bankName ??
                                            "",
                                        textStyle:
                                        NovaTypography.textTitleLargeStyle,
                                        textColor: NovaColors.appPrimaryText,
                                        textSize: NovaTypography.fontBodyMedium,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  NovaTextWidget(
                                    title:
                                    "${profileWatcher.bankDetails?.accountNumber.substring(0, 4) ?? ""}******",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    textSize: NovaTypography.fontBodyMedium,
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        NovaVSpace(24),
                        NovaTextWidget(
                          title:
                              "Kindly note that the entered amount would be credited to your registered bank account.",
                          textStyle: NovaTypography.textTitleLargeStyle,
                          textColor: NovaColors.appGrayText,
                          textSize: NovaTypography.fontLabelSmall,
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
                            modalBottomSheet(
                                context,
                                TransferPinActivationWidget(
                                  prevContext: context,
                                  callBackFunc: (value) {
                                    walletWatcher.validateWithdraw(context);
                                  },
                                ),
                                true,
                                context.height / 1.5);
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
