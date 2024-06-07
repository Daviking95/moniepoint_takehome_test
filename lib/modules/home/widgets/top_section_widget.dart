part of 'package:moniepoint_mobile/modules/home/exports.dart';

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFf8f8f8),
            // Color(0xFFf8f7f5),
            Color(0xFFf9e8d6),
            Color(0xFFf8e1c4),
          ],
          stops: [0.3, 0.4, 0.7],
        ),
      ),
      child: MonieEstatePaddedWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MonieEstateVSpace(60),
            const TopRowWidget(),
            MonieEstateVSpace(32),
            const GreetingsWidget(),
            MonieEstateVSpace(32),
            const BuyAndRentWidget(),
            MonieEstateVSpace(24),
          ],
        ),
      ),
    );
  }
}
