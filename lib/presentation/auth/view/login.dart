import 'package:cashir/constants/destinations.dart';
import 'package:cashir/widgets/cashir_app_bar.dart';
import 'package:cashir/widgets/cashir_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../widgets/cashir_button.dart';
import '../provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(passwordVisibleProvider);
    return Scaffold(
      backgroundColor: AppColors.cashirWhite,
      appBar: cashirAppBar(height: 0, backgroundColor: AppColors.cashirWhite),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Images.logoRound,
                  height: 50,
                  width:  50,
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: SvgPicture.asset(
                      Images.loginIllustration,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                    'Login to your Cashir Account',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.cashirBlue,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Login to explore the world of financial freedom.',
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                Center(
                  child: CashirButton(
                      onPressed: () {
                        context.push(Destination.home);
                      }, text: 'Login'
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'New User? ',
                          style: TextStyle(
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              height: 1.5,
                              color: AppColors.cashirBlue,
                              fontWeight: FontWeight.w600
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            context.push(Destination.register);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
