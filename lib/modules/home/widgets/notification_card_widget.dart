part of 'package:nova/modules/home/exports.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: NovaColors.appWhiteColor,
          borderRadius: NovaDecorations.borderRadiusGeometryCircular8,
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
                        NovaTextWidget(
                          title: "Title of Notification",
                          textStyle: NovaTypography.textTitleSmallStyle,
                          textSize: NovaTypography.fontTitleSmall,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        NovaTextWidget(
                          title: "Notification description",
                          textStyle: NovaTypography.textLabelSmallStyle,
                          textSize: NovaTypography.fontLabelSmall,
                          textColor: NovaColors.appSecondaryText,
                          maxLines: 4,
                        ),
                      ],
                    )
                  ],
                ).paddingOnly(left: 8, top: 12),
                NovaVSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaTextWidget(
                          title: "Date",
                          textStyle: NovaTypography.textLabelSmallStyle,
                          textSize: NovaTypography.fontLabelSmall,
                          textColor: NovaColors.appSecondaryText,
                        ),
                        NovaVSpace(2),
                        NovaTextWidget(
                          title: DateTime.now().toString().formatDateString(),
                          textStyle: NovaTypography.textLabelSmallStyle,
                          textSize: NovaTypography.fontLabelSmall,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ).paddingOnly(left: 8, bottom: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NovaTextWidget(
                          title: "Time",
                          textStyle: NovaTypography.textLabelSmallStyle,
                          textSize: NovaTypography.fontLabelSmall,
                          textColor: NovaColors.appSecondaryText,
                        ),
                        NovaVSpace(2),
                        NovaTextWidget(
                          title: DateTime.now().formattedTime2(),
                          textStyle: NovaTypography.textLabelSmallStyle,
                          textSize: NovaTypography.fontLabelSmall,
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
                  child: NovaTextWidget(
                    title: "New",
                    textStyle: NovaTypography.textLabelSmallStyle,
                    textSize: NovaTypography.fontLabelMedium,
                    fontWeight: FontWeight.w600,
                    textColor: NovaColors.appWhiteColor,
                  ).paddingSymmetric(horizontal: 8, vertical: 8),
                ))
          ],
        ),
      ).marginSymmetric(horizontal: 4, vertical: 6),
    );
  }
}
