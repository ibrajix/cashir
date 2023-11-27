import 'package:cashir/constants/colors.dart';
import 'package:cashir/presentation/home/provider/home_provider.dart';
import 'package:cashir/presentation/home/view/dashboard.dart';
import 'package:cashir/widgets/cashir_app_bar.dart';
import 'package:cashir/widgets/cashir_error_widget.dart';
import 'package:cashir/widgets/cashir_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.cashirWhite,
      appBar: cashirAppBar(
        height: 0,
        backgroundColor: AppColors.cashirWhite
      ),
      body: ref.watch(getDataProvider).when(
          data: (data){
            return Dashboard(data: data.data);
          },
          error: (error, stackTrace){
            return CashirErrorWidget(
              error: error.toString(),
              onRetry: () {
                ref.invalidate(getDataProvider);
              },
            );
          },
          loading: (){
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(), // This displays the circular progress indicator
                ],
              ),
            );
          }
      ),
    );
  }
}
