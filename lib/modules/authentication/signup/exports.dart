
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peerlendly/core/exports.dart';
import 'package:peerlendly/modules/authentication/complete_account_setup/exports.dart';
import 'package:peerlendly/modules/authentication/signup/services/signup_service.dart';
import 'package:peerlendly/shared/models/generic_response_model.dart';
import 'package:provider/provider.dart';

import '../../../shared/models/error_response_model.dart';
import '../../../shared/widgets/exports.dart';
import '../../base_module/exports.dart';
import 'package:dartz/dartz.dart' as dartz;

part 'screens/signup_screen.dart';
part 'provider/signup_provider.dart';
part 'widgets/email_address_widget.dart';