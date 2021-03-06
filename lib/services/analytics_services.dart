import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockfare_mobile/models/analytics_model.dart';
import 'package:stockfare_mobile/models/product_analytics_model.dart';
import 'package:stockfare_mobile/models/products_analytics_model.dart';
import 'package:stockfare_mobile/models/sales_analytics_model.dart';

class Analytics {
  Future<SalesAnalytics> getAllAnalytics() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    String branchId = sharedPreferences.getString('branchId');
    final String url =
        'https://stockfare-io.herokuapp.com/api/v1/analytics/sale-analysis/$branchId/';
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return SalesAnalytics.fromJson(json.decode(response.body));
    } else {
      throw Exception('Could not get Analytics');
    }
  }

  Future<ProductsAnalyticsModel> getAllProducts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    String branchId = sharedPreferences.getString('branchId');
    final String url =
        'https://stockfare-io.herokuapp.com/api/v1/analytics/product-analysis/$branchId/';
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return ProductsAnalyticsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Could not get Analytics');
    }
  }

  Future<SalesAnalyticsModel> analyticsDetails(String filterBy) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    String branchId = sharedPreferences.getString('branchId');

    final String url =
        'https://stockfare-io.herokuapp.com/api/v1/analytics/list-sales/$branchId/?filter_by=$filterBy';
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return SalesAnalyticsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Could not get Analytics');
    }
  }

  Future<ProductsAnalyticsList> productsAnalyticsDetails(
      String filterBy) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    String branchId = sharedPreferences.getString('branchId');

    final String url =
        'http://stockfare-io.herokuapp.com/api/v1/analytics/product-analysis-detail/$branchId/?filter_by=$filterBy';
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return ProductsAnalyticsList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Could not get Analytics');
    }
  }
}
