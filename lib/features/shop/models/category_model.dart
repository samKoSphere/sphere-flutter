import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryService {
  final String baseUrl =
      'http://192.168.1.124:5000/api/03d52372-39df-4c56-a677-56f007f2c1a7/categories';

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> categories = data['data']; // 获取类别列表数据

      return categories.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

class CategoryModel {
  String id;
  String? shopId;
  String? routeId;
  int? order;
  String name;
  String image;
  String? linkUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentId;
  bool? isFeatured;

  CategoryModel({
    required this.id,
    this.shopId,
    this.routeId,
    this.order,
    required this.name,
    required this.image,
    this.linkUrl,
    this.createdAt,
    this.updatedAt,
    this.parentId = "",
    this.isFeatured,
  });

  static CategoryModel empty() => CategoryModel(
        id: '',
        shopId: '',
        routeId: '',
        order: 0,
        name: '',
        image: '',
        linkUrl: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      shopId: json['shopId'],
      routeId: json['routeId'],
      order: json['order'],
      name: json['name'],
      image: json['imageUrl'],
      linkUrl: json['linkUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      parentId: json['routeId'],
      isFeatured: true,
    );
  }
}
