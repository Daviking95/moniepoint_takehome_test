part of 'package:peerlendly/modules/profile/exports.dart';


class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {

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
    final profileWatcher = context.watch<ProfileProvider>();
    final profileReader = context.read<ProfileProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: RefreshIndicator(
                onRefresh: () {

                  dashboardProvider.getProfilePic();
                  return dashboardProvider.getUserProfile();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: PLPaddedWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PLVSpace(48),
                        PLBackIcon(onTap: () => Navigator.pop(context),),

                        PLVSpace(24),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: PLDecorations.borderRadiusGeometryCircular8,
                              color: PLColors.appWhiteColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ProfileImageWidget(imageFile: AppData.profilePicture, size: 40),
                                  PLHSpace(12),
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.fullName.toTitleCase ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryColorMain500,
                                    textSize: PLTypography.fontTitleMedium,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  PLTextWidget(
                                    title: "Lendly Score",
                                    textStyle: PLTypography.textBodySmallStyle,
                                    textSize: PLTypography.fontLabelSmall,
                                    textColor: PLColors.appGrayText,
                                    maxLines: 1,
                                  ),
                                  PLVSpace(4),
                                  InkWell(
                                    onTap: () {},
                                    child: LendlyScoreCard(
                                      score:
                                      AppData.lendlyScoreResponseModel?.lendlyScore ?? 0,
                                      bgColor: PLColors.appGreenColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 8),
                        ),
                        PLVSpace(16),
                        InkWell(
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const EditProfileScreen(),
                              withNavBar: false,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PLTextWidget(
                                title: "Edit Profile",
                                textStyle: PLTypography.textBodySmallStyle,
                                textSize: PLTypography.fontLabelMedium,
                                textColor: PLColors.appPrimaryColorMain500,
                                maxLines: 1,
                              ),
                              PLHSpace(8),
                              const Icon(Icons.edit, size: 12, color: PLColors.appPrimaryColorMain500,)
                            ],
                          ),
                        ),
                        PLVSpace(16),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              PLDecorations.borderRadiusGeometryCircular8,
                              color: PLColors.appWhiteColor),
                          child: Column(
                            children: [

                              _loanDetailsItem(
                                  'Name',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.fullName ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Email',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.emailAddress ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Phone Number',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.phoneNumber ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Address',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.address ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'LGA',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.lga ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Peer Lendly Referral Code',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.referralCode ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'State',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.state ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              Divider(
                                color: PLColors.appGrayText.withOpacity(.6),
                              ),


                              _loanDetailsItem(
                                  'Employment Status',
                                  PLTextWidget(
                                    title: AppData.employmentType.elementAt(int.parse(AppData.getUserProfileResponseModel?.employmentStatus ?? "")).values.first,
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Company Name',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.companyName ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Joined On',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.startDate?.formatDate() ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Monthly Earnings',
                                  PLTextWidget(
                                    title: double.parse(AppData.getUserProfileResponseModel?.monthlyEarnings ?? "0.0")
                                        .toString()
                                        .formatWithCommasAndDecimals(),
                                    textStyle: PLTypography.textTitleSmallStyle,
                                    textSize: PLTypography.fontLabelSmall,
                                    fontWeight: FontWeight.w600,
                                    textColor: PLColors.appPrimaryText,
                                    maxLines: 1,
                                    isCurrency: true,
                                  )),
                              _loanDetailsItem(
                                  'Proof of Employment',
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.proofOfEmployment ?? "",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: PLTypography.fontLabelSmall,
                                  )),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        PLVSpace(24),
                        // ProfileItemCard(profileItems: [
                        //   ProfileItem(icon: "", title: "Close Account", desc: strAppSecurityDesc, func: () {
                        //
                        //   }),
                        // ]),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  _loanDetailsItem(String title, Widget child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PLTextWidget(
          title: title,
          textStyle: PLTypography.textTitleLargeStyle,
          textColor: PLColors.appGrayText,
          textSize: PLTypography.fontLabelSmall,
        ),
        child
      ],
    ).marginSymmetric(vertical: 8);
  }
}
