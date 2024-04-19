import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar close icon will first Logout the user & then redirect back to Login Screen()
      /// Reason: We will store the data when user enters the Register Button on Previous screen.
      /// Whenever the user opens the app, we will check if email is verified or not.
      /// If not verified we will always show this Verification screen.
      appBar: TAppBar(actions: [
        IconButton(
            onPressed: () => Get.offAll(const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear))
      ]),
      body: SingleChildScrollView(
        // Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(TTexts.confirmPhoneNumber,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.confirmPhoneNumberSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),
// 四格框框
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInputField(),
                    _buildInputField(),
                    _buildInputField(),
                    _buildInputField(),
                  ],
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                          /// Success Screen
                          () => SuccessScreen(
                            image: TImages.staticSuccessIllustration,
                            title: TTexts.yourAccountCreatedTitle,
                            subTitle: TTexts.yourAccountCreatedSubTitle,
                            onPressed: () => Get.to(() => const LoginScreen()),
                          ),
                        ),
                    child: const Text(TTexts.tContinue)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(TTexts.phoneNotReceivedMessage))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
        width: 60.0,
        height: 120.0,
        alignment: Alignment.center,
        child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: TextField(
              maxLength: 1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0), // 设置
              decoration: InputDecoration(
                counterText: '', //隐藏字符计数器
                border: InputBorder.none,
              ),
            )));
  }
}
