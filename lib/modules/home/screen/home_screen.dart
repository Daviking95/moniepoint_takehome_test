part of 'package:moniepoint_mobile/modules/home/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MonieEstateScaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            expandedHeight: 430.0,
            flexibleSpace: FlexibleSpaceBar(
              background: IntrinsicHeight(
                child: TopSectionWidget(),
              ),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
                StretchMode.blurBackground,
              ],
            ),
            stretch: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFf8e1c4),
              child: Container(
                decoration: const BoxDecoration(
                  color: MonieEstateColors.appWhiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const BottomSectionWidget(),
                    MonieEstateVSpace(100)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
