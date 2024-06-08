part of 'package:moniepoint_mobile/modules/home/exports.dart';

class EstateCardSection extends StatelessWidget {
  final String imageUrl;
  final String address;

  const EstateCardSection(
      {Key? key, required this.imageUrl, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            MonieEstateImagePng(
              imgPath: imageUrl,
              width: double.infinity,
              height: 200,
              boxFit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius:
                      MonieEstateDecorations.borderRadiusGeometryCircular24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        address,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ).animate().fade(
                            duration: const Duration(milliseconds: 1500),
                            delay: const Duration(milliseconds: 800),
                          ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          maxRadius: 24,
                          backgroundColor: MonieEstateColors.appWhiteColor,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly(left: 16, right: 2),
              ).marginSymmetric(vertical: 16, horizontal: 16).animate().slideX(
                    duration: const Duration(milliseconds: 1100),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class EstateCard extends StatelessWidget {
  const EstateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/images/four.jpeg')),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                // todo: Use this to add subtle inner shadow below your image
                begin: Alignment.bottomRight,
                stops: const [
                  0.3,
                  0.9
                ],
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ])),
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Best Design',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
