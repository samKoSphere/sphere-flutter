import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sphere/features/community/page_view/like/mock.dart';
import 'package:sphere/features/community/screens/message/qr_scan.dart';
import 'package:sphere/utils/constants/colors.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _PageViewMessageState();
}

class _PageViewMessageState extends State<MessageScreen> {
  List<MockLike> lists = [];
  // ScanController controller = ScanController();
  @override
  void initState() {
    super.initState();

    setState(() {
      lists = MockLike.get();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('聊天', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(() => const QrScan()))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            search(),
            Column(
              children: lists
                  .map(
                    (e) => InkWell(
                      child: listCard(e),
                      onTap: () => Get.toNamed('/message/chat'),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Container listCard(MockLike item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(item.avatar),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              margin: const EdgeInsets.only(left: 24),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: .5,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.nickName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.time.split('T')[0],
                        // style: const TextStyle(color: TColors.secondary),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              item.text,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: TColors.primary,
                          child: Text(
                            '${item.fav}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container search() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 36,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: const TextField(
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: "請輸入搜尋關鍵字",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
