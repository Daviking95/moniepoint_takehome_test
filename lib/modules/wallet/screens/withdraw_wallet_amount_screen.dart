part of 'package:peerlendly/modules/wallet/exports.dart';

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
    final walletReader = context.read<WalletProvider>();
    final profileWatcher = context.watch<ProfileProvider>();


    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PLVSpace(48),
                        PLBackIcon(
                          onTap: () => Navigator.pop(context),
                        ),
                        PLVSpace(16),
                        PLTextWidget(
                          title: "Withdraw Funds",
                          textStyle: PLTypography.textTitleLargeStyle,
                          textColor: PLColors.appPrimaryText,
                          fontWeight: FontWeight.w700,
                          textSize: PLTypography.fontTitleLarge,
                        ),
                        PLVSpace(24),
                        Center(
                          child: PLTextWidget(
                            title:
                                "Current Funds: ${500000.toString().formatWithCommasAndDecimals()}",
                            textColor: PLColors.appGrayText,
                            fontWeight: FontWeight.w600,
                            textSize: PLTypography.fontBodyMedium,
                          ),
                        ),
                        PLVSpace(10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                walletWatcher.changeAmount(true);
                              },
                              child: PLImageSvg(
                                svgPath: PLAssets.minusIcon,
                                width: 36.w,
                                height: 36.h,
                              ),
                            ),
                            PLHSpace(8),
                            Expanded(
                              child: PLPrimaryTextField(
                                textInputType: TextInputType.number,
                                controller: walletWatcher.amount,
                                textAlign: TextAlign.center,
                                borderRadius: 0,
                                fontSize: 30,
                                // autoFocus: true,
                                fillColor: Colors.transparent,
                                formatter: CurrencyTextInputFormatter(
                                    symbol: strCurrency2),
                                validation: (val) =>
                                    val.validateAmount(strFieldRequiredError),
                                // onChange: (val) => walletWatcher.listenForTransferChanges(),
                              ),
                            ),
                            PLHSpace(16),
                            InkWell(
                              onTap: () {
                                walletWatcher.changeAmount(false);
                              },
                              child: PLImageSvg(
                                svgPath: PLAssets.plusIcon,
                                width: 36.w,
                                height: 36.h,
                              ),
                            ),
                          ],
                        ),
                        PLVSpace(16),
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
                        PLVSpace(24),
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [PLDecorations.customShadow],
                              borderRadius:
                                  PLDecorations.borderRadiusGeometryCircular8,
                              color: PLColors.appWhiteColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PLTextWidget(
                                title: UserData.getUserProfileResponseModel?.fullName ?? '',
                                textStyle: PLTypography.textTitleLargeStyle,
                                textColor: PLColors.appGrayText,
                                textSize: PLTypography.fontLabelMedium,
                              ),
                              PLVSpace(12),
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
                                            borderRadius: PLDecorations
                                                .borderRadiusGeometryCircular16,
                                          ),
                                          child: PLImageNetwork(
                                            networkPath: profileWatcher.nigeriaBanks
                                                .firstWhere((element) =>
                                            element.name.toLowerCase() ==
                                                (profileWatcher.bankDetails?.bankName ?? "").toLowerCase())
                                                .logo,
                                            width: 32.w,
                                            height: 32.h,
                                          ),
                                        ),
                                        PLHSpace(12),
                                      ],
                                      PLTextWidget(
                                        title: profileWatcher
                                            .bankDetails?.bankName ??
                                            "",
                                        textStyle:
                                        PLTypography.textTitleLargeStyle,
                                        textColor: PLColors.appPrimaryText,
                                        textSize: PLTypography.fontBodyMedium,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  PLTextWidget(
                                    title:
                                    "${profileWatcher.bankDetails?.accountNumber.substring(0, 4) ?? ""}******",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    textSize: PLTypography.fontBodyMedium,
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        PLVSpace(24),
                        PLTextWidget(
                          title:
                              "Kindly note that the entered amount would be credited to your registered bank account.",
                          textStyle: PLTypography.textTitleLargeStyle,
                          textColor: PLColors.appGrayText,
                          textSize: PLTypography.fontLabelSmall,
                        ),
                        PLVSpace(24),
                      ],
                    ),
                    Column(
                      children: [
                        PLButtonRound(
                          textTitle: strProceed,
                          borderRadius:
                              PLDecorations.borderRadiusGeometryCircular8,
                          loadingString: walletWatcher.loadingString,
                          isLoader: walletWatcher.isLoading,
                          functionToRun: () {
                            modalBottomSheet(
                                context,
                                TransferPinActivationWidget(
                                  prevContext: context,
                                  callBackFunc: () {
                                    walletWatcher.validateWithdraw(context);
                                  },
                                ),
                                true,
                                context.height / 1.5);
                          },
                        ),
                        PLVSpace(24),
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
