import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sphere/utils/constants/colors.dart';

import '../../../../../home_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Phone Number
            TextFormField(
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            buildVerifyCode(),
            // /// Email
            // TextFormField(
            //   decoration: const InputDecoration(
            //       prefixIcon: Icon(Iconsax.direct_right),
            //       labelText: TTexts.email),
            // ),
            // const SizedBox(height: TSizes.spaceBtwInputFields),

            // /// Password
            // TextFormField(
            //   decoration: const InputDecoration(
            //     prefixIcon: Icon(Iconsax.password_check),
            //     labelText: TTexts.password,
            //     suffixIcon: Icon(Iconsax.eye_slash),
            //   ),
            // ),
            // const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     /// Remember Me
            //     Row(
            //       children: [
            //         Checkbox(value: true, onChanged: (value) {}),
            //         const Text(TTexts.rememberMe),
            //       ],
            //     ),
            //     /// Forget Password
            //     TextButton(
            //         onPressed: () => Get.to(() => const ForgetPassword()),
            //         child: const Text(TTexts.forgetPassword)),
            //   ],
            // ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const HomeMenu()),
                    child: const Text(TTexts.signIn))),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: const Text(TTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }

  /// 驗證碼
  Column buildVerifyCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          child: const Wrap(
            children: [
              Text(
                '驗證碼',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                maxLength: 6,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "請輸入驗證碼",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: TColors.borderPrimary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: TColors.borderPrimary,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "獲取驗證碼",
                  style: TextStyle(
                    fontSize: 14,
                    color: TColors.primary,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
