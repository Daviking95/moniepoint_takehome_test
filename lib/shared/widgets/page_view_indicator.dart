part of "package:nova/shared/widgets/exports.dart";

List<Widget> buildPageIndicator(
    BuildContext context, int pageNumber, int currentPage,
    [Color bgColor = NovaColors.appPrimaryColorMain500,
    double indicatorWidth = 10,
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
            : indicator(context, false, NovaColors.appSliderColor, 10));
  }
  return list;
}

Widget indicator(
    BuildContext context, bool isActive, Color bgColor, double indicatorWidth) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 4.0),
    height: 7.5,
    width: indicatorWidth,
    // isActive ? 50 : 5,
    decoration: BoxDecoration(
      color: isActive ? bgColor : bgColor.withOpacity(.3),
      borderRadius: const BorderRadius.all(Radius.circular(50)),
    ),
  );
}
