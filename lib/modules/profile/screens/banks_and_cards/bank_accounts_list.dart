part of 'package:peerlendly/modules/profile/exports.dart';

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
    final profileReader = context.read<ProfileProvider>();

    "BankName ${myProvider.bankDetails?.bankName ?? ""}".logger();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: PLScaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: PLPaddedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PLVSpace(48),
                    PLBackIcon(
                      onTap: () => Navigator.canPop(context)
                          ? Navigator.pop(context)
                          : AppNavigator.pushAndRemoveUtil(
                              const ProfileScreen()),
                    ),
                    PLVSpace(8),
                    PLTextWidget(
                      title: "Bank Account",
                      isTitle: true,
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontHeadlineSmall,
                    ),
                    PLVSpace(24),

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
                          child: const PLImagePng(
                              imgPath: PLAssets.addBankAccount)),
                      PLVSpace(24),
                    ],
                    if(profileWatcher.bankDetails != null)
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              // boxShadow: [PLDecorations.customShadow],
                              borderRadius:
                                  PLDecorations.borderRadiusGeometryCircular8,
                              color: PLColors.appWhiteColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PLVSpace(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PLTextWidget(
                                    title: AppData.getUserProfileResponseModel?.fullName ?? '',
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appGrayText,
                                    textSize: PLTypography.fontLabelMedium,
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
                                    child: PLTextWidget(
                                      title: "Verify Bank Account to Get a Loan",
                                      textStyle: PLTypography.textTitleLargeStyle,
                                      textColor: PLColors.appPrimaryColorMain500,
                                      textSize: PLTypography.fontLabelSmall,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // PLImageSvg(svgPath: PLAssets.blueCheckIcon)
                                ],
                              ),
                              PLVSpace(12),
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
                                            borderRadius: PLDecorations
                                                .borderRadiusGeometryCircular16,
                                          ),
                                          child: PLImageNetwork(
                                            networkPath: myProvider.nigeriaBanks
                                                .firstWhere((element) =>
                                                    element.name.toLowerCase() ==
                                                    (myProvider.bankDetails?.bankName ?? "").toLowerCase())
                                                .logo,
                                            width: 32.w,
                                            height: 32.h,
                                          ),
                                        ),
                                        PLHSpace(12),
                                      ],
                                      PLTextWidget(
                                        title: profileWatcher
                                                .bankDetails?.bankName ??
                                            "",
                                        textStyle:
                                            PLTypography.textTitleLargeStyle,
                                        textColor: PLColors.appPrimaryText,
                                        textSize: PLTypography.fontBodyMedium,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  PLTextWidget(
                                    title:
                                        "${profileWatcher.bankDetails?.accountNumber.substring(0, 4) ?? ""}******",
                                    textStyle: PLTypography.textTitleLargeStyle,
                                    textColor: PLColors.appPrimaryText,
                                    textSize: PLTypography.fontBodyMedium,
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
                                color: PLColors.appPrimaryColorMain500,
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
