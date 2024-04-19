import 'package:sphere/features/authentication/screens/login/widgets/login_form.dart';
import 'package:sphere/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../../home_menu.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///  Header
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInGuest.capitalize!),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///  signInGuest Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const HomeMenu()),
                    child: const Text(TTexts.signInGuest)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
