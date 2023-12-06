

import 'dart:async';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peerlendly/core/exports.dart';
import 'package:peerlendly/modules/home/exports.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../core/navigation/exports.dart';
import '../../core/utils/constants/exports.dart';
import '../../shared/design_system/exports.dart';
import '../../shared/widgets/exports.dart';
import '../authentication/complete_account_setup/exports.dart';
import '../base_module/exports.dart';
import '../loan/exports.dart';
import '../profile/exports.dart';
import '../transaction_history/exports.dart';

part 'provider/wallet_provider.dart';
part 'screens/airtime_screen.dart';
part 'screens/data_screen.dart';
part 'screens/pay_bills_screen.dart';
part 'widgets/wallet_card_widget.dart';
part 'widgets/quick_actions_widget.dart';
part 'widgets/transfer_pin_activation_widget.dart';
part 'widgets/verify_account_pop_up.dart';
part 'widgets/wallet_account_details_widget.dart';
part 'screens/fund_wallet_screen.dart';
part 'screens/fund_wallet_amount_screen.dart';
part 'widgets/fund_wallet_pop_up.dart';
part 'screens/withdraw_wallet_amount_screen.dart';
part 'screens/bills_payment_options_screen.dart';
part 'widgets/bills_payment_popup.dart';