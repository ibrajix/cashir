import 'package:cashir/constants/colors.dart';
import 'package:cashir/constants/destinations.dart';
import 'package:cashir/widgets/cashir_button.dart';
import 'package:cashir/widgets/cashir_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/images.dart';
import '../../../widgets/cashir_app_bar.dart';
import '../provider/auth_provider.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(passwordVisibleProvider);
    final isTermsChecked = ref.watch(termsCheckedProvider);
    return Scaffold(
      appBar: cashirAppBar(
        height: 80,
        backgroundColor: Colors.white,
        title: 'Sign up',
        leadingWidget: IconButton(
          icon: SvgPicture.asset(
              Images.backIcon
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign up for a Cashir Account',
                style: TextStyle(
                  color: AppColors.cashirBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'To open an account with Cashir, please fill the input fields below',
                style: TextStyle(
                    fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),
              const CashirTextField(
                  labelText: "Firstname",
                  borderColor: AppColors.cashirGrey,
                  focusedBorderColor: AppColors.cashirBlue,
              ),
              const SizedBox(height: 13),
              const CashirTextField(
                labelText: "Lastname",
                borderColor: AppColors.cashirGrey,
                focusedBorderColor: AppColors.cashirBlue,
              ),
              const SizedBox(height: 13),
              const CashirTextField(
                labelText: "CashirTag/Username",
                borderColor: AppColors.cashirGrey,
                focusedBorderColor: AppColors.cashirBlue,
              ),
              const SizedBox(height: 13),
              const CashirTextField(
                labelText: "Mobile Number",
                borderColor: AppColors.cashirGrey,
                focusedBorderColor: AppColors.cashirBlue,
              ),
              const SizedBox(height: 13),
              const CashirTextField(
                labelText: "Email Address",
                borderColor: AppColors.cashirGrey,
                focusedBorderColor: AppColors.cashirBlue,
              ),
              const SizedBox(height: 13),
              CashirTextField(
                labelText: "Password",
                borderColor: AppColors.cashirGrey,
                focusedBorderColor: AppColors.cashirBlue,
                suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(passwordVisibleProvider.notifier).update((state) => !state);
                    },
                    icon: Icon( isPasswordVisible ? Icons.visibility : Icons.visibility_off)
                ),
                obscureText: isPasswordVisible,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                      value: isTermsChecked,
                      onChanged: (value) {
                        ref.read(termsCheckedProvider.notifier).update((state) => !state);
                      }
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'I have read and agreed to the ',
                            style: TextStyle(
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms and conditions',
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                height: 1.5,
                                color: AppColors.cashirBlue,
                                fontWeight: FontWeight.w600
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {

                            },
                          ),
                          const TextSpan(
                            text: 'and ',
                            style: TextStyle(
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                height: 1.5,
                                color: AppColors.cashirBlue,
                                fontWeight: FontWeight.w600
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {

                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: CashirButton(
                    onPressed: () {
                      context.push(Destination.home);
                    }, text: 'SignUp'
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
