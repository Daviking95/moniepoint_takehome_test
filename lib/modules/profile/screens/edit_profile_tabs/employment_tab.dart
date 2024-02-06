part of 'package:peerlendly/modules/profile/exports.dart';

class EmploymentTab extends StatelessWidget {
  const EmploymentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileProvider>();

    return SingleChildScrollView(
      child: Form(
        key: model.employmentFormKey,
        child: Column(
          children: [
            PLDropDownButtonWithIcon(
              list: AppData.employmentType,
              title: "Employment Type",
              value: model.empEmploymentType,
              callBack: (val) {
                model.listenForEmploymentTabChanges();
              },
            ),
            PLPrimaryTextField(
              textInputType: TextInputType.number,
              controller: model.empMonthlyIncome,
              formatter: [CurrencyTextInputFormatter(symbol: strCurrency2)],
              fillColor: PLColors.appWhiteColor,
              onChange: (val) => model.listenForEmploymentTabChanges(),

              validation: (val) => val.validateAmount(strFieldRequiredError, 0),
              hintText: "Approximately how much do you make every month?",
              // onChange: (val) => model.listenForLoanApplyChanges(),
            ),
            PLDropDownButtonWithIcon(
              list: AppData.salaryDay,
              title: "Salary Day",
              value: model.empSalaryDay,
              callBack: (val) {
                model.listenForEmploymentTabChanges();
              },
            ),
            PLPrimaryTextField(
              textInputType: TextInputType.text,
              controller: model.empJobTitle,
              onChange: (val) => model.listenForEmploymentTabChanges(),

              hintText: "Job Title",
            ),
            PLPrimaryTextField(
              textInputType: TextInputType.text,
              controller: model.empCompanyName,
              onChange: (val) => model.listenForEmploymentTabChanges(),

              hintText: "Company Name",
            ),
            PLPrimaryTextField(
              textInputType: TextInputType.emailAddress,
              controller: model.empOfficeEmail,
              onChange: (val) => model.listenForEmploymentTabChanges(),

              hintText: "Your Office Email",
            ),
            PLPrimaryTextField(
                textInputType: TextInputType.text,
                controller: model.empOfficeAddress,
                onChange: (val) => model.listenForEmploymentTabChanges(),
                hintText: "Office Address"),
            PLDropDownButtonWithIcon(
              list: AppData.localGovernment,
              title: "Local Government",
              value: model.empLocalGov,
              callBack: (val) {
                model.listenForEmploymentTabChanges();
              },
            ),
            PLDropDownButtonWithIcon(
              list: AppData.state,
              title: "State",
              value: model.empState,
              callBack: (val) {
                model.listenForEmploymentTabChanges();
              },
            ),
            PLVSpace(32),
            PLButtonRound(
              textTitle: strSave,
              isFormValidated: model.isEmploymentFormValidated,
              isLoader: model.isLoading,
              loadingString: model.loadingString,
              borderRadius: PLDecorations.borderRadiusGeometryCircular8,
              functionToRun: () =>
                  model.updateProfileInfo(context, 3)
                  // model.confirmProfileSavePersonalInfo(context, 3, model),
            ),
            PLVSpace(16),
          ],
        ),
      ),
    );
  }
}
