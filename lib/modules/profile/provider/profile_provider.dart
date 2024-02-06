part of 'package:peerlendly/modules/profile/exports.dart';

class ProfileProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  ProfileProvider({this.context, this.shouldInitialize = false});

  ProfileProvider.prefillOnEditProfile(
      {this.context, this.shouldInitialize = false}) {
    prefillTextEditors();
  }

  @override
  FutureOr<void> initState() {
    "initState ProfileProvider Called".logger();

    if (shouldInitialize) {
      // init();
      defaultAllToEmpty();
    }
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  prefillTextEditors() {
    // username.text = "daviking";
    // firstName.text = "David";
    // lastName.text = "Akinde";
    // phoneNumber.text = "08177227722";
    // address.text = "Lagos";
    // country.text = "Nigeria";
    // email.text = "dav@yopmail.com";
    // dateOfBirth.text = "2001-01-01";
  }

  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController changeAvatar = TextEditingController();

  TextEditingController oldPassword = TextEditingController();

  TextEditingController newPassword = TextEditingController();

  TextEditingController newPhoneNumber = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController oldPin = TextEditingController();

  TextEditingController newPin = TextEditingController();
  TextEditingController confirmNewPin = TextEditingController();

  TextEditingController managerId = TextEditingController();
  TextEditingController idType = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController maritalStatus = TextEditingController();
  TextEditingController meansOfAddress = TextEditingController();

  TextEditingController nokFullName = TextEditingController();
  TextEditingController nokRelationship = TextEditingController();
  TextEditingController nokEmail = TextEditingController();
  TextEditingController nokPhone = TextEditingController();
  TextEditingController nokAddress = TextEditingController();

  TextEditingController empEmploymentType = TextEditingController();
  TextEditingController empMonthlyIncome = TextEditingController();
  TextEditingController empSalaryDay = TextEditingController();
  TextEditingController empJobTitle = TextEditingController();
  TextEditingController empCompanyName = TextEditingController();
  TextEditingController empOfficeEmail = TextEditingController();
  TextEditingController empOfficeAddress = TextEditingController();
  TextEditingController empLocalGov = TextEditingController();
  TextEditingController empState = TextEditingController();

  TextEditingController uploadGovIssuedID = TextEditingController();
  TextEditingController uploadProofOfAddress = TextEditingController();
  TextEditingController uploadProofOfEmp = TextEditingController();
  TextEditingController uploadAdditionalDoc = TextEditingController();
  TextEditingController addBankName = TextEditingController();
  TextEditingController addBankAccountNumber = TextEditingController();
  TextEditingController _verifiedAccount = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController cardHolderName = TextEditingController();
  TextEditingController cvvCode = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _showBackView = false;

  bool get showBackView => _showBackView;

  set showBackView(bool value) {
    _showBackView = value;
    // notifyListeners();
  }

  // TextEditingController get cardNumber => _cardNumber;

  TextEditingController get verifiedAccount => _verifiedAccount;

  set verifiedAccount(TextEditingController value) {
    _verifiedAccount = value;
    notifyListeners();
  }

  // set cardNumber(TextEditingController value) {
  //   _cardNumber = value;
  //   notifyListeners();
  // }
  //
  // TextEditingController get expiryDate => _expiryDate;
  //
  // set expiryDate(TextEditingController value) {
  //   _expiryDate = value;
  //   notifyListeners();
  // }
  //
  // TextEditingController get cardHolderName => _cardHolderName;
  //
  // set cardHolderName(TextEditingController value) {
  //   _cardHolderName = value;
  //   notifyListeners();
  // }
  //
  // TextEditingController get cvvCode => _cvvCode;
  //
  // set cvvCode(TextEditingController value) {
  //   _cvvCode = value;
  //   notifyListeners();
  // }

  bool isCvvFocused = false;

  // TextEditingController get changeAvatar => _changeAvatar;
  // set changeAvatar(TextEditingController value) {
  //   _changeAvatar = value;
  //   notifyListeners();
  // }

  bool _pushNotificationToggle = false;
  bool _loginBiometricsToggle = false;

  bool _transferBiometricsToggle = false;
  bool _pushInAppNotificationToggle = false;

  bool _isDocumentFormValidated = false;
  bool _isNextOfKinFormValidated = false;
  bool _isPersonalInfoUpdated = false;
  bool _isEmploymentFormValidated = false;
  bool _isAddBankFormValidated = false;
  bool _isAddCardFormValidated = false;

  File _imageProfileFile = File('');

  File get imageProfileFile => _imageProfileFile;

  set imageProfileFile(File value) {
    _imageProfileFile = value;
    notifyListeners();
  }

  BankDetailsResponseModel? _bankDetails;

  List<CustomerCard> _cardDetail = [];

  List<CustomerCard> get cardDetail => _cardDetail;

  set cardDetail(List<CustomerCard> value) {
    _cardDetail = value;
    notifyListeners();
  }

  List<NigeriaBankResponseModel> _nigeriaBanks = [];

  List<NigeriaBankResponseModel> get nigeriaBanks => _nigeriaBanks;

  set nigeriaBanks(List<NigeriaBankResponseModel> value) {
    _nigeriaBanks = value;
    notifyListeners();
  }

  BankDetailsResponseModel? get bankDetails => _bankDetails;

  set bankDetails(BankDetailsResponseModel? value) {
    _bankDetails = value;
    notifyListeners();
  }

  bool get isAddCardFormValidated => _isAddCardFormValidated;

  set isAddCardFormValidated(bool value) {
    _isAddCardFormValidated = value;
    notifyListeners();
  }

  bool get isAddBankFormValidated => _isAddBankFormValidated;

  set isAddBankFormValidated(bool value) {
    _isAddBankFormValidated = value;
    notifyListeners();
  }

  bool get isDocumentFormValidated => _isDocumentFormValidated;

  set isDocumentFormValidated(bool value) {
    _isDocumentFormValidated = value;
    notifyListeners();
  }

  bool get isNextOfKinFormValidated => _isNextOfKinFormValidated;

  set isNextOfKinFormValidated(bool value) {
    _isNextOfKinFormValidated = value;
    notifyListeners();
  }

  bool get isEmploymentFormValidated => _isEmploymentFormValidated;

  set isEmploymentFormValidated(bool value) {
    _isEmploymentFormValidated = value;
    notifyListeners();
  }

  bool get isPersonalInfoUpdated => _isPersonalInfoUpdated;

  set isPersonalInfoUpdated(bool value) {
    _isPersonalInfoUpdated = value;
    notifyListeners();
  }

  bool get loginBiometricsToggle => _loginBiometricsToggle;

  set loginBiometricsToggle(bool value) {
    _loginBiometricsToggle = value;
    notifyListeners();
  }

  bool get transferBiometricsToggle => _transferBiometricsToggle;

  set transferBiometricsToggle(bool value) {
    _transferBiometricsToggle = value;
    notifyListeners();
  }

  bool get pushInAppNotificationToggle => _pushInAppNotificationToggle;

  set pushInAppNotificationToggle(bool value) {
    _pushInAppNotificationToggle = value;
    notifyListeners();
  }

  bool get pushNotificationToggle => _pushNotificationToggle;

  set pushNotificationToggle(bool value) {
    _pushNotificationToggle = value;
    notifyListeners();
  }

  bool _isChangeManagerIDFormValidated = false;

  bool _isChangePasswordFormValidated = false;

  bool _isChangePinFormValidated = false;

  bool _isChangePhoneNumberFormValidated = false;

  bool get isChangeManagerIDFormValidated => _isChangeManagerIDFormValidated;

  set isChangeManagerIDFormValidated(bool value) {
    _isChangeManagerIDFormValidated = value;
    notifyListeners();
  }

  bool get isChangePasswordFormValidated => _isChangePasswordFormValidated;

  set isChangePasswordFormValidated(bool value) {
    _isChangePasswordFormValidated = value;
    notifyListeners();
  }

  bool get isChangePinFormValidated => _isChangePinFormValidated;

  set isChangePinFormValidated(bool value) {
    _isChangePinFormValidated = value;
    notifyListeners();
  }

  bool get isChangePhoneNumberFormValidated =>
      _isChangePhoneNumberFormValidated;

  set isChangePhoneNumberFormValidated(bool value) {
    _isChangePhoneNumberFormValidated = value;
    notifyListeners();
  }

  bool _isFieldReadOnly = true;

  bool get isFieldReadOnly => _isFieldReadOnly;

  set isFieldReadOnly(bool value) {
    _isFieldReadOnly = value;
    notifyListeners();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyForChangePassword = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyForChangePin = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyForChangePhoneNumber = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyForChangeManagerID = GlobalKey<FormState>();

  GlobalKey<FormState> uploadDocFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> employmentFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> nextOfKinFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> addBankFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> addCardFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> creditCardFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> transationPinFormKey = GlobalKey<FormState>();

  void listenForChangePasswordChanges() {
    if (oldPassword.text.isNotEmpty &&
        newPassword.text.isNotEmpty &&
        formKeyForChangePassword.currentState!.validate()) {
      _isChangePasswordFormValidated = true;
    } else {
      _isChangePasswordFormValidated = false;
    }

    notifyListeners();
  }

  void listenForManagerIDChanges() {
    if (managerId.text.isNotEmpty &&
        password.text.isNotEmpty &&
        formKeyForChangeManagerID.currentState!.validate()) {
      _isChangeManagerIDFormValidated = true;
    } else {
      _isChangeManagerIDFormValidated = false;
    }

    notifyListeners();
  }

  void listenForChangePinChanges() {
    if (oldPin.text.isNotEmpty &&
        newPin.text.isNotEmpty &&
        formKeyForChangePin.currentState!.validate()) {
      _isChangePinFormValidated = true;
    } else {
      _isChangePinFormValidated = false;
    }

    notifyListeners();
  }

  void listenForCreatePinChanges() {
    if (newPin.text.isNotEmpty &&
        confirmNewPin.text.isNotEmpty &&
        transationPinFormKey.currentState!.validate()) {
      _isChangePinFormValidated = true;
    } else {
      _isChangePinFormValidated = false;
    }

    notifyListeners();
  }

  void listenForChangePhoneNumberChanges() {
    if (newPhoneNumber.text.isNotEmpty &&
        password.text.isNotEmpty &&
        formKeyForChangePhoneNumber.currentState!.validate()) {
      _isChangePhoneNumberFormValidated = true;
    } else {
      _isChangePhoneNumberFormValidated = false;
    }

    notifyListeners();
  }

  void listenForAddBankChanges() {
    if (addBankName.text.isNotEmpty &&
        addBankAccountNumber.text.isNotEmpty &&
        verifiedAccount.text.isNotEmpty &&
        addBankFormKey.currentState!.validate()) {
      _isAddBankFormValidated = true;
    } else {
      _isAddBankFormValidated = false;
    }

    notifyListeners();
  }

  void listenForAddCardChanges() {
    "_isAddCardFormValidated".logger();

    if (cardNumber.text.isNotEmpty &&
        expiryDate.text.isNotEmpty &&
        cardHolderName.text.isNotEmpty &&
        cvvCode.text.isNotEmpty) {
      _isAddCardFormValidated = true;
    } else {
      _isAddCardFormValidated = false;
    }

    notifyListeners();
  }

  validateChangePasswordForm(BuildContext context) {
    if (formKeyForChangePassword.currentState!.validate()) {
      modalBottomSheet(
          context,
          const SuccessWidget(
            navigateToWidgetOnDone: AppSecurityScreen(),
          ),
          true,
          context.height / 1.7);
    }
  }

  validateChangePinForm(BuildContext context) {
    if (formKeyForChangePin.currentState!.validate()) {
      modalBottomSheet(
          context,
          const SuccessWidget(
            navigateToWidgetOnDone: AppSecurityScreen(),
          ),
          true,
          context.height / 1.7);
    }
  }

  validateChangePhoneNumberForm(BuildContext context) {
    if (formKeyForChangePhoneNumber.currentState!.validate()) {
      modalBottomSheet(
          context,
          const SuccessWidget(
            navigateToWidgetOnDone: AppSecurityScreen(),
          ),
          true,
          context.height / 1.7);
    }
  }

  validateChangeManagerIDForm(BuildContext context) {
    if (formKeyForChangeManagerID.currentState!.validate()) {
      modalBottomSheet(
          context,
          const SuccessWidget(
            navigateToWidgetOnDone: AppSecurityScreen(),
          ),
          true,
          context.height / 1.7);
    }
  }

  listenForDocumentTabChanges() {
    if (uploadGovIssuedID.text.isNotEmpty &&
        uploadProofOfEmp.text.isNotEmpty &&
        uploadAdditionalDoc.text.isNotEmpty &&
        uploadProofOfAddress.text.isNotEmpty &&
        uploadDocFormKey.currentState!.validate()) {
      _isDocumentFormValidated = true;
    } else {
      _isDocumentFormValidated = false;
    }

    notifyListeners();
  }

  listenForNOKChanges() {
    if (nokAddress.text.isNotEmpty &&
        nokPhone.text.isNotEmpty &&
        nokEmail.text.isNotEmpty &&
        nokRelationship.text.isNotEmpty &&
        nokFullName.text.isNotEmpty &&
        nextOfKinFormKey.currentState!.validate()) {
      _isNextOfKinFormValidated = true;
    } else {
      _isNextOfKinFormValidated = false;
    }

    notifyListeners();
  }

  listenForEmploymentTabChanges() {
    if (empState.text.isNotEmpty &&
        empLocalGov.text.isNotEmpty &&
        empOfficeAddress.text.isNotEmpty &&
        empOfficeEmail.text.isNotEmpty &&
        empCompanyName.text.isNotEmpty &&
        empJobTitle.text.isNotEmpty &&
        empSalaryDay.text.isNotEmpty &&
        empMonthlyIncome.text.isNotEmpty &&
        empEmploymentType.text.isNotEmpty &&
        employmentFormKey.currentState!.validate()) {
      _isEmploymentFormValidated = true;
    } else {
      _isEmploymentFormValidated = false;
    }

    notifyListeners();
  }

  listenForPersonalInfoChanges() {
    "logger".log();
    if (address.text.isNotEmpty &&
        meansOfAddress.text.isNotEmpty &&
        maritalStatus.text.isNotEmpty &&
        gender.text.isNotEmpty &&
        idNumber.text.isNotEmpty &&
        idType.text.isNotEmpty &&
        dateOfBirth.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        email.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        firstName.text.isNotEmpty &&
        personalInfoFormKey.currentState!.validate()) {
      _isPersonalInfoUpdated = true;
    } else {
      _isPersonalInfoUpdated = false;
    }

    notifyListeners();
  }

  addBankDetails(BuildContext context) async {
    await changeLoaderStatus(true, "Adding Bank account");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance.createBankDetailsService(
            addBankName.text, addBankAccountNumber.text);

    "responseDataUpdateProfile $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message, isSuccess: true);a

      AppNavigator.push(SuccessWidget(
        navigateToWidgetOnDone: const BankAccountsList(),
        primaryBtnText: "Continue",
        message: successResponse.message,
        hasPrimaryBtn: true,
      ));

      await changeLoaderStatus(false, "");
    });
  }

  addCardDetails(BuildContext context) async {
    await changeLoaderStatus(true, "Adding Card details");
    isLoading = true;
    notifyListeners();

    CardDetailsRequestModel cardDetailsRequestModel = CardDetailsRequestModel(
        cardNumber: cardNumber.text,
        cardName: cardHolderName.text,
        expiryDate: expiryDate.text,
        cvv: cvvCode.text);

    "cardDetailsRequestModel ${jsonEncode(cardDetailsRequestModel)}".logger();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance
            .createCardDetailsService([cardDetailsRequestModel]);

    "responseDataCreateCardDetails $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      isLoading = false;
      notifyListeners();

      return;
    }, (successResponse) async {
      AppNavigator.push(SuccessWidget(
        navigateToWidgetOnDone: const CardAccountsList(),
        primaryBtnText: "Continue",
        message: successResponse.message,
        hasPrimaryBtn: true,
      ));

      await changeLoaderStatus(false, "");
      isLoading = false;
    });
  }

  getBankDetails() async {
    await changeLoaderStatus(true, "");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, BankDetailsResponseModel?>
        responseData =
        await PLProfileRepository.instance.getBankDetailsService();

    "responseDataGetBankDetails $responseData".logger();

    return responseData.fold((errorResponse) async {
      bankDetails = null;

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      bankDetails = successResponse;

      await changeLoaderStatus(false, "");
    });
  }

  getCardDetails() async {
    await changeLoaderStatus(true, "");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, CardDetailsResponseModel?>
        responseData =
        await PLProfileRepository.instance.getCardDetailsService();

    return responseData.fold((errorResponse) async {

      "responseDataGetCardDetails $responseData".logger();

      cardDetail = [];

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      cardDetail = successResponse?.customerCards ?? [];

      await changeLoaderStatus(false, "");
    });
  }

  getNigeriaBanks() async {
    await changeLoaderStatus(true, "");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, List<NigeriaBankResponseModel>>
        responseData =
        await PLProfileRepository.instance.getNigeriaBanksService();

    "responseDataGetNigeria $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      nigeriaBanks = successResponse;

      await changeLoaderStatus(false, "");
    });
  }

  confirmProfileSavePersonalInfo(
      BuildContext context, int tabSection, ProfileProvider model) {
    showAlertDialog(
        context,
        '',
        UpdateProfilePopup(
            parentContext: context, tabSection: tabSection, model: model));
  }

  void updateProfileInfo(BuildContext parentContext, int tabSection) async {
    await changeLoaderStatus(true, "Updating profile");
    notifyListeners();

    // "DOB ${dateOfBirth.text} ${DateFormat(dateFormatterv3).parse(dateOfBirth.text)}".log();

    UpdateProfileRequestModel updateProfileRequestModel =
        UpdateProfileRequestModel(
      profileSection: (tabSection).toString(),

      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      mobileNumber: phoneNumber.text,
      dateOfBirth:
          dateOfBirth.text.isNotEmpty ? dateOfBirth.text : '01/01/1001',
      // DateFormat(dateFormatterv3).parse(dateOfBirth.text),
      identityTypeId: idType.text.isNotEmpty
          ? (AppData.meansOfId.indexWhere((element) =>
                  element.values.first.toString().toLowerCase() ==
                  idType.text.toLowerCase()) +
              1)
          : 1,
      // idType.text,
      identificationIdNumber: idNumber.text,
      gender: gender.text.isNotEmpty
          ? (AppData.gender.indexWhere((element) =>
                  element.values.first.toString().toLowerCase() ==
                  gender.text.toLowerCase()) +
              1)
          : 1,
      maritalStatus: maritalStatus.text.isNotEmpty
          ? (AppData.maritalStatus.indexWhere((element) =>
                  element.values.first.toString().toLowerCase() ==
                  maritalStatus.text.toLowerCase()) +
              1)
          : 1,
      meansOfAddressVerifications: meansOfAddress.text,
      homeAddress: address.text,

      nameOfNextOfKin: nokFullName.text,
      relationshipWithNextOfKin: nokRelationship.text.isNotEmpty
          ? (AppData.relationship.indexWhere((element) =>
                  element.values.first.toString().toLowerCase() ==
                  nokRelationship.text.toLowerCase()) +
              1)
          : 1,
      emailOfNextOfKin: nokEmail.text,
      phoneNumberOfNextOfKin: nokPhone.text,
      homeAddressOfNextOfKin: nokAddress.text,

      employmentType: empEmploymentType.text.isNotEmpty
          ? (AppData.employmentType.indexWhere((element) =>
                  element.values.first.toString().toLowerCase() ==
                  empEmploymentType.text.toLowerCase()) +
              1)
          : 1,
      monthlyEarnings: empMonthlyIncome.text.removeCommaAndCurrency(),
      salaryDay: empSalaryDay.text,
      jobTitle: empJobTitle.text,
      companyName: empCompanyName.text,
      officeEmail: empOfficeEmail.text,
      officeAddress: empOfficeAddress.text,
      officeLocalGovernment: empLocalGov.text,
      officeState: empState.text,

      additionalDocument: uploadAdditionalDoc.text.isNotEmpty
          ? base64Encode(File(uploadAdditionalDoc.text).readAsBytesSync())
          : "",
      governmentIssuedId: uploadGovIssuedID.text.isNotEmpty
          ? base64Encode(File(uploadGovIssuedID.text).readAsBytesSync())
          : "",
      proofOfAddress: uploadProofOfAddress.text.isNotEmpty
          ? base64Encode(File(uploadProofOfAddress.text).readAsBytesSync())
          : "",
      proofOfEmployment: uploadProofOfEmp.text.isNotEmpty
          ? base64Encode(File(uploadProofOfEmp.text).readAsBytesSync())
          : "",
    );

    "updateProfileRequestModel ${updateProfileRequestModel.toJson()}".log();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance
            .updateProfileService(updateProfileRequestModel);

    "responseDataUpdateProfile $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message, isSuccess: true);

      AppNavigator.push(const SuccessWidget(
        primaryBtnText: "Proceed To Dashboard",
        hasPrimaryBtn: true,
        navigateToWidgetOnDone: PersistentTab(),
        message: "Congrats!!!. Your profile has been updated",
      ));

      await changeLoaderStatus(false, "");
    });
  }

  void removeBankDetails(String id, bool isCard) async {
    await changeLoaderStatus(true, "");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance.deleteBankOrCardService(id, isCard);

    "responseDataDeleteCard $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      showSnackAtTheTop(message: successResponse.message, isSuccess: true);
      await changeLoaderStatus(false, "");

      isCard ? getCardDetails() : getBankDetails();
    });
  }

  void closeAccount(String id) async {
    await changeLoaderStatus(true, "");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance.deleteCustomerService(id);

    "responseDataDeleteCustomer $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      showSnackAtTheTop(message: successResponse.message, isSuccess: true);
      await changeLoaderStatus(false, "");
      getBankDetails();
    });
  }

  void listenForVerifyAccount() async {
    if (addBankName.text.isNotEmpty &&
        addBankAccountNumber.text.isNotEmpty &&
        addBankAccountNumber.text.length == 10) {
      await changeLoaderStatus(true, "");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, GenericResponseModel>
          responseData = await PLProfileRepository.instance
              .verifyBankDetailsService(
                  addBankName.text, addBankAccountNumber.text);

      "responseDataDeleteCard $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        // showSnackAtTheTop(message: successResponse.message, isSuccess: true);

        verifiedAccount.text = successResponse.message;
        isAddBankFormValidated = true;
        await changeLoaderStatus(false, "");
        notifyListeners();
      });
    }
  }

  void createTransactionPin(BuildContext context) async {
    await changeLoaderStatus(true, "Creating transaction pin");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance.createTransactionPinService(newPin.text);

    "responseDataCreateTransactionPin $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      showSnackAtTheTop(message: successResponse.message, isSuccess: true);

      AppNavigator.push( SuccessWidget(
        primaryBtnText: "Proceed To Dashboard",
        hasPrimaryBtn: true,
        navigateToWidgetOnDone: PersistentTab(),
        desc: "Congrats!!!. Your transaction pin has now been created",
        message: successResponse.message,
      ));

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void changePhoto(BuildContext context) {
    modalBottomSheet(
        context,
        ImageCameraPickerWidget(
            controller: changeAvatar,
            removePhotoCallBack: () {
              imageProfileFile = File('');
            },
            callBack: (imagePath, file, base64Image) async {
              changeAvatar.text = imagePath;

              imageProfileFile = File(file.path);

              Map<String, dynamic> sizes =
                  await ImageUtils.compressAndResizeImage(File(file.path));

              Uint8List imageBytes = Uint8List.fromList(sizes['bytes']);
              String base64String = base64Encode(imageBytes);

              'Base64-encoded String: $base64String'.log();

              // 'Original Size: ${sizes['originalSize']} bytes'.log();
              // 'Compressed Size: ${sizes['compressedSize']} bytes'.log();
              // 'Resized Size: ${sizes['resizedSize']} bytes'.log();

              // imageFile.text = base64String;

              updateProfilePic(base64String);

              AppPreferences.imageProfileFile = file.path;

              vibrate();

              notifyListeners();
            }),
        true,
        context.height / 3.1);
  }

  void updateProfilePic(String base64string) async {
    await changeLoaderStatus(true, "");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLProfileRepository.instance
            .updateProfilePicService(base64string);

    "responseDataUpdatePic $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      showSnackAtTheTop(message: successResponse.message, isSuccess: true);

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void resetTransactionPin(BuildContext context) async{
    await changeLoaderStatus(true, "Resetting transaction pin");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
    await PLProfileRepository.instance.resetTransactionPinService(newPin.text, oldPin.text);

    "responseDataresetTransactionPin $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      showSnackAtTheTop(message: successResponse.message, isSuccess: true);

      AppNavigator.push( SuccessWidget(
        primaryBtnText: "Proceed To Dashboard",
        hasPrimaryBtn: true,
        navigateToWidgetOnDone: PersistentTab(),
        desc: "Congrats!!!. Your transaction pin has now been reset successfully",
        message: successResponse.message,
      ));

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  void fillProfileDetails() {
    email.text = AppData.getUserProfileResponseModel?.emailAddress ?? "";
    firstName.text = AppData.getUserProfileResponseModel?.fullName ?? "";
    lastName.text = AppData.getUserProfileResponseModel?.fullName ?? "";
    phoneNumber.text = AppData.getUserProfileResponseModel?.phoneNumber ?? "";
    empCompanyName.text = AppData.getUserProfileResponseModel?.companyName ?? "";
    // lga.text = AppData.getUserProfileResponseModel?.companyName ?? "";
    // dateOfBirth.text = AppData.getUserProfileResponseModel?. ?? "";
  }

  defaultAllToEmpty() {

  }
}
