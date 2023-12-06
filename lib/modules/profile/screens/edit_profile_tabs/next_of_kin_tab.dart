part of 'package:peerlendly/modules/profile/exports.dart';

class NextOfKinTab extends StatelessWidget {
  const NextOfKinTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileProvider>();

    return SingleChildScrollView(
      child: Form(
        key: model.nextOfKinFormKey,
        child: Column(
          children: [
            PLPrimaryTextField(
              textInputType: TextInputType.text,
              controller: model.nokFullName,
              onChange: (val) => model.listenForNOKChanges(),
              hintText: strFulllName,
            ),
            PLDropDownButtonWithIcon(
              list: UserData.relationship,
              title: "Relationship",
              value: model.nokRelationship,
              callBack: (val) {
                model.listenForNOKChanges();
              },
            ),
            PLPrimaryTextField(
              textInputType: TextInputType.emailAddress,
              controller: model.nokEmail,
              onChange: (val) => model.listenForNOKChanges(),
              hintText: strEmail,
            ),
            PLPrimaryTextField(
                textInputType: TextInputType.number,
                controller: model.nokPhone,
                onChange: (val) => model.listenForNOKChanges(),
                formatter: FilteringTextInputFormatter.digitsOnly,
                maxLength: 11,
                hintText: strPhoneNumber),
            PLPrimaryTextField(
                textInputType: TextInputType.text,
                controller: model.nokAddress,
                onChange: (val) => model.listenForNOKChanges(),
                hintText: "Next of Kin Address"),
            PLVSpace(32),
            PLButtonRound(
              textTitle: strSave,
              isFormValidated: model.isNextOfKinFormValidated,
              isLoader: model.isLoading,
              loadingString: model.loadingString,
              borderRadius: PLDecorations.borderRadiusGeometryCircular8,
              functionToRun: () =>
                  model.updateProfileInfo(context, 2)
                  // model.confirmProfileSavePersonalInfo(context, 2, model),
            ),
            PLVSpace(16),
          ],
        ),
      ),
    );
  }
}
