import 'dart:developer';
import 'package:realm/realm.dart';
import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';

class RealmDBStorage {
  static final config = Configuration.local([RealmProductModel.schema,RealmReviewModel.schema,RealmMeta.schema,RealmDimensionModel.schema]);
  static final realmDb = Realm(config);
  static void saveProducts(List<ProductModel> products) {
    log('Adding products  to RealmDB.');
    List<RealmProductModel> realmProductList = products
        .map((product) {
          return product.toRealm();
        })
        .toList()
        .cast<RealmProductModel>();
    realmDb.write((){
      realmDb.addAll(realmProductList,update: true);
    });
    log("Getting all products from the Realm.");
    var savedProducts = realmDb.all<RealmProductModel>();
    log("There are ${savedProducts.length} cars in the Realm.");
  }
  static void clearAllProducts(){
    realmDb.deleteAll<RealmProductModel>();
  }

  static List<ProductModel> getProductList(){
    return realmDb.all<RealmProductModel>().map((RealmProductModel realmProduct){
      return ProductModel.fromRealmProduct(realmProduct);
    }).toList().cast<ProductModel>();
  }
}
