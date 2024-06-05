
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/exports.dart';
import 'package:nova/modules/authentication/login/exports.dart';
import 'package:nova/modules/authentication/reset_password/exports.dart';
import 'package:nova/modules/authentication/signup/services/signup_service.dart';
import 'package:nova/shared/models/generic_response_model.dart';
import 'package:provider/provider.dart';

import '../../../shared/models/error_response_model.dart';
import '../../../shared/widgets/exports.dart';
import '../../base_module/exports.dart';
import 'package:dartz/dartz.dart' as dartz;

part 'screens/signup_screen.dart';
part 'screens/verify_email_address_screen.dart';
part 'screens/set_security_question_screen.dart';
part 'screens/setup_details_screen.dart';
part 'screens/have_an_account_screen.dart';
part 'screens/verify_email_address_for_existing_customer_screen.dart';
part 'provider/signup_provider.dart';
