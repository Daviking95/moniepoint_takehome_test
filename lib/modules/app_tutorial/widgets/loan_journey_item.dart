part of 'package:peerlendly/modules/app_tutorial/exports.dart';


class LoanJourneyItem extends StatelessWidget {
  final String title;
  final String icon1;
  const LoanJourneyItem(this.icon1, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: PLDecorations.borderRadiusGeometryCircular8,
          color: PLColors.appPrimaryColorMain500.withOpacity(.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PLTextWidget(
            title: title,
            fontWeight: FontWeight.w600,
            textSize: PLTypography.fontBodyMedium,
          ),
          PLImagePng(
            imgPath: icon1,
            width: 60.w,
            height: 60.h,
          )
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 8),
    );
  }
}
