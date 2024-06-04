part of 'package:nova/modules/profile/exports.dart';

class PersonalInfoTab extends StatefulWidget {
  const PersonalInfoTab({Key? key}) : super(key: key);

  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  late ProfileProvider profileProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileProvider = Provider.of<ProfileProvider>(context, listen: false);

      profileProvider.fillProfileDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileProvider>();

    return SingleChildScrollView(
      child: Form(
        key: model.personalInfoFormKey,
        child: Column(
          children: [
            NovaPrimaryTextField(
              textInputType: TextInputType.text,
              controller: model.firstName,
              // isReadOnly: true,
              hintText: strFirstName,
              onChange: (val) => model.listenForPersonalInfoChanges(),
            ),
            NovaPrimaryTextField(
              textInputType: TextInputType.text,
              controller: model.lastName,
              // isReadOnly: true,
              hintText: strLastName,
              onChange: (val) => model.listenForPersonalInfoChanges(),
            ),
            NovaPrimaryTextField(
              textInputType: TextInputType.emailAddress,
              controller: model.email,
              isReadOnly: true,
              hintText: strEmail,
              onChange: (val) => model.listenForPersonalInfoChanges(),
            ),
            NovaPrimaryTextField(
                textInputType: TextInputType.number,
                controller: model.phoneNumber,
                formatter: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 11,
                onChange: (val) => model.listenForPersonalInfoChanges(),
                hintText: strPhoneNumber),
            NovaDatePickerTextField(
                datePickerController: model.dateOfBirth,
                noOfYears: 16,
                isTodayLastDate: true,
                hasNoTapFunction:
                    (AppData.getUserProfileResponseModel?.bvnVerified ?? false),
                onChange: (val) {
                  model.listenForPersonalInfoChanges();
                },
                text: strDateOfBirth),
            PLDropDownButtonWithIcon(
              list: AppData.meansOfId,
              title: "ID Type",
              value: model.idType,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            NovaPrimaryTextField(
                textInputType: TextInputType.text,
                controller: model.idNumber,
                // isReadOnly: true,
                onChange: (val) => model.listenForPersonalInfoChanges(),
                hintText: "ID Number"),
            PLDropDownButtonWithIcon(
              list: AppData.gender,
              title: "Gender",
              value: model.gender,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            PLDropDownButtonWithIcon(
              list: AppData.maritalStatus,
              title: "Marital Status",
              value: model.maritalStatus,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            PLDropDownButtonWithIcon(
              list: AppData.meansOfAddress,
              title: "Select Means of Address Verification (3 Months validity)",
              value: model.meansOfAddress,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            NovaPrimaryTextField(
                textInputType: TextInputType.text,
                controller: model.address,
                onChange: (val) => model.listenForPersonalInfoChanges(),
                suffixIcon: InkWell(
                  onTap: () {
                    ShowAddressReasonPop();
                  },
                  child: Icon(
                    Icons.info_outline,
                    color: NovaColors.appPrimaryColorMain500,
                  ),
                ),
                hintText: "Full Home Address"),
            PLDropDownButtonWithIcon(
              list: AppData.localGovernment,
              title: "Local Government",
              value: model.localGov,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            PLDropDownButtonWithIcon(
              list: AppData.state,
              title: "State",
              value: model.state,
              callBack: (val) {
                model.listenForPersonalInfoChanges();
              },
            ),
            NovaVSpace(32),
            NovaButtonRound(
                textTitle: strSave,
                // isFormValidated: model.isPersonalInfoUpdated,
                isLoader: model.isLoading,
                loadingString: model.loadingString,
                borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                functionToRun: () => model.updateProfileInfo(context, 1)
                // model.confirmProfileSavePersonalInfo(context, 1, model),
                ),
            NovaVSpace(16),
          ],
        ),
      ),
    );
  }

}
