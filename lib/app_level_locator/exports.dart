
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peerlendly/modules/authentication/reset_password/exports.dart';
import 'package:peerlendly/modules/authentication/signup/exports.dart';
import 'package:peerlendly/modules/loan/exports.dart';
import 'package:peerlendly/modules/onboarding/exports.dart';
import 'package:localization/localization.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import '../core/navigation/exports.dart';
import '../core/network/exports.dart';
import '../core/storage/exports.dart';
import '../flavors.dart';
import '../modules/authentication/complete_account_setup/exports.dart';
import '../modules/authentication/forgot_password/exports.dart';
import '../modules/authentication/login/exports.dart';
import '../modules/home/exports.dart';
import '../modules/profile/exports.dart';
import '../modules/transaction_history/exports.dart';
import '../modules/wallet/exports.dart';
import '../shared/design_system/exports.dart';
import '../shared/widgets/exports.dart';

part 'app.dart';
part 'initialize_service.dart';
part 'dependencies.dart';