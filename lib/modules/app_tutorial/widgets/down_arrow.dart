part of 'package:peerlendly/modules/app_tutorial/exports.dart';


class DownArrow extends StatelessWidget {
  const DownArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PLImageSvg(
        svgPath: PLAssets.loanJourneyDownArrow,
        width: 15.w,
        height: 15.h,
      ),
    ).marginSymmetric(vertical: 8);
  }
}
