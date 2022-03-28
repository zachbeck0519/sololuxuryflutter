import 'dart:convert';

import 'package:solo_luxury/data/model/Product/product_model.dart';
import 'package:solo_luxury/data/model/filter/filter_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/product_list_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../app_constants.dart';

class ProductListAPIRepository implements IProductListRepository {

  final IProductListProvider productListProvider;

  ProductListAPIRepository({required this.productListProvider});

  @override
  Future<ProductModel> getProductListApiResponse(String value) async{
    final response = await productListProvider.getProductListResponseProvider(endPoint: AppConstants.productList+value);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if(response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
  @override
  Future<List<dynamic>> getFilterListApiResponse() async{
    final response = await productListProvider.getFilterListResponseProvider(endPoint: AppConstants.filterDataApi);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if(response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return jsonDecode(response.body!);
    }
  }


}