part of 'package:nova/modules/profile/exports.dart';

class BankAccountsList extends StatefulWidget {
  const BankAccountsList({Key? key}) : super(key: key);

  @override
  State<BankAccountsList> createState() => _BankAccountsListState();
}

class _BankAccountsListState extends State<BankAccountsList> {
  late ProfileProvider myProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myProvider = Provider.of<ProfileProvider>(context, listen: false);
      myProvider.getBankDetails();
      myProvider.getNigeriaBanks();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileWatcher = context.watch<ProfileProvider>();

    "BankName ${myProvider.bankDetails?.bankName ?? ""}".logger();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: NovaPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(48),
                    NovaBackIcon(
                      onTap: () => Navigator.canPop(context)
                          ? Navigator.pop(context)
                          : AppNavigator.pushAndRemoveUtil(
                              const ProfileScreen()),
                    ),
                    NovaVSpace(8),
                    NovaTextWidget(
                      title: "Bank Account",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineSmall,
                    ),
                    NovaVSpace(24),

                    // Todo:
                    if (profileWatcher.bankDetails == null) ...[
                      InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const AddBankAccountScreen(),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: const NovaImagePng(
                              imgPath: NovaAssets.addBankAccount)),
                      NovaVSpace(24),
                    ],
                    if(profileWatcher.bankDetails != null)
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              // boxShadow: [PLDecorations.customShadow],
                              borderRadius:
                                  NovaDecorations.borderRadiusGeometryCircular8,
                              color: NovaColors.appWhiteColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NovaVSpace(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  NovaTextWidget(
                                    title: AppData.getUserProfileResponseModel?.fullName ?? '',
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appGrayText,
                                    textSize: NovaTypography.fontLabelMedium,
                                  ),

                                  // if(!(AppData.getUserProfileResponseModel?.bvnVerified ?? false))
                                  InkWell(
                                    onTap: (){
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: const VerifyBankAccountScreen(),
                                        withNavBar: false,
                                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                      );
                                    },
                                    child: NovaTextWidget(
                                      title: "Verify Bank Account to Get a Loan",
                                      textStyle: NovaTypography.textTitleLargeStyle,
                                      textColor: NovaColors.appPrimaryColorMain500,
                                      textSize: NovaTypography.fontLabelSmall,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // PLImageSvg(svgPath: PLAssets.blueCheckIcon)
                                ],
                              ),
                              NovaVSpace(12),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      if (!myProvider.isLoading &&
                                          myProvider
                                              .nigeriaBanks.isNotEmpty && (myProvider.bankDetails?.bankName ?? "").isNotEmpty) ...[
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: NovaDecorations
                                                .borderRadiusGeometryCircular16,
                                          ),
                                          child: NovaImageNetwork(
                                            networkPath: myProvider.nigeriaBanks
                                                .firstWhere((element) =>
                                                    element.bankName.toLowerCase() ==
                                                    (myProvider.bankDetails?.bankName ?? "").toLowerCase())
                                                .logo,
                                            width: 32.w,
                                            height: 32.h,
                                          ),
                                        ),
                                        NovaHSpace(12),
                                      ],
                                      NovaTextWidget(
                                        title: profileWatcher
                                                .bankDetails?.bankName ??
                                            "",
                                        textStyle:
                                            NovaTypography.textTitleLargeStyle,
                                        textColor: NovaColors.appPrimaryText,
                                        textSize: NovaTypography.fontBodyMedium,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  NovaTextWidget(
                                    title:
                                        "${profileWatcher.bankDetails?.accountNumber.substring(0, 4) ?? ""}******",
                                    textStyle: NovaTypography.textTitleLargeStyle,
                                    textColor: NovaColors.appPrimaryText,
                                    textSize: NovaTypography.fontBodyMedium,
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 16, vertical: 12),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                showAlertDialog(
                                    context, '',  RemoveBankCardPopup(id: profileWatcher.bankDetails?.userId ?? ''));
                              },
                              child: const Icon(
                                Icons.cancel_rounded,
                                color: NovaColors.appPrimaryColorMain500,
                                size: 15,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
