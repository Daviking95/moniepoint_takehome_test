part of 'package:peerlendly/modules/loan/exports.dart';

class ActivePendingLoanList extends StatelessWidget {
  const ActivePendingLoanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PendingActiveLoanItem(loanStatus: LoanStatus.active),
        PendingActiveLoanItem(loanStatus: LoanStatus.delayed),
        PendingActiveLoanItem(loanStatus: LoanStatus.loanOffer),
        PendingActiveLoanItem(loanStatus: LoanStatus.active),
      ],
    );
  }
}
