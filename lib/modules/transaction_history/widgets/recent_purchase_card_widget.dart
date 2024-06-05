part of 'package:nova/modules/transaction_history/exports.dart';


class RecentPurchaseCardWidget extends StatelessWidget {
  final String imgString;
  final bool hasPopUp;
  final String dateCreated;

  const RecentPurchaseCardWidget(
      {Key? key,
        required this.imgString,
        required this.dateCreated,
        this.hasPopUp = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: hasPopUp
          ? () {
        // PersistentNavBarNavigator.pushNewScreen(
        //   context,
        //   screen: const TransactionSummaryScreen(),
        //   withNavBar: false,
        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
      }
          : () {},
      child: Container(
        decoration: BoxDecoration(
            // color: NovaColors.appWhiteColor,
            borderRadius: NovaDecorations.borderRadiusGeometryCircular8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NovaImagePng(imgPath: imgString, width: 40.w, height: 40.h,),
            NovaHSpace(8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NovaTextWidget(
                    title: "Ikeja Electricity",
                    textColor: NovaColors.appPrimaryText,
                    fontFamily: NovaTypography.fontFamilyMedium,
                    fontWeight: FontWeight.w600,
                    textSize: NovaTypography.fontBodyLarge,
                  ),
                  NovaVSpace(8),
                  NovaTextWidget(
                    title: "8063579245",
                    textColor: Color(0xff9D9B9B),
                    textSize: NovaTypography.fontLabelMedium,
                  ),
                ],
              ),
            ),
            NovaHSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                NovaTextWidget(
                  title: dateCreated,
                  textColor: Color(0xff9D9B9B),
                  textSize: NovaTypography.fontLabelMedium,
                ),
              ],
            ),
          ],
        ),
      ).marginOnly(bottom: 18),
    );
  }
}
