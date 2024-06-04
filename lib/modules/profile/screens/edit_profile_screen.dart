part of 'package:nova/modules/profile/exports.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileProvider>(
      vmBuilder: (context) =>
          ProfileProvider.prefillOnEditProfile(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ProfileProvider model) {
    final profileWatcher = context.watch<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Form(
                key: profileWatcher.formKey,
                child: NovaPaddedWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NovaVSpace(48),
                      NovaBackIcon(
                        onTap: () => Navigator.pop(context),
                      ),
                      NovaVSpace(16),
                      const Expanded(
                        child: CustomTabRounded(
                          tabTitleStringList: [
                            'Personal',
                            'Next of Kin',
                            'Employment',
                            'Upload'
                          ],
                          tabWidgetsList: [
                            PersonalInfoTab(),
                            NextOfKinTab(),
                            EmploymentTab(),
                            UploadTab()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

