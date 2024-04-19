import 'package:sphere/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sphere/features/authentication/screens/login/login.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/controllers/dummy_data.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/order/order.dart';
import '../address/address.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  TAppBar(
                      title: Text('個人',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),

                  /// User Profile Card
                  TUserProfileTile(
                      user: TDummyData.user,
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Profile Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Account  Settings
                  const TSectionHeading(title: '帳號設置', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.safe_home,
                  //   title: '我的地址',
                  //   subTitle: '設定購物運送地址',
                  //   onTap: () => Get.to(() => const UserAddressScreen()),
                  // ),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.shopping_cart,
                  //   title: '我的購物車',
                  //   subTitle: '新增、移除產品並前往結帳',
                  //   onTap: () => Get.to(() => const CartScreen()),
                  // ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: '我的訂單',
                    subTitle: '進行中和已完成的訂單',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const TSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: '銀行帳戶',
                      subTitle: '將餘額提領到註冊銀行帳戶'),
                  const TSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: '我的優惠券',
                      subTitle: '所有優惠券的清單'),
                  TSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: '通知',
                      subTitle: '設置任何類型的通知消息',
                      onTap: () {}),
                  const TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: '帳號隱私',
                      subTitle: '管理數據使用和連接帳戶'),

                  /// -- App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// -- Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () => Get.to(() => const LoginScreen()),
                          child: const Text('登出'))),
                  const SizedBox(height: TSizes.spaceBtwSections * 3.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
