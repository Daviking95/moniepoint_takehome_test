

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peerlendly/core/enums/exports.dart';
import 'package:peerlendly/core/exports.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/navigation/exports.dart';
import '../../core/utils/constants/exports.dart';
import '../../shared/design_system/exports.dart';
import '../../shared/widgets/exports.dart';
import '../base_module/exports.dart';

part 'provider/transaction_provider.dart';
part 'screens/transaction_screen.dart';
part 'widgets/transactions_card_widget.dart';
part 'widgets/get_notification_image.dart';
part 'screens/transaction_summary_screen.dart';
part 'widgets/report_transaction_popup.dart';