

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/exports.dart';
import 'package:nova/modules/authentication/signup/exports.dart';
import 'package:nova/shared/widgets/exports.dart';
import 'package:provider/provider.dart';

import '../../core/navigation/exports.dart';
import '../../core/storage/exports.dart';
import '../base_module/exports.dart';

part 'provider/onboarding_provider.dart';
part 'screens/splash_screen.dart';
part 'screens/onboarding_screen.dart';
part 'screens/pageview_widget.dart';
part 'domain/model/onboarding_model.dart';
part 'screens/onboarding_menu_screen.dart';