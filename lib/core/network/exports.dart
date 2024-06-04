import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:nova/core/exports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart' as dartz;

import '../../../flavors.dart';
import '../../modules/authentication/login/models/LoginRequestModel.dart';
import '../../modules/authentication/login/services/login_service.dart';
import '../../shared/models/error_response_model.dart';
import '../../shared/models/generic_response_model.dart';

part 'interceptors.dart';
part 'network_constants.dart';
part 'network_service.dart';
