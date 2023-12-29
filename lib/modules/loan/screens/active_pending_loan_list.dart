part of 'package:peerlendly/modules/loan/exports.dart';

class ActivePendingLoanList extends StatelessWidget {
  final List<ActivePendingLoansResponseModelLoanDetail> loanDetails;

  const ActivePendingLoanList({Key? key, required this.loanDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (loanDetails.isEmpty) ...[
          const EmptyLoanScreen(),
        ] else ...[
          for (var index = 0; index < loanDetails.length; index++) ...[
            PendingActiveLoanItem(loanStatus: LoanStatus.active, loanDetail: loanDetails[index]),
          ]
        ]
      ],
    );
  }
}
