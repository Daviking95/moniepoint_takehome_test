part of 'package:nova/modules/profile/exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late ProfileProvider profileProvider;
  late DashboardProvider dashboardProvider;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);

    dashboardProvider.getUserProfile();
    dashboardProvider.getProfilePic();

  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileProvider>(
      vmBuilder: (context) => ProfileProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ProfileProvider model) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NovaVSpace(48),
                  NovaPaddedWidget(
                      child: NovaBackIcon(
                    onTap: () => AppNavigator.push(const PersistentTab()),
                  )),
                  NovaVSpace(8),
                  const ProfileImageWithDetails(),
                  NovaVSpace(16),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          color: NovaColors.appBackgroundColor),
                      child: const NovaPaddedWidget(
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
              icon: NovaAssets.bankAccountIcon,
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
            color: NovaColors.appSecondaryText.withOpacity(.2),
          ),
          ProfileItem(
              icon: NovaAssets.tellFriendIcon,
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
            color: NovaColors.appSecondaryText.withOpacity(.2),
          ),
          ProfileItem(
              icon: NovaAssets.helpIcon,
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
            color: NovaColors.appSecondaryText.withOpacity(.2),
          ),
          ProfileItem(
              icon: NovaAssets.settingsIcon,
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
            color: NovaColors.appSecondaryText.withOpacity(.2),
          ),
          ProfileItem(
              icon: NovaAssets.aboutUsIcon,
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
        NovaVSpace(16)
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
                    borderRadius: NovaDecorations.borderRadiusGeometryCircular8
                  ),
                  child: icon.endsWith("png") ?
                  NovaImagePng(
                    imgPath: icon,
                    height: 20,
                    width: 20,
                  ).paddingAll(8) : NovaImageSvg(
                    svgPath: icon,
                    height: 20,
                    width: 20,
                  ).paddingAll(8),
                ),
                NovaHSpace(16),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NovaTextWidget(
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
            color: NovaColors.appPrimaryText,
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
        color: NovaColors.appWhiteColor,
        borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
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
        ProfileImageWidget(imageFile: AppData.profilePicture,
          size: 70,
          memoryImage: profileWatcher.changeAvatar.text,),
        NovaVSpace(8),
        InkWell(
          onTap: () {
            profileWatcher.changePhoto(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const NovaImageSvg(svgPath: NovaAssets.photoChange),
              NovaHSpace(8),
              NovaTextWidget(
                title: "Change photo",
                textSize: NovaTypography.fontLabelSmall,
                textColor: NovaColors.appPrimaryColorMain500,
              ),
            ],
          ),
        ),
        NovaVSpace(16),
        NovaTextWidget(
          title: AppData.getUserProfileResponseModel?.fullName ?? "",
          fontWeight: FontWeight.w600,
          textSize: NovaTypography.fontBodyLarge,
          fontFamily: NovaTypography.fontFamilyBold,
          textColor: NovaColors.appPrimaryText,
        ),
        NovaVSpace(8),
        NovaTextWidget(
          title: "Lendly Score ${(AppData.lendlyScoreResponseModel?.lendlyScore ?? 0).toString()}",
          textStyle: NovaTypography.textBodySmallStyle,
          textSize: NovaTypography.fontLabelSmall,
          textColor: NovaColors.appPrimaryColorMain500,
          maxLines: 1,
        ),
      ],
    );
  }
}
