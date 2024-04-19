import 'package:sphere/features/data/kit/index.dart';
import 'package:sphere/features/history_match/mock.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

class MockLike extends MockHistoryMatch {
  MockLike({
    required String nickName,
    required int age,
    required String sex,
    required String constellation,
    required String avatar,
    required this.time,
    required this.text,
    required this.mediaType,
    required this.media,
    required this.tag,
    required this.share,
    required this.fav,
    required this.comment,
  }) : super(
          nickName: nickName,
          age: age,
          sex: sex,
          constellation: constellation,
          avatar: avatar,
        );

  static final List<MockLike> _data = [];

  /// 時間
  final String time;

  /// 發佈內容
  final String text;

  /// 多媒體類型
  /// true: 影片
  /// false: 圖片
  final bool mediaType;

  /// 多媒體
  final List<String> media;

  /// 標籤
  final List<String> tag;

  final int share;

  final int fav;

  final int comment;

  static List<MockLike> get({int num = 12}) {
    for (var i = 0; i < num; i++) {
      var mockType = mock.boolean();
      _data.add(MockLike(
        nickName: mock.cname(),
        age: mock.integer(min: 18, max: 45),
        sex: mock.pick(["女", "男", "其他"]),
        constellation: mock.pick([
          "白羊座",
          "金牛座",
          "雙子座",
          "巨蟹座",
          "獅子座",
          "處女座",
          "天秤座",
          "天蠍座",
          "射手座",
          "摩羯座",
          "水瓶座",
          "雙魚座",
        ]),
        avatar: DataUtils.getRandomImage(),
        tag: List.generate(mock.integer(min: 1, max: 4),
            (index) => '#${mock.ctitle(min: 3, max: 10)}'),
        mediaType: mockType,
        media: List.generate(mock.integer(min: 0, max: 4), (index) {
          if (mockType) {
            return DataUtils.getRandomImage();
          } else {
            return DataUtils.getRandomImage();
          }
        }),
        share: mock.integer(min: 1, max: 99),
        fav: mock.integer(min: 1, max: 99),
        comment: mock.integer(min: 1, max: 99),
        text: mock.cparagraph(min: 1, max: 4),
        time: mock.dateTime(start: DateTime(2022)).toIso8601String(),
      ));
    }

    return _data;
  }

  static clear() {
    _data.clear();
  }
}
