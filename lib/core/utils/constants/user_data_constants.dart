part of 'package:peerlendly/core/utils/constants/exports.dart';

class UserData {
  static LoanStatus loanStatus = LoanStatus.noLoan;

  static GetUserProfileResponseModel? getUserProfileResponseModel;

  static List<Map<String, dynamic>> meansOfId = [{'': 'International Passport'}, {'': 'NIN'}, {'': 'Driver Licence'}];

  static List<Map<String, dynamic>> loanPurpose = [{'': 'Personal'}, {'': 'Housing'}, {'': 'Rent'}, {'': 'Phone'}];

  static List<Map<String, dynamic>> maritalStatus = [{'': 'Single'}, {'': 'Married'}, {'': 'Divorced'}, {'': 'Others'}];

  static List<Map<String, dynamic>> meansOfAddress = [{'': 'Nepa Bill'}, {'': 'LAWMA'}];

  static List<Map<String, dynamic>> gender = [{'': 'Male'}, {'': 'Female'}];

  static List<Map<String, dynamic>> relationship = [{'': 'Father'}, {'': 'Mother'}, {'': 'Son'}, {'': 'Daughter'}, {'': 'Friend'}, {'': 'Wife'}, {'': 'Husband'}, {'': 'Others'}, {'': 'Default'}];
  static List<Map<String, dynamic>> employmentType = [{'': 'Employed'}, {'': 'Self-employed'}, {'': 'Unemployed'}, {'': 'Not Applicable'}];

  static List<Map<String, dynamic>> salaryDay = [{'': '24'}, {'': '25'}, {'': '26'}, {'': '27'}, {'': '28'}, {'': '29'}, {'': '30'}, {'': '31'}];

  static List<Map<String, dynamic>> localGovernment = [{'': 'Ojokoro'}, {'': 'Ijaiye'}, {'': 'Agege'}];

  static List<Map<String, dynamic>> state = [{'': 'Lagos'}, {'': 'Ogun'}, {'': 'Osun'}];

  static LendlyScoreResponseModel? lendlyScoreResponseModel;

  static String profilePicture = "";

}