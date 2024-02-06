part of 'package:peerlendly/modules/home/exports.dart';


class BannerCarouselWidget extends StatefulWidget {
  const BannerCarouselWidget({Key? key}) : super(key: key);

  @override
  _BannerCarouselWidgetState createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // DashboardController controller = Provider.of<DashboardController>(context, listen: false);
    // Future.delayed(Duration.zero, () {
    //   controller.getWalletDetailsListCached = controller.getWalletDetailsList;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final dashboardWatcher = Provider.of<DashboardProvider>(context);

    return Column(
      children: [
        CarouselSlider(
            items: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: PLDecorations.borderRadiusGeometryCircular16,
                  color: PLColors.appGreenColor,
                ),
                height: 100.h,
              ).marginOnly(right: 12),
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: PLDecorations.borderRadiusGeometryCircular16,
                  color: PLColors.appPrimaryText,
                ),
              ),
            ],
            options: CarouselOptions(
              height: 105.h,
              enableInfiniteScroll: false,
              viewportFraction: 0.95,
              initialPage: 0,
              padEnds: false,
              onPageChanged: (index, _) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )),
        PLVSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildPageIndicator(context, 2, _currentIndex,
              PLColors.appPrimaryColorMain500, 30, false),
        ),
      ],
    );
  }
}
