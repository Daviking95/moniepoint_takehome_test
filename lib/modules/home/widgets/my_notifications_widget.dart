part of 'package:nova/modules/home/exports.dart';

class MyNotificationsWidget extends StatelessWidget {
  const MyNotificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        for (var i = 0; i < 3; i++) ...[
          NotificationCardWidget(),
        ],
      ],
    );
  }
}
