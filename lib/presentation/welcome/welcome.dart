import 'package:cashir/constants/destinations.dart';
import 'package:cashir/widgets/cashir_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cashirLightBlue,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 35, bottom: 100, left: 35, right: 35),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Stay in control, \nStay Safe!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Cashir keep you in control of your finances and give you the guarantee of safety. Sign up today',
                style: TextStyle(
                    fontSize: 13
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: SvgPicture.asset(
                    Images.connectionImage,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: CashirButton(
                    onPressed: () {
                      context.push(Destination.register);
                    },
                    text: 'Get Started',
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            height: 1.5,
                            color: AppColors.cashirBlue,
                            fontWeight: FontWeight.w600
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          context.push(Destination.login);
                        },
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
