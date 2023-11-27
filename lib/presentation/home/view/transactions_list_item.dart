import 'package:cashir/presentation/home/data/response/home_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/images.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({super.key, required this.transaction});
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         SvgPicture.asset(
             transaction.type == "credit" ? Images.creditIcon : Images.debitIcon,
           width: 30,
           height: 30,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(transaction.desc),
            const SizedBox(height: 5),
            Text(transaction.date.toString()),
          ],
        ),
        const Spacer(),
        Text(
            'N ${transaction.amount}',
          style: const TextStyle(
            fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }
}
