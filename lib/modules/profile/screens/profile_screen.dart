part of 'package:peerlendly/modules/profile/exports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileProvider>(
      vmBuilder: (context) => ProfileProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ProfileProvider model) {
    final profileReader = context.read<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PLVSpace(48),
                  PLPaddedWidget(
                      child: PLBackIcon(
                    onTap: () => AppNavigator.push(const PersistentTab()),
                  )),
                  PLVSpace(8),
                  const ProfileImageWithDetails(),
                  PLVSpace(16),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          color: PLColors.appBackgroundColor),
                      child: const PLPaddedWidget(
                        child: SingleChildScrollView(
                            child: ProfileItemChildContainer()),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class ProfileItemChildContainer extends StatelessWidget {
  const ProfileItemChildContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItemCard(profileItems: [
          ProfileItem(
              icon: "",
              title: "View Profile Card",
              desc: strAppSecurityDesc,
              func: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ProfileDetailsScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
        ]),
        ProfileItemCard(profileItems: [
          ProfileItem(
              icon: PLAssets.bankAccountIcon,
              title: "Bank Account and Cards",
              desc: strHelpSupportDesc,
              func: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const BankAndCardsScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
          Divider(
            color: PLColors.appSecondaryText.withOpacity(.2),
          ),
          ProfileItem(
              icon: PLAssets.tellFriendIcon,
              title: "Tell a Friend",
              desc: strTermsConditionsDesc,
              func: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ShareAndEarnScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
          Divider(
            color: PLColors.appSecondaryText.withOpacity(.2),
          ),
          ProfileItem(
              icon: PLAssets.helpIcon,
              title: "Help",
              desc: strContactUsDesc,
              func: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const HelpAndSupport(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
          Divider(
            color: PLColors.appSecondaryText.withOpacity(.2),
          ),
          ProfileItem(
              icon: PLAssets.settingsIcon,
              title: "Settings",
              desc: strContactUsDesc,
              func: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const AppSettingScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
          Divider(
            color: PLColors.appSecondaryText.withOpacity(.2),
          ),
          ProfileItem(
              icon: PLAssets.aboutUsIcon,
              title: "About Us",
              desc: strContactUsDesc,
              func: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const AboutUsScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
        ]),
        ProfileItemCard(profileItems: [
          ProfileItem(
              icon: "",
              title: strLogout,
              desc: strLogoutDesc,
              func: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const LoginScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
        ]),
        PLVSpace(16)
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;
  final Function func;
  final Widget? suffixIcon;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.func,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => func(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon.isNotEmpty) ...[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFCFE),
                    borderRadius: PLDecorations.borderRadiusGeometryCircular8
                  ),
                  child: icon.endsWith("png") ?
                  PLImagePng(
                    imgPath: icon,
                    height: 20,
                    width: 20,
                  ).paddingAll(8) : PLImageSvg(
                    svgPath: icon,
                    height: 20,
                    width: 20,
                  ).paddingAll(8),
                ),
                PLHSpace(16),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PLTextWidget(
                    title: title,
                    fontWeight: FontWeight.w600,
                  ),
                  // PLHSpace(4),
                  // PLTextWidget(
                  //   title: desc,
                  //   textColor: PLColors.appSecondaryText,
                  //   textSize: PLTypography.fontLabelSmall,
                  // ),
                ],
              )
            ],
          ),

          suffixIcon ??
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: PLColors.appPrimaryText,
          )
        ],
      ).paddingSymmetric(vertical: 6).marginSymmetric(vertical: 8),
    );
  }
}

class ProfileItemCard extends StatelessWidget {
  final List<Widget> profileItems;

  const ProfileItemCard({super.key, required this.profileItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PLColors.appWhiteColor,
        borderRadius: PLDecorations.borderRadiusGeometryCircular8,
      ),
      child: Column(
        children: [...profileItems.map((e) => e).toList()],
      ).paddingSymmetric(horizontal: 16, vertical: 4),
    ).marginSymmetric(vertical: 8);
  }
}

class ProfileImageWithDetails extends StatelessWidget {
  const ProfileImageWithDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const ProfileImageWidget(imageFile: "", size: 70),
        ProfileImageWidget(imageFile: UserData.profilePicture,
          size: 70,
          memoryImage: profileWatcher.changeAvatar.text,),
        PLVSpace(8),
        InkWell(
          onTap: () {
            profileWatcher.changePhoto(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PLImageSvg(svgPath: PLAssets.photoChange),
              PLHSpace(8),
              PLTextWidget(
                title: "Change photo",
                textSize: PLTypography.fontLabelSmall,
                textColor: PLColors.appPrimaryColorMain500,
              ),
            ],
          ),
        ),
        PLVSpace(16),
        PLTextWidget(
          title: UserData.getUserProfileResponseModel?.fullName ?? "",
          fontWeight: FontWeight.w600,
          textSize: PLTypography.fontBodyLarge,
          fontFamily: PLTypography.fontFamilyBold,
          textColor: PLColors.appPrimaryText,
        ),
      ],
    );
  }
}
