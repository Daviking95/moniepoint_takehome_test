part of 'package:peerlendly/modules/loan/exports.dart';

class LoanProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  LoanProvider({this.context, this.shouldInitialize = false});

  @override
  FutureOr<void> initState() {
    "initState WalletProvider Called".logger();

    if (shouldInitialize) {
      init();
    }
  }

  init() {
    "init Called".logger();

    amount = TextEditingController();
    interestRate = TextEditingController();

    _isFormValidated = false;

    amount.text = "0";
    interestRate.text = "0";
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  bool _isFormValidated = false;
  bool _addLendlyProtection = false;
  bool _agreeToMakeOffer = false;
  bool _agreeToAcceptOffer = false;
  TextEditingController _amount = TextEditingController();
  TextEditingController loanPurpose = TextEditingController();
  TextEditingController repaymentDate = TextEditingController();
  TextEditingController tenor = TextEditingController();
  TextEditingController _interestRate = TextEditingController();

  List<int> loanPeriod = [30, 60, 120];

  TextEditingController get interestRate => _interestRate;

  set interestRate(TextEditingController value) {
    _interestRate = value;
    notifyListeners();
  }

  final GlobalKey<FormState> formKeyToMakeOffer = GlobalKey<FormState>();

  TextEditingController get amount => _amount;

  set amount(TextEditingController value) {
    _amount = value;
    notifyListeners();
  }

  bool get isFormValidated => _isFormValidated;

  set isFormValidated(bool value) {
    _isFormValidated = value;
    notifyListeners();
  }

  bool get agreeToAcceptOffer => _agreeToAcceptOffer;

  set agreeToAcceptOffer(bool value) {
    _agreeToAcceptOffer = value;
    notifyListeners();
  }

  bool get agreeToMakeOffer => _agreeToMakeOffer;

  set agreeToMakeOffer(bool value) {
    _agreeToMakeOffer = value;
    notifyListeners();
  }

  bool get addLendlyProtection => _addLendlyProtection;

  set addLendlyProtection(bool value) {
    _addLendlyProtection = value;
    notifyListeners();
  }

  void processPayment(BuildContext context) async {
    await changeLoaderStatus(true, "Processing Payment");
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () async {
      showSnackAtTheTop(message: "Success", isSuccess: true);
      await changeLoaderStatus(false, "");

      AppNavigator.push(const SuccessWidget(
        navigateToWidgetOnDone: PersistentTab(),
        primaryBtnText: "Back to Home",
        message: "Loan Paid",
        hasPrimaryBtn: true,
      ));
    });
  }

  void processLoanSummary() async {
    await changeLoaderStatus(true, "Processing Loan Summary");
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () async {
      // showSnackAtTheTop(message: "Success", isSuccess: true);
      await changeLoaderStatus(false, "");

      AppNavigator.push(const LoanSummaryScreen());
    });
  }

  void processMakingOffer(BuildContext context) async {
    await changeLoaderStatus(true, "Making Offer");
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () async {
      // showSnackAtTheTop(message: "Success", isSuccess: true);
      await changeLoaderStatus(false, "");

      AppNavigator.push(const SuccessWidget(
        primaryBtnText: "Okay",
        hasPrimaryBtn: true,
        navigateToWidgetOnDone: PersistentTab(),
        message: "Offer Sent",
        desc: "Your Offer has been sent to the Borrower",
      ));

      // AppNavigator.push(const MarketplaceScreen());
    });
  }

  void uploadLoanToMarketplace() async {
    await changeLoaderStatus(true, "Processing request");
    notifyListeners();

    "tenor ${tenor.text.replaceAll("Days", "").trim()}".logger();

    LoanApplyRequestModel loanApplyRequestModel = LoanApplyRequestModel(
      loanAmount: amount.text.removeCommaAndCurrency(),
      loanReason: loanPurpose.text,
      repaymentDate: repaymentDate.text,
      tenor: 0, // int.parse(tenor.text.replaceAll("Days", "").trim()),
    );

    return;

    final dartz.Either<ErrorResponseModel, GenericResponseModel>
    responseData =
    await PLLoanRepository.instance.loanApplyService(loanApplyRequestModel);

    "responseDataLoanApply $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppNavigator.push(const SuccessWidget(
          navigateToWidgetOnDone: PersistentTab(),
          primaryBtnText: "View Dashboard",
          hasPrimaryBtn: true,
          message: "Loan Request Sent",
          desc: "Request uploaded to the Marketplace"));

      await changeLoaderStatus(false, "");
    });
  }

  void changeInterest(bool shouldReduceAmount) {
    int amountInDouble = int.parse(interestRate.text);

    if (shouldReduceAmount && amountInDouble > 0) {
      amountInDouble -= 1;
    } else if (!shouldReduceAmount) {
      amountInDouble += 1;
    }

    if (amountInDouble < 0) amountInDouble = 0;

    interestRate.text = amountInDouble.toString();

    // notifyListeners();
  }

  void listenForInterestChanges() {
    if (interestRate.text.isNotEmpty && int.parse(interestRate.text) > 0) {
      _isFormValidated = true;
    } else {
      _isFormValidated = false;
    }

    "isFormValidated $_isFormValidated".logger();
    notifyListeners();
  }
}
