
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:nova/core/exports.dart';
import 'package:nova/modules/authentication/reset_password/exports.dart';
import 'package:nova/modules/authentication/signup/exports.dart';
import 'package:nova/modules/loan/exports.dart';
import 'package:nova/modules/onboarding/exports.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import '../flavors.dart';
import '../modules/authentication/complete_account_setup/exports.dart';
import '../modules/authentication/forgot_password/exports.dart';
import '../modules/authentication/login/exports.dart';
import '../modules/home/exports.dart';
import '../modules/profile/exports.dart';
import '../modules/transaction_history/exports.dart';
import '../modules/wallet/exports.dart';
import '../shared/widgets/exports.dart';

part 'app.dart';
part 'initialize_service.dart';
part 'dependencies.dart';