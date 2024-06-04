

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/exports.dart';
import 'package:nova/modules/authentication/signup/models/OnboardCustomerRequestModel.dart';
import 'package:provider/provider.dart';

import '../../../shared/models/error_response_model.dart';
import '../../../shared/models/generic_response_model.dart';
import '../../../shared/widgets/exports.dart';
import '../../base_module/exports.dart';
import 'package:dartz/dartz.dart' as dartz;

import '../signup/models/VerifyBvnResponseModel.dart';
import '../signup/models/VerifyCustomerDetailsRequestModel.dart';
import '../signup/services/signup_service.dart';


part 'provider/complete_account_setup_provider.dart';
part 'screens/add_bvn_screen.dart';
part 'screens/set_activity_pin_screen.dart';
part 'screens/bvn_image_capture.dart';
part 'screens/complete_account_screen.dart';
part 'screens/verify_phone_number_screen.dart';
part 'screens/verify_id_screen.dart';