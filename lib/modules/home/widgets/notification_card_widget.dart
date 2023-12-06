part of 'package:peerlendly/modules/home/exports.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: PLColors.appWhiteColor,
          borderRadius: PLDecorations.borderRadiusGeometryCircular8,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PLTextWidget(
                          title: "Title of Notification",
                          textStyle: PLTypography.textTitleSmallStyle,
                          textSize: PLTypography.fontTitleSmall,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        PLTextWidget(
                          title: "Notification description",
                          textStyle: PLTypography.textLabelSmallStyle,
                          textSize: PLTypography.fontLabelSmall,
                          textColor: PLColors.appSecondaryText,
                          maxLines: 4,
                        ),
                      ],
                    )
                  ],
                ).paddingOnly(left: 8, top: 12),
                PLVSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PLTextWidget(
                          title: "Date",
                          textStyle: PLTypography.textLabelSmallStyle,
                          textSize: PLTypography.fontLabelSmall,
                          textColor: PLColors.appSecondaryText,
                        ),
                        PLVSpace(2),
                        PLTextWidget(
                          title: DateTime.now().toString().formatDateString(),
                          textStyle: PLTypography.textLabelSmallStyle,
                          textSize: PLTypography.fontLabelSmall,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ).paddingOnly(left: 8, bottom: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PLTextWidget(
                          title: "Time",
                          textStyle: PLTypography.textLabelSmallStyle,
                          textSize: PLTypography.fontLabelSmall,
                          textColor: PLColors.appSecondaryText,
                        ),
                        PLVSpace(2),
                        PLTextWidget(
                          title: DateTime.now().formattedTime2(),
                          textStyle: PLTypography.textLabelSmallStyle,
                          textSize: PLTypography.fontLabelSmall,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ).paddingOnly(left: 8, bottom: 4),
                  ],
                ),
              ],
            ),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), topLeft: Radius.circular(8))),
                  child: PLTextWidget(
                    title: "New",
                    textStyle: PLTypography.textLabelSmallStyle,
                    textSize: PLTypography.fontLabelMedium,
                    fontWeight: FontWeight.w600,
                    textColor: PLColors.appWhiteColor,
                  ).paddingSymmetric(horizontal: 8, vertical: 8),
                ))
          ],
        ),
      ).marginSymmetric(horizontal: 4, vertical: 6),
    );
  }
}
