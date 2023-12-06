

import 'dart:async';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peerlendly/modules/loan/models/LoanApplyRequestModel.dart';
import 'package:peerlendly/modules/loan/services/loan_services.dart';
import 'package:peerlendly/modules/profile/exports.dart';
import 'package:provider/provider.dart';

import '../../core/enums/exports.dart';
import '../../core/exports.dart';
import '../../shared/models/error_response_model.dart';
import '../../shared/models/generic_response_model.dart';
import '../../shared/widgets/exports.dart';
import '../base_module/exports.dart';
import '../home/exports.dart';
import '../wallet/exports.dart';

part 'screens/repay_loan_screen.dart';
part 'provider/loan_provider.dart';
part 'screens/pay_loan_options_screen.dart';
part 'widgets/pay_loan_pop_up.dart';
part 'screens/loan_apply_screen.dart';
part 'screens/loan_summary_screen.dart';
part 'screens/marketplace_screen.dart';
part 'widgets/marketplace_wallet_card_widget.dart';
part 'screens/empty_loan_screen.dart';
part 'screens/active_pending_loan_list.dart';
part 'widgets/pending_active_loan_item.dart';
part 'screens/single_loan_screen.dart';
part 'widgets/cancel_loan_offer_popup.dart';
part 'screens/marketplace_loan_list.dart';
part 'widgets/loan_request_card_widget.dart';
part 'screens/loan_request_summary_card.dart';
part 'screens/loan_history_screen.dart';
part 'widgets/loan_history_card.dart';
part 'screens/make_offer_screen.dart';
part 'screens/make_offer_summary_screen.dart';
part 'widgets/make_offer_amount_exchange_widget.dart';
part 'screens/accept_loan_offers_screen.dart';
part 'widgets/loan_offers_card.dart';
part 'screens/accept_reject_offer_summary_screen.dart';