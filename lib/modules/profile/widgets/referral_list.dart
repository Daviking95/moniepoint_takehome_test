part of 'package:peerlendly/modules/profile/exports.dart';

class ReferralList extends StatelessWidget {
  const ReferralList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        for(var i = 0; i < 3; i++) ...[
          ReferralCard(),
        ]
      ],
    );
  }
}

class ReferralCard extends StatelessWidget {
  const ReferralCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // AppNavigator.push(const AcceptRejectOfferSummaryScreen());
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: PLColors.appWhiteColor,
                borderRadius: PLDecorations.borderRadiusGeometryCircular8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffEEF4FC),
                  radius: 20,
                  child: Text(
                    "JA",
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: PLColors.appPrimaryColorMain500),
                  ),
                ),
                PLHSpace(8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLTextWidget(
                        title: "Interest Rate",
                        textColor: PLColors.appPrimaryText,
                        fontFamily: PLTypography.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                        textSize: PLTypography.fontBodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 8, vertical: 16),
          ),
          // Divider(
          //   color: PLColors.appGrayText.withOpacity(.5),
          // ).marginSymmetric(vertical: 3)
        ],
      ).marginOnly(bottom: 10),
    );
  }
}

