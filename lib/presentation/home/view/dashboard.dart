import 'package:cashir/constants/colors.dart';
import 'package:cashir/presentation/auth/provider/auth_provider.dart';
import 'package:cashir/presentation/home/data/response/home_response.dart';
import 'package:cashir/presentation/home/provider/home_provider.dart';
import 'package:cashir/presentation/home/view/transactions_list_item.dart';
import 'package:cashir/widgets/cashir_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  final Data data;
  const Dashboard({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBalanceVisible = ref.watch(accountBalanceVisibilityProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                    "#${data.first_name}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.cashirBlue,
                    fontSize: 20
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: AppColors.cashirBlue,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  children: [
                    const Text(
                        'Wallet Balance',
                      style: TextStyle(
                        color: AppColors.cashirWhite,
                        fontSize: 16
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: Icon(isBalanceVisible ? Icons.visibility_off : Icons.visibility),
                      color: AppColors.cashirWhite,
                      onPressed: () {
                        ref.read(accountBalanceVisibilityProvider.notifier).update((state) => !state);

                      },
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      color: AppColors.cashirWhite,
                      fontWeight: FontWeight.w700
                    ),
                    children: [
                      TextSpan(
                        text: isBalanceVisible ? 'N ' : '',
                        style: const TextStyle(
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: isBalanceVisible ? data.account_balance : "*******",
                        style: const TextStyle(
                            color: AppColors.cashirWhite,
                            fontSize: 40,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Welcome, ${data.first_name} ${data.last_name}",
                  style: const TextStyle(
                      color: AppColors.cashirWhite,
                      fontSize: 18
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    'All Transactions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 30),
                ListView.separated(
                  itemCount: data.transactions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index){
                    return  const Padding(padding: EdgeInsets.all(10),
                    child: Divider(height: 10, color: AppColors.cashirGrey));
                  },
                  itemBuilder: (context, index) => TransactionListItem(
                    transaction: data.transactions[index],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
