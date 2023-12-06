part of 'package:peerlendly/modules/profile/exports.dart';

class PersonalInfoTab extends StatelessWidget {
  const PersonalInfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileProvider>();

    return SingleChildScrollView(
      child: Form(
        key: model.personalInfoFormKey,
        child: Column(
          children: [
            PLPrimaryTextField(
              textInputType: TextInputType.text,
              controller: model.firstName,
              // isReadOnly: true,
              hintText: strFirstName,
              onChange: (val) => model.listenForPersonalInfoChanges(),
            ),
            PLPrimaryTextField(
              textInputType: TextInputType.text,
              controller: model.lastName,
              // isReadOnly: true,
              hintText: strLastName,
              onChange: (val) => model.listenForPersonalInfoChanges(),
            ),
            PLPrimaryTextField(
              textInputType: TextInputType.emailAddress,
              controller: model.email,
              // isReadOnly: true,
              hintText: strEmail,
              onChange: (val) => model.listenForPersonalInfoChanges(),
            ),
            PLPrimaryTextField(
                textInputType: TextInputType.number,
                controller: model.phoneNumber,
                formatter: FilteringTextInputFormatter.digitsOnly,
                maxLength: 11,
                onChange: (val) => model.listenForPersonalInfoChanges(),
                hintText: strPhoneNumber),
            PlDatePickerTextField(
                datePickerController: model.dateOfBirth,
                noOfYears: 16,
                isTodayLastDate: true,
                onChange: (val) {

                  model.listenForPersonalInfoChanges();
                },
                text: strDateOfBirth),
            PLDropDownButtonWithIcon(
              list: UserData.meansOfId,
              title: "ID Type",
              value: model.idType,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            PLPrimaryTextField(
                textInputType: TextInputType.text,
                controller: model.idNumber,
                // isReadOnly: true,
                onChange: (val) => model.listenForPersonalInfoChanges(),
                hintText: "ID Number"),
            PLDropDownButtonWithIcon(
              list: UserData.gender,
              title: "Gender",
              value: model.gender,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            PLDropDownButtonWithIcon(
              list: UserData.maritalStatus,
              title: "Marital Status",
              value: model.maritalStatus,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            PLDropDownButtonWithIcon(
              list: UserData.meansOfAddress,
              title: "Select Means of Address Verification (3 Months validity)",
              value: model.meansOfAddress,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            PLPrimaryTextField(
                textInputType: TextInputType.text,
                controller: model.address,
                onChange: (val) => model.listenForPersonalInfoChanges(),
                hintText: "Full Home Address"),
            PLVSpace(32),
            PLButtonRound(
              textTitle: strSave,
              // isFormValidated: model.isPersonalInfoUpdated,
              isLoader: model.isLoading,
              loadingString: model.loadingString,
              borderRadius: PLDecorations.borderRadiusGeometryCircular8,
              functionToRun: () =>
                  model.updateProfileInfo(context, 1)
                  // model.confirmProfileSavePersonalInfo(context, 1, model),
            ),
            PLVSpace(16),
          ],
        ),
      ),
    );
  }
}
