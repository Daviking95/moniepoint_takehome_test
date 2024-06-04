part of 'package:nova/modules/home/exports.dart';


class BannerCarouselWidget extends StatefulWidget {
  const BannerCarouselWidget({Key? key}) : super(key: key);

  @override
  _BannerCarouselWidgetState createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        CarouselSlider(
            items: [
              promoCard(NovaAssets.promoSample, ""),
              promoCard(NovaAssets.promoSample, ""),
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
        NovaVSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildPageIndicator(context, 2, _currentIndex,
              NovaColors.appPrimaryColorMain500, 30, false),
        ),
      ],
    );
  }

  Widget promoCard(image, text) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        // color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              // todo: Use this to add subtle inner shadow below your image
                begin: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.9
                ],
                colors: [
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.1),
                ])),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

}
