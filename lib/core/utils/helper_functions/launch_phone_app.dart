
import 'package:url_launcher/url_launcher.dart';

launchPhoneApp(String number) async {
  String phoneNumber = 'tel:$number';
  if (await canLaunch(phoneNumber)) {
    await launch(phoneNumber);
  } else {
    print('Could not launch $phoneNumber');
  }
}