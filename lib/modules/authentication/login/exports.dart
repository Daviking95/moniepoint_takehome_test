

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/exports.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nova/modules/authentication/login/models/LoginRequestModel.dart';
import 'package:nova/modules/authentication/login/services/login_service.dart';
import 'package:provider/provider.dart';

import '../../../shared/models/error_response_model.dart';
import '../../../shared/models/generic_response_model.dart';
import '../../../shared/widgets/exports.dart';
import '../../base_module/exports.dart';
import 'package:dartz/dartz.dart' as dartz;

import '../signup/services/signup_service.dart';
import 'models/SwitchAccountRequestModel.dart';


part 'screens/login_screen.dart';
part 'provider/login_provider.dart';
part 'screens/biometric_screen.dart';
part 'provider/biometric_provider.dart';
part 'screens/switch_account_verify_otp_screen.dart';