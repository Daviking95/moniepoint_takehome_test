part of 'package:peerlendly/modules/wallet/exports.dart';

class WalletProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  WalletProvider({this.context, this.shouldInitialize = false});

  @override
  FutureOr<void> initState() {
    "initState WalletProvider Called".logger();

    if (shouldInitialize) {
      init();
    }
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  init() {
    "init Called".logger();

    // transferType = TextEditingController();
    bankName = TextEditingController();
    networkType = TextEditingController();
    mobileNo = TextEditingController();
    accountNo = TextEditingController();
    amount = TextEditingController();
    narration = TextEditingController();
    beneficiaryName = TextEditingController();
    accountName = TextEditingController();
    charges = TextEditingController();
    networkPackageType = TextEditingController();
    billType = TextEditingController();
    customerName = TextEditingController();

    _isFormValidatedForAirtime = false;
    _isFormValidated = false;

    amount.text = "0";

    accountName.text = "Mr David";
    customerName.text = "Mr David";

    "callingCustomerName ${customerName.text}".logger();
  }

  TextEditingController _transferType = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController accountNo = TextEditingController();
  TextEditingController charges = TextEditingController();
  TextEditingController accountName = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController narration = TextEditingController();
  TextEditingController beneficiaryName = TextEditingController();
  TextEditingController networkType = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController networkPackageType = TextEditingController();
  TextEditingController billType = TextEditingController();
  TextEditingController customerName = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForAirtime = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForData = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForBillsPayment = GlobalKey<FormState>();


  TextEditingController get amount => _amount;

  set amount(TextEditingController value) {
    _amount = value;
    notifyListeners();
  }

  TextEditingController get transferType => _transferType;

  set transferType(TextEditingController value) {
    _transferType = value;
    notifyListeners();
  }

  bool _showBalance = true;

  bool get showBalance => _showBalance;

  set showBalance(bool value) {
    _showBalance = value;
    notifyListeners();
  }

  void toggleShowBalance() {
    _showBalance = !_showBalance;
    AppPreferences.showBalanceForCard = _showBalance;
    notifyListeners();
  }

  getShowBalance() async {
    _showBalance = AppPreferences.showBalanceForCard;

    notifyListeners();
  }

  void listenForTransferChanges() {
    if (transferType.text.isNotEmpty &&
        transferType.text.toLowerCase().contains("transfer to bank") &&
        accountNo.text.isNotEmpty &&
        amount.text.isNotEmpty &&
        bankName.text.isNotEmpty) {
      _isFormValidated = true;
    } else if (transferType.text.isNotEmpty && transferType.text.toLowerCase().contains("transfer to wallet") && accountNo.text.isNotEmpty && amount.text.isNotEmpty) {
      _isFormValidated = true;
    } else {
      _isFormValidated = false;
    }

    "isFormValidated $_isFormValidated".logger();
    notifyListeners();
  }

  bool _isFormValidated = false;
  bool _isFormValidatedForAirtime = false;
  bool _isFormValidatedForData = false;
  bool _isFormValidatedForPayBills = false;

  bool get isFormValidatedForPayBills => _isFormValidatedForPayBills;

  set isFormValidatedForPayBills(bool value) {
    _isFormValidatedForPayBills = value;
    notifyListeners();
  }

  bool get isFormValidatedForData => _isFormValidatedForData;

  set isFormValidatedForData(bool value) {
    _isFormValidatedForData = value;
    notifyListeners();
  }

  bool get isFormValidatedForAirtime => _isFormValidatedForAirtime;

  set isFormValidatedForAirtime(bool value) {
    _isFormValidatedForAirtime = value;
    notifyListeners();
  }

  bool get isFormValidated => _isFormValidated;

  set isFormValidated(bool value) {
    _isFormValidated = value;
    notifyListeners();
  }

  listenForAirtimeChanges() {
    if (networkType.text.isNotEmpty && amount.text.isNotEmpty && mobileNo.text.isNotEmpty) {
      _isFormValidatedForAirtime = true;
    } else {
      _isFormValidatedForAirtime = false;
    }

    "_isFormValidatedForAirtime $_isFormValidatedForAirtime".logger();
    notifyListeners();
  }

  listenForDataChanges() {
    if (networkType.text.isNotEmpty && networkPackageType.text.isNotEmpty && amount.text.isNotEmpty && mobileNo.text.isNotEmpty) {
      _isFormValidatedForData = true;
    } else {
      _isFormValidatedForData = false;
    }

    "_isFormValidatedForData $_isFormValidatedForData".logger();
    notifyListeners();
  }

  listenForPayBillsChanges() {
    if (networkType.text.isNotEmpty &&
        // networkPackageType.text.isNotEmpty &&
        amount.text.isNotEmpty &&
        accountNo.text.isNotEmpty
        // &&
        // customerName.text.isNotEmpty
    ) {
      _isFormValidatedForPayBills = true;
    } else {
      _isFormValidatedForPayBills = false;
    }

    "_isFormValidatedForPayBills $_isFormValidatedForPayBills".logger();
    notifyListeners();
  }

  validateTransferForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      charges.text = "100";
      // modalBottomSheet(context, TransferSummaryWidget(parentContext: context), true, context.height / 1.7);
    }
  }

  validateAirtimeForm(BuildContext context) {
    if (formKeyForAirtime.currentState!.validate()) {
      modalBottomSheet(
          context,
          TransferPinActivationWidget(
            prevContext: context,
            callBackFunc: (value) {
              processAirtimePayment(context);
            },
          ),
          true,
          context.height / 1.5);
    }
  }

  validateDataForm(BuildContext context) {
    if (formKeyForData.currentState!.validate()) {
      // modalBottomSheet(context, const TransferSummaryForDataWidget(), true, context.height / 1.7);
    }
  }

  validateBillPaymentForm(BuildContext context) {
    if (formKeyForBillsPayment.currentState!.validate()) {
      modalBottomSheet(
          context,
          TransferPinActivationWidget(
            prevContext: context,
            callBackFunc: (value) {
              processBillPayment(context);
            },
          ),
          true,
          context.height / 1.5);
    }
  }

  // validateTransactionPin(BuildContext context, Function func) {
  //   showAlertDialog(context, "", TransferPinActivationWidget(prevContext: context, callBackFunc: func,));
  //   // modalBottomSheet(
  //   //     context,
  //   //     const TransferPinActivationWidget(), true, context.height / 2.3);
  // }

  void confirmTransactionPin(BuildContext context) {
    modalBottomSheet(
        context,
        SuccessWidget(
          navigateToWidgetOnDone: const PersistentTab(),
          extraBtnTitle: "Share Receipt",
          extraBtnFunc: () {},
        ),
        true,
        context.height / 1.7);

    // changeLoaderStatus(true, "Validating transfer");
    // Future.delayed(const Duration(seconds: 4), () {
    //
    //   "confirmTransactionPin".logger();
    //   changeLoaderStatus(false, "");
    // });
  }

  void changeAmount(bool shouldReduceAmount) {
    double amountInDouble = double.parse(amount.text.removeCommaAndCurrency());

    if(shouldReduceAmount && amountInDouble > 0 ){
      amountInDouble -= 1000;
    }else if(!shouldReduceAmount) {
      amountInDouble += 1000;
    }

    if(amountInDouble < 0) amountInDouble = 0;

    amount.text = amountInDouble.toString();
  }

  void validateWithdraw(BuildContext context) async{
    await changeLoaderStatus(true, "Processing withdrawal");
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () async {
      showSnackAtTheTop(message: "Success", isSuccess: true);
      await changeLoaderStatus(false, "");

      AppNavigator.push(const SuccessWidget(
        navigateToWidgetOnDone: PersistentTab(),
        hasPrimaryBtn: true,
        primaryBtnText: "Back to Home",
        message: "Successful",
        desc: "Funds has been sent to your account",
      ));
    });
  }

  void processAirtimePayment(BuildContext context) async{
    await changeLoaderStatus(true, "Processing airtime payment");
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () async {
      showSnackAtTheTop(message: "Success", isSuccess: true);
      await changeLoaderStatus(false, "");

      AppNavigator.push(const SuccessWidget(
        navigateToWidgetOnDone: PersistentTab(),
        hasPrimaryBtn: true,
        primaryBtnText: "Back to Home",
        message: "Successful",
        desc: "",
      ));
    });
  }

  void processBillPayment(BuildContext context) async{
    await changeLoaderStatus(true, "Processing bill payment");
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () async {
      showSnackAtTheTop(message: "Success", isSuccess: true);
      await changeLoaderStatus(false, "");

      AppNavigator.push(const SuccessWidget(
        navigateToWidgetOnDone: PersistentTab(),
        hasPrimaryBtn: true,
        primaryBtnText: "Back to Home",
        message: "Successful",
        desc: "",
      ));
    });
  }
}
