import "package:cashir/widgets/cashir_button.dart";
import "package:flutter/material.dart";

class CashirErrorWidget extends StatelessWidget {
  const CashirErrorWidget({
    this.error,
    this.onRetry,
    this.buttonText,
    this.svg,
    this.img,
    Key? key,
  }) : super(key: key);

  final Function()? onRetry;
  final String? error;
  final String? buttonText;

  final String? svg;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              error ?? "An unexpected error occcured",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            CashirButton(onPressed: onRetry!, text: 'Retry')
          ],
        ));
  }
}
