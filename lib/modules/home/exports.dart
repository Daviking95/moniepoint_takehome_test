
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/enums/exports.dart';
import 'package:nova/core/exports.dart';
import 'package:nova/core/utils/extensions/exports.dart';
import 'package:nova/modules/profile/models/GetUserProfileResponseModel.dart';
import 'package:nova/modules/profile/services/profile_service.dart';
import 'package:nova/modules/wallet/exports.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../core/navigation/exports.dart';
import '../../core/utils/constants/exports.dart';
import '../../shared/design_system/exports.dart';
import '../../shared/models/error_response_model.dart';
import '../../shared/models/generic_response_model.dart';
import '../../shared/widgets/exports.dart';
import '../authentication/signup/models/CreateWalletResponseModel.dart';
import '../authentication/signup/services/signup_service.dart';
import '../base_module/exports.dart';
import '../profile/exports.dart';
import '../profile/models/LendlyScoreResponseModel.dart';
import '../transaction_history/exports.dart';
import 'package:dartz/dartz.dart' as dartz;
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart' as htmlWidget;


part 'screens/dashboard_screen.dart';
part 'provider/dashboard_provider.dart';
part 'widgets/top_row_widget.dart';
part 'screens/notification_screen.dart';
part 'widgets/my_notifications_widget.dart';
part 'widgets/notification_card_widget.dart';
part 'widgets/dashboard_c_t_a_widget.dart';
part 'widgets/wallet_card_carousel_widget.dart';
