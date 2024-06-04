

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/exports.dart';
import 'package:nova/modules/authentication/login/exports.dart';
import 'package:nova/shared/models/generic_response_model.dart';

import '../../../shared/models/error_response_model.dart';
import '../../../shared/widgets/exports.dart';
import '../../base_module/exports.dart';
import 'package:dartz/dartz.dart' as dartz;

import '../../profile/services/profile_service.dart';


part 'screens/forgot_password_screen.dart';
part 'provider/forgot_password_provider.dart';