part of "package:peerlendly/shared/widgets/exports.dart";

class PLShimmer extends StatelessWidget {
  const PLShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        crossAxisSpacing: 8.0,
        childAspectRatio: 2.1,
        mainAxisSpacing: 8.0,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: [
          for (int i = 0; i < 4; i++)
            Shimmer.fromColors(
                baseColor: PLColors.appPrimaryColor50,
                highlightColor: PLColors.appPrimaryColor50.withOpacity(.7),
                child: Container(color: PLColors.appPrimaryColor50, height: 80.h, child: Container(height: 50,))),
        ]).marginSymmetric(horizontal: 15);
  }
}

// shimmerForRecentDocumentCards(BuildContext context) {
//   return SizedBox(
//     height: 138.spMax,
//     child: ListView(scrollDirection: Axis.horizontal, children: [
//       for (int i = 0; i < 4; i++)
//         Shimmer.fromColors(
//                 baseColor: FlowColors.appPrimaryColor50,
//                 highlightColor: FlowColors.appPrimaryColor50.withOpacity(.7),
//                 child: Container(color: FlowColors.appPrimaryColor50, height: 138.spMax, width: 128.w, child: Container(height: 50,)))
//             .marginOnly(right: 15)
//     ]).marginOnly(left: 15),
//   );
// }
//
// shimmerForAwaitingRequestsCards(BuildContext context) {
//   return Column(
//     children: [
//       for (int i = 0; i < 4; i++)
//         Shimmer.fromColors(
//                 baseColor: FlowColors.appPrimaryColor50,
//                 highlightColor: FlowColors.appPrimaryColor50.withOpacity(.7),
//                 child: Container(color: FlowColors.appPrimaryColor50, child: Container(height: 50,)))
//             .marginSymmetric(horizontal: 5, vertical: 3)
//     ],
//   );
// }
