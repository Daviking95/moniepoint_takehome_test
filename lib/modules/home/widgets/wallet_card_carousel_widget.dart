part of 'package:peerlendly/modules/home/exports.dart';

class WalletCardCarouselWidget extends StatefulWidget {
  const WalletCardCarouselWidget({Key? key}) : super(key: key);

  @override
  _WalletCardCarouselWidgetState createState() =>
      _WalletCardCarouselWidgetState();
}

class _WalletCardCarouselWidgetState extends State<WalletCardCarouselWidget> {
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
              const WalletCardWidget().marginOnly(right: 12),
              const LoanCardWidget(),
            ],
            options: CarouselOptions(
              height: 150.h,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              initialPage: 0,
              padEnds: false,
              onPageChanged: (index, _) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )),
        // CarouselSlider.builder(
        //   itemCount: 2,
        //   carouselController: _controller,
        //   itemBuilder: (context, index, realIndex) {
        //     return const WalletCardWidget().marginOnly(right: 12);
        //   },
        //   options: CarouselOptions(
        //     height: 150.h,
        //     enableInfiniteScroll: false,
        //     viewportFraction: 0.95,
        //     initialPage: 0,
        //     padEnds: false,
        //     onPageChanged: (index, _) {
        //       setState(() {
        //         _currentIndex = index;
        //       });
        //     },
        //   ),
        // ),
        PLVSpace(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildPageIndicator(context, 2, _currentIndex,
              PLColors.appPrimaryColorMain500, 30, false),
        ),
      ],
    );
  }
}
