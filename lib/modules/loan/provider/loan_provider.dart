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

  final GlobalKey<FormState> formKeyForLoanApply = GlobalKey<FormState>();

  String _selectedDate = "";


  String get selectedDate => _selectedDate;

  set selectedDate(String value) {
    _selectedDate = value;
    notifyListeners();
  }

  bool _isFormValidated = false;

  bool _isLoanFormValidated = false;
  bool _addLendlyProtection = false;
  bool _agreeToMakeOffer = false;
  bool _agreeToAcceptOffer = false;
  TextEditingController _amount = TextEditingController();
  TextEditingController loanPurpose = TextEditingController();
  TextEditingController repaymentDate = TextEditingController();
  TextEditingController tenor = TextEditingController();
  TextEditingController _interestRate = TextEditingController();

  List<int> loanPeriod = [30, 60, 120];

  int _selectedIndex = 0;


  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  List<MarketplaceResponseModelLoanDetail> _borrowerLoanHistory = [];
  List<ActivePendingLoansResponseModelLoanDetail> _activeLoanDetails = [];
  List<ActivePendingLoansResponseModelLoanDetail> _pendingLoanDetails = [];

  List<ActivePendingLoansResponseModelLoanDetail> get pendingLoanDetails =>
      _pendingLoanDetails;

  bool get isLoanFormValidated => _isLoanFormValidated;

  set isLoanFormValidated(bool value) {
    _isLoanFormValidated = value;
    notifyListeners();
  }

  set pendingLoanDetails(
      List<ActivePendingLoansResponseModelLoanDetail> value) {
    _pendingLoanDetails = value;
    notifyListeners();
  }

  List<ActivePendingLoansResponseModelLoanDetail> get activeLoanDetails =>
      _activeLoanDetails;

  set activeLoanDetails(List<ActivePendingLoansResponseModelLoanDetail> value) {
    _activeLoanDetails = value;
    notifyListeners();
  }

  List<MarketplaceResponseModelLoanDetail> get borrowerLoanHistory =>
      _borrowerLoanHistory;

  set borrowerLoanHistory(List<MarketplaceResponseModelLoanDetail> value) {
    _borrowerLoanHistory = value;
    notifyListeners();
  }

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

  listenForLoanApplyChanges() {
    if (tenor.text.isNotEmpty && amount.text.isNotEmpty && loanPurpose.text.isNotEmpty) {
      _isLoanFormValidated = true;
    } else {
      _isLoanFormValidated = false;
    }

    "isLoanFormValidated $_isLoanFormValidated".logger();
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

  void verifyPin(
      BuildContext context, String value, Function() nextFunctionToCall) async {
    await changeLoaderStatus(true, "Verifying pin");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLLoanRepository.instance.verifyPinService(value);

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      nextFunctionToCall();

      "responseDataverifyPin $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void processLoanSummary(BuildContext context) async {
    // AppNavigator.push( LoanSummaryScreen(parentContext: context));

    await changeLoaderStatus(true, "Processing Loan Summary");
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () async {
      // showSnackAtTheTop(message: "Success", isSuccess: true);
      await changeLoaderStatus(false, "");
      notifyListeners();

      AppNavigator.push(LoanSummaryScreen(parentContext: context));
    });
  }

  void processMakingOffer(BuildContext context) async {
    await changeLoaderStatus(true, "Making Offer");
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () async {
      // showSnackAtTheTop(message: "Success", isSuccess: true);
      await changeLoaderStatus(false, "");
      notifyListeners();

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

  void processLoanRepaymentViaWallet(BuildContext context, double amount, int loanID) async {
    await changeLoaderStatus(true, "Repaying Loan");
    notifyListeners();

    // Future.delayed(const Duration(seconds: 3), () async {
    //   // showSnackAtTheTop(message: "Success", isSuccess: true);
    //   await changeLoaderStatus(false, "");
    //   notifyListeners();
    //
    //   AppNavigator.push(const SuccessWidget(
    //     primaryBtnText: "Okay",
    //     hasPrimaryBtn: true,
    //     navigateToWidgetOnDone: PersistentTab(),
    //     message: "Offer Sent",
    //     desc: "Your Offer has been sent to the Borrower",
    //   ));
    //
    //   // AppNavigator.push(const MarketplaceScreen());
    // });
    // return;

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
    await PLLoanRepository.instance.repayLoanWitWalletService(loanID, amount.toInt());

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
        primaryBtnText: "Okay",
        hasPrimaryBtn: true,
        navigateToWidgetOnDone: PersistentTab(),
        message: "Loan Repaid",
        desc: "Your loan has been repaid",
      ));

      "responseDataprocessLoanRepaymentViaWallet $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void uploadLoanToMarketplace(LoanProvider loanWatcher) async {
    await changeLoaderStatus(true, "Processing request");
    notifyListeners();

    LoanApplyRequestModel loanApplyRequestModel = LoanApplyRequestModel(
      loanAmount: loanWatcher.amount.text.removeCommaAndCurrency(),
      loanReason: loanWatcher.loanPurpose.text,
      repaymentDate: DateTime.now()
          .add(Duration(days: int.parse(loanWatcher.tenor.text)))
          .formatDatev2(),
      // repaymentDate.text,
      tenor: int.parse(loanWatcher
          .tenor.text), // int.parse(tenor.text.replaceAll("Days", "").trim()),
    );

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
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

  getMarketplaceLoans() async {
    await changeLoaderStatus(true, "");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, MarketplaceResponseModel>
        responseData = await PLLoanRepository.instance.loanMarketplaceService();

    return responseData.fold((errorResponse) async {

      AppData.marketplaceLoans = [];

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppData.marketplaceLoans = successResponse.loanDetails.where((element) => element.loanStatus == 2).toList();

      "responseDataGetMarketplaceLoans $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void changeInterest(bool shouldReduceAmount) {
    int amountInDouble = int.parse(interestRate.text);

    if(!shouldReduceAmount && amountInDouble > 15){
      return;
    }

    if (shouldReduceAmount && amountInDouble > 0) {
      amountInDouble -= 1;
    } else if (!shouldReduceAmount) {
      amountInDouble += 1;
    }

    if (amountInDouble < 0) amountInDouble = 0;

    interestRate.text = amountInDouble.toString();

    listenForInterestChanges();
    // notifyListeners();
  }

  void listenForInterestChanges() {
    if (interestRate.text.isNotEmpty &&
        int.parse(interestRate.text) > 0 &&
        int.parse(interestRate.text) <= 15) {
      _isFormValidated = true;
    } else {
      _isFormValidated = false;
    }

    "isFormValidated $_isFormValidated".logger();
    notifyListeners();
  }

  void getLoanOffersFromLenders() async {
    await changeLoaderStatus(true, "");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, LenderOffersResponseModel>
        responseData =
        await PLLoanRepository.instance.getLoanOffersFromLendersService();

    return responseData.fold((errorResponse) async {

      AppData.loanOffersFromLenders = [];
      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppData.loanOffersFromLenders = successResponse.loanDetails;

      "responseDataGetLoanOffersFromLenders $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void getActivePendingLoanOffers(int loanStatus) async {
    await changeLoaderStatus(true, "");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, ActivePendingLoansResponseModel>
        responseData = await PLLoanRepository.instance
            .getActivePendingLoanOffersService(loanStatus);

    return responseData.fold((errorResponse) async {

      if (loanStatus == 1) {
        activeLoanDetails = [];
      } else {
        pendingLoanDetails = [];
      }

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      if (loanStatus == 1) {
        activeLoanDetails = successResponse.loanDetails;
      } else {
        pendingLoanDetails = successResponse.loanDetails;
      }

      "responseDataGetActivePendingLoanOffers $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void getUserLoanDetails() async {

    final dartz.Either<ErrorResponseModel, LoogedInUserLoanResponseModel>
        responseData =
        await PLLoanRepository.instance.getLoggedInUserLoanDetailsService();

    return responseData.fold((errorResponse) async {

      AppData.loogedInUserLoan = null;

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppData.loogedInUserLoan = successResponse;

      "responseDataGetLoggedInUserLoanDetails $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void getBorrowerLoanHistory(int borrowerId) async {
    final dartz.Either<ErrorResponseModel, MarketplaceResponseModel>
        responseData = await PLLoanRepository.instance
            .getBorrowerLoanHistoryService(borrowerId);

    return responseData.fold((errorResponse) async {
      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      borrowerLoanHistory = successResponse.loanDetails
          .where((element) => element.loanStatus == 6)
          .toList();
      // borrowerLoanHistory = successResponse.loanDetails;

      "responseDatagetLoanRequestDetails $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void calculateLoan(int loanId, String interestRate,
      MarketplaceResponseModelLoanDetail loanDetail) async {
    await changeLoaderStatus(true, "Calculating your offer");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, LoogedInUserLoanResponseModel>
        responseData = await PLLoanRepository.instance
            .calculateLoanService(loanId, int.parse(interestRate));

    return responseData.fold((errorResponse) async {
      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppNavigator.push(MakeOfferSummaryScreen(
          loanDetail: loanDetail, calculatedResult: successResponse));

      "responseDatagetLoanRequestDetails $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void makeLoanOffer(MarketplaceResponseModelLoanDetail loanDetail,
      LoogedInUserLoanResponseModel calculatedResult) async {
    await changeLoaderStatus(true, "Submitting your offer");
    notifyListeners();

    MakeLoanOfferRequestModel makeLoanOfferRequestModel =
        MakeLoanOfferRequestModel(
            loanId: loanDetail.loanId,
            percentage: calculatedResult.interestRate.toInt(),
            lenderUserId: AppData.getUserProfileResponseModel?.userId ?? 0,
            borrowerUserId: loanDetail.borrowerId);

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLLoanRepository.instance
            .makeLoanOfferService(makeLoanOfferRequestModel);

    return responseData.fold((errorResponse) async {
      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppNavigator.push(const SuccessWidget(
        navigateToWidgetOnDone: PersistentTab(),
        primaryBtnText: "Back to Home",
        message: "Offer Submitted",
        hasPrimaryBtn: true,
      ));

      "responseDatamakeLoanOffer $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void acceptLoanOffer(int offerId) async {
    await changeLoaderStatus(true, "Processing your offer");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLLoanRepository.instance
            .acceptLoanOfferService(offerId.toString());

    return responseData.fold((errorResponse) async {
      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppNavigator.push(const SuccessWidget(
        navigateToWidgetOnDone: PersistentTab(),
        primaryBtnText: "Back to Home",
        message: "Loan Processing",
        hasPrimaryBtn: true,
      ));

      "responseDataacceptLoanOffer $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void canceloanOffer(ActivePendingLoansResponseModelLoanDetail loanDetail) async{
    await changeLoaderStatus(true, "Cancelling your offer");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
    await PLLoanRepository.instance
        .cancelLoanOfferService(loanDetail.offerId.toString());

    return responseData.fold((errorResponse) async {
      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppNavigator.push(const SuccessWidget(
        navigateToWidgetOnDone: PersistentTab(),
        primaryBtnText: "Back to Home",
        message: "Loan Offer Cancelled",
        hasPrimaryBtn: true,
      ));

      "responseDatacanceloanOffer $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void canceloanApplication(LoogedInUserLoanResponseModel loanDetail) async{
    await changeLoaderStatus(true, "Cancelling your request");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
    await PLLoanRepository.instance
        .cancelLoanRequestService(loanDetail.loanId.toString());

    return responseData.fold((errorResponse) async {
      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

      AppNavigator.push(const SuccessWidget(
        navigateToWidgetOnDone: PersistentTab(),
        primaryBtnText: "Back to Home",
        message: "Loan Request Cancelled",
        hasPrimaryBtn: true,
      ));

      "responseDatacanceloanRequest $responseData".logger();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }
}
