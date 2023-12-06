part of "package:peerlendly/shared/widgets/exports.dart";

List<Widget> buildPageIndicator(
    BuildContext context, int pageNumber, int currentPage,
    [Color bgColor = PLColors.appPrimaryColorMain500,
    double indicatorWidth = 30,
    bool isExpanded = false,
    bool isProgressBar = false]) {
  List<Widget> list = [];
  for (int i = 0; i < pageNumber; i++) {
    isExpanded || isProgressBar
        ? list.add(Expanded(
            child: i <= currentPage
                ? indicator(context, true, bgColor, indicatorWidth)
                : indicator(context, false, bgColor, indicatorWidth)))
        : list.add(i == currentPage
            ? indicator(context, true, bgColor, indicatorWidth)
            : indicator(context, false, PLColors.appSliderColor, 15));
  }
  return list;
}

Widget indicator(
    BuildContext context, bool isActive, Color bgColor, double indicatorWidth) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 4.0),
    height: 3.0,
    width: indicatorWidth,
    // isActive ? 50 : 5,
    decoration: BoxDecoration(
      color: isActive ? bgColor : bgColor.withOpacity(.3),
      borderRadius: const BorderRadius.all(Radius.circular(50)),
    ),
  );
}
