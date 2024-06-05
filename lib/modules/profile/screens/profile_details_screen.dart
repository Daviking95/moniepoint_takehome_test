part of 'package:nova/modules/profile/exports.dart';


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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: RefreshIndicator(
                onRefresh: () {

                  dashboardProvider.getProfilePic();
                  return dashboardProvider.getUserProfile();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: NovaPaddedWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        NovaVSpace(48),
                        NovaBackIcon(onTap: () => Navigator.pop(context),),

                        NovaVSpace(24),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
                              color: NovaColors.appWhiteColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ProfileImageWidget(imageFile: AppData.profilePicture, size: 40),
                                  NovaHSpace(12),
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.fullName.toTitleCase ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryColorMain500,
                                    textSize: NovaTypography.fontTitleMedium,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  NovaTextWidget(
                                    title: "Lendly Score",
                                    textStyle: NovaTypography.textBodySmallStyle,
                                    textSize: NovaTypography.fontLabelSmall,
                                    textColor: NovaColors.appGrayText,
                                    maxLines: 1,
                                  ),
                                ],
                              )
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 8),
                        ),
                        NovaVSpace(16),
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
                              NovaTextWidget(
                                title: "Edit Profile",
                                textStyle: NovaTypography.textBodySmallStyle,
                                textSize: NovaTypography.fontLabelMedium,
                                textColor: NovaColors.appPrimaryColorMain500,
                                maxLines: 1,
                              ),
                              NovaHSpace(8),
                              const Icon(Icons.edit, size: 12, color: NovaColors.appPrimaryColorMain500,)
                            ],
                          ),
                        ),
                        NovaVSpace(16),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              NovaDecorations.borderRadiusGeometryCircular8,
                              color: NovaColors.appWhiteColor),
                          child: Column(
                            children: [

                              _loanDetailsItem(
                                  'Name',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.fullName ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Email',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.emailAddress ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Phone Number',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.phoneNumber ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Address',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.address ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'LGA',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.lga ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Nova Referral Code',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.referralCode ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'State',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.state ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              Divider(
                                color: NovaColors.appGrayText.withOpacity(.6),
                              ),


                              _loanDetailsItem(
                                  'Employment Status',
                                  NovaTextWidget(
                                    title: AppData.employmentType.elementAt(int.parse(AppData.getUserProfileResponseModel?.employmentStatus ?? "")).values.first,
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Company Name',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.companyName ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),

                              _loanDetailsItem(
                                  'Joined On',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.startDate.formatDate() ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                              _loanDetailsItem(
                                  'Monthly Earnings',
                                  NovaTextWidget(
                                    title: double.parse(AppData.getUserProfileResponseModel?.monthlyEarnings ?? "0.0")
                                        .toString()
                                        .formatWithCommasAndDecimals(),
                                    textStyle: NovaTypography.textTitleSmallStyle,
                                    textSize: NovaTypography.fontLabelSmall,
                                    fontWeight: FontWeight.w600,
                                    textColor: NovaColors.appPrimaryText,
                                    maxLines: 1,
                                    isCurrency: true,
                                  )),
                              _loanDetailsItem(
                                  'Proof of Employment',
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.proofOfEmployment ?? "",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    fontWeight: FontWeight.w600,
                                    textSize: NovaTypography.fontLabelSmall,
                                  )),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 16),
                        ),
                        NovaVSpace(24),
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
        NovaTextWidget(
          title: title,
          textStyle: NovaTypography.textTitleLargeStyle,
          textColor: NovaColors.appGrayText,
          textSize: NovaTypography.fontLabelSmall,
        ),
        child
      ],
    ).marginSymmetric(vertical: 8);
  }
}
