part of 'package:moniepoint_mobile/modules/home/exports.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeProvider>(
      vmBuilder: (context) =>
          HomeProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, HomeProvider model) {
    var homeWatcher = context.watch<HomeProvider>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        height: context.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                MonieEstateAssets.map,
              ),
              fit: BoxFit.cover),
        ),
        child: MonieEstatePaddedWidget(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: const SearchBox()
                        .animate()
                        .fade(duration: const Duration(milliseconds: 1000))
                        .scale(),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: MonieEstateColors.appWhiteColor,
                      child: MonieEstateImagePng(
                        imgPath: MonieEstateAssets.filterIcon,
                        width: 20.w,
                        height: 20.h,
                        color: MonieEstateColors.appBlackColor,
                      ),
                    )
                        .animate()
                        .fade(duration: const Duration(milliseconds: 1000))
                        .scale(),
                  )
                ],
              ).marginOnly(top: 40),
              const MapPins(
                top: 150,
                left: 30,
                text: "25mn",
              ),
              const MapPins(
                top: 350,
                left: 60,
                text: "13mn",
              ),
              const MapPins(
                top: 180,
                left: 150,
                text: "50mn",
              ),
              const MapPins(
                top: 300,
                left: 220,
                text: "15mn",
              ),
              const MapPins(
                top: 500,
                left: 200,
                text: "20mn",
              ),
              Positioned(
                bottom: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor:
                          MonieEstateColors.appRoundCardColor.withOpacity(.7),
                      child: MonieEstateImagePng(
                        imgPath: MonieEstateAssets.stackIcon,
                        width: 25.w,
                        height: 25.h,
                        color: MonieEstateColors.appWhiteColor,
                      ),
                    ).animate()
                        .fade(duration: const Duration(milliseconds: 1200))
                        .scale(),
                    MonieEstateVSpace(4),
                    InkWell(
                      onTap: () {
                        homeWatcher.toggleMapActions();
                      },
                      child: CircleAvatar(
                        maxRadius: 30,
                        backgroundColor:
                            MonieEstateColors.appRoundCardColor.withOpacity(.7),
                        child: MonieEstateImagePng(
                          imgPath: MonieEstateAssets.navigatorIcon,
                          width: 25.w,
                          height: 25.h,
                          color: MonieEstateColors.appWhiteColor,
                        ),
                      ),
                    ).animate()
                        .fade(duration: const Duration(milliseconds: 1200))
                        .scale(),
                  ],
                ),
              ),
              if (homeWatcher.isOptionOpen)
                Positioned(
                  bottom: 185,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: MonieEstateDecorations
                            .borderRadiusGeometryCircular16,
                        color: const Color(0xfffbf5eb)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MapActionItem(
                            imgAsset: MonieEstateAssets.guardIcon,
                            text: "Cosy Areas"),
                        const MapActionItem(
                            imgAsset: MonieEstateAssets.walletIcon,
                            text: "Price"),
                        const MapActionItem(
                            imgAsset: MonieEstateAssets.basketIcon,
                            text: "Infrastructure"),
                        InkWell(
                            onTap: () => homeWatcher.toggleMapPins(),
                            child: const MapActionItem(
                                imgAsset: MonieEstateAssets.stackIcon,
                                text: "Without any layer")),
                      ],
                    ).paddingSymmetric(horizontal: 16, vertical: 16),
                  ).animate().scaleX(),
                ),
              Positioned(
                  right: 0,
                  bottom: 120,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          MonieEstateDecorations.borderRadiusGeometryCircular50,
                      color:
                          MonieEstateColors.appRoundCardColor.withOpacity(.7),
                    ),
                    child: Row(
                      children: [
                        MonieEstateImagePng(
                          imgPath: MonieEstateAssets.listIcon,
                          width: 25.w,
                          height: 25.h,
                          color: MonieEstateColors.appWhiteColor,
                        ),
                        MonieEstateHSpace(8),
                        MonieEstateTextWidget(
                          title: "List of variants",
                          textSize: MonieEstateTypography.fontTitleMedium,
                          fontFamily: MonieEstateTypography.fontFamilyRegular,
                          textAlign: TextAlign.left,
                          textColor:
                              MonieEstateColors.appWhiteColor.withOpacity(.8),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 24, vertical: 16),
                  )

              )
            ],
          ),
        ),
      ),
    );
  }
}
