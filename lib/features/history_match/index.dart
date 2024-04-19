import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sphere/features/data/kit/index.dart';
import 'package:sphere/features/history_match/mock.dart';

class HistoryMatch extends StatefulWidget {
  const HistoryMatch({super.key});
  @override
  State<HistoryMatch> createState() => _HistoryMatchState();
}

class _HistoryMatchState extends State<HistoryMatch> {
  List<MockHistoryMatch> items = [];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      MockHistoryMatch.clean();
      items = MockHistoryMatch.get();
    });

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(seconds: 1));

    if (items.length > 72) {
      return _refreshController.loadNoData();
    }

    if (mounted) {
      setState(() {
        items = MockHistoryMatch.get();
      });
    }

    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      items = MockHistoryMatch.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('历史匹配'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: GridView.count(
          padding: const EdgeInsets.all(12),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          children: items.map((item) {
            return Card(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: DataUtils.imageCache(item.avatar),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      color: Colors.black.withOpacity(.15),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              item.nickName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: Text(
                              "${item.age} · ${item.sex} · ${item.constellation}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
