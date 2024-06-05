part of 'package:nova/modules/wallet/exports.dart';


class RecentPurchasesWidget extends StatelessWidget {
  const RecentPurchasesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NovaTextWidget(
              title: "Recent Purchases",
              textStyle: NovaTypography.textTitleSmallStyle,
              textSize: NovaTypography.fontDesc20,
              fontWeight: FontWeight.w700,
              fontFamily: NovaTypography.fontFamilyMedium,
              textColor: Color(0xff2E3A59),
              maxLines: 1,
            ),
          ],
        ),
        NovaVSpace(16),
        Column(
          children: [
            RecentPurchaseCardWidget(imgString: NovaAssets.sampleElectIcon, hasPopUp: false, dateCreated: DateTime.now().formatDate()),
            RecentPurchaseCardWidget(imgString: NovaAssets.sampleElectIcon, hasPopUp: false, dateCreated: DateTime.now().formatDate()),
            RecentPurchaseCardWidget(imgString: NovaAssets.sampleElectIcon, hasPopUp: false, dateCreated: DateTime.now().formatDate()),
            RecentPurchaseCardWidget(imgString: NovaAssets.sampleElectIcon, hasPopUp: false, dateCreated: DateTime.now().formatDate()),
            RecentPurchaseCardWidget(imgString: NovaAssets.sampleElectIcon, hasPopUp: false, dateCreated: DateTime.now().formatDate()),
            RecentPurchaseCardWidget(imgString: NovaAssets.sampleElectIcon, hasPopUp: false, dateCreated: DateTime.now().formatDate()),

          ],
        )
      ],
    );

  }
}
