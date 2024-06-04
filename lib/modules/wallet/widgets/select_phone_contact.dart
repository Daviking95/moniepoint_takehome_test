
 import 'package:flutter/cupertino.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:nova/core/utils/extensions/exports.dart';

pickContact(TextEditingController controller) async{
  if (!await FlutterContactPicker.hasPermission()) {
    await FlutterContactPicker.requestPermission();
  }
  final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();

  "_phoneNumberController.text 1 ${contact.phoneNumber!.number!}".logger();

  controller.text = contact
      .phoneNumber!.number!
      .replaceAll("+234", "")
      .replaceAll(" ", "")
      .replaceAll("-", "")
      .replaceAll("(", "")
      .replaceAll(")", "");

  controller.text =
      controller.text.substring(
          controller.text.length - 11);

  "_phoneNumberController.text ${controller.text}".logger();
;
}
