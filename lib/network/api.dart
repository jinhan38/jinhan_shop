import 'package:dio/dio.dart';
import 'package:jinhan_shop/model/Item.dart';

class API {
  static String BASE = "10.0.2.2:8080";

  /// 제품 생성하기
  static Future<bool> createProduct(
      String name, String author, String price, String stock) async {
    try {
      var uri = Uri.http(BASE, "item/create", {
        'name': name,
        'author': author,
        'price': price.toString(),
        'stock': stock.toString(),
      });
      var response = await Dio().get(uri.toString());
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<Item>> findAllProduct() async {
    try {
      var uri = Uri.http(BASE, "item/find/all");
      var response = await Dio().get(uri.toString());
      print(response.data);
      if (response.statusCode == 200) {
        return response.data.map<Item>((e)=> Item.fromFson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
