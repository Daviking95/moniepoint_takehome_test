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
                                title: strAirtime,
                              ),
                              NovaVSpace(16),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AirtimeProvider(
                                      imgString: NovaAssets.mtnIcon,
                                      text: 'MTN',
                                      index: 0),
                                  AirtimeProvider(
                                      imgString: NovaAssets.gloIcon,
                                      text: 'GLO',
                                      index: 1),
                                  AirtimeProvider(
                                      imgString: NovaAssets.airtelIcon,
                                      text: 'Airtel',
                                      index: 2),
                                  AirtimeProvider(
                                      imgString: NovaAssets.nineMobileIcon,
                                      text: '9Mobile',
                                      index: 3),
                                ],
                              ),
                              NovaVSpace(32),
                              const Center(child: AccountBalanceSnippet()),
                              NovaVSpace(32),
                              PLDropDownButtonWithIcon(
                                list: const [
                                  {"": "Airtime"},
                                  {"": "Data"},
                                ],
                                showIconToTheLeft: false,
                                title: "Choose Service",
                                value: model.networkPackageType,
                                callBack: (val) =>
                                    model.listenForPayBillsChanges(),
                              ),
                              NovaPrimaryTextField(
                                textInputType: TextInputType.number,
                                controller: walletWatcher.mobileNo,
                                // maxLength: 11,
                                formatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  new LengthLimitingTextInputFormatter(11)
                                ],
                                fillColor: NovaColors.appWhiteColor,
                                suffixIcon: InkWell(
                                    onTap: () {
                                      pickContact(walletWatcher.mobileNo);
                                    },
                                    child: const NovaImageSvg(
                                      svgPath: NovaAssets.phoneContactIcon,
                                      width: 20,
                                      height: 20,
                                    )),
                                validation: (val) =>
                                    val.validateString(strFieldRequiredError),
                                hintText: "Phone Number",
                                onChange: (val) =>
                                    walletWatcher.listenForAirtimeChanges(),
                              ),
                              NovaPrimaryTextField(
                                textInputType: TextInputType.number,
                                controller: walletWatcher.amount,
                                formatter: [
                                  CurrencyTextInputFormatter(
                                      symbol: strCurrency2)
                                ],
                                fillColor: NovaColors.appWhiteColor,
                                validation: (val) => val.validateAmount(
                                    strFieldRequiredError, 0),
                                hintText: strAmount,
                                onChange: (val) =>
                                    walletWatcher.listenForAirtimeChanges(),
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
                                    borderRadius: NovaDecorations
                                        .borderRadiusGeometryCircular8,
                                    loadingString: walletWatcher.loadingString,
                                    isLoader: walletWatcher.isLoading,
                                    hasBgImg: true,
                                    isFormValidated:
                                        walletWatcher.isFormValidatedForAirtime,
                                    functionToRun: () => showAlertDialog(
                                        context,
                                        '',
                                        BillsPaymentPopup(
                                            amount: double.parse(walletWatcher
                                                .amount.text
                                                .removeCommaAndCurrency()),
                                            callback: () {
                                              walletWatcher
                                                  .validateAirtimeForm(context);
                                            })),
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
}

class AirtimeProvider extends StatelessWidget {
  final String imgString;
  final String text;
  final int index;

  const AirtimeProvider(
      {super.key,
      required this.imgString,
      required this.text,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final walletWatcher = context.watch<WalletProvider>();

    return Expanded(
      child: GestureDetector(
        onTap: () {
          walletWatcher.airtimeIndexSelected = index;
          "index ${walletWatcher.airtimeIndexSelected} ${index == walletWatcher.airtimeIndexSelected}".logger();
        },
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            color:  NovaColors.neutralColor400.withOpacity(.1),
            borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
            border: index == walletWatcher.airtimeIndexSelected
                ? Border.all(color: NovaColors.appPrimaryColorMain500)
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NovaImagePng(
                imgPath: imgString,
                height: 40.h,
                width: 40.w,
              ).paddingAll(8),
              NovaVSpace(8),
              NovaTextWidget(
                title: text,
                textSize: NovaTypography.fontLabelMedium,
                fontWeight: FontWeight.w600,
              ),
              NovaVSpace(8),
            ],
          ),
        ).marginOnly(right: 8),
      ),
    );
  }
}
