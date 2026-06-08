import 'dart:developer';

import 'package:realm/realm.dart';
import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';

class RealmDBStorage {
  static final config = Configuration.local([RealmProductModel.schema,RealmReviewModel.schema,RealmMeta.schema,RealmDimensionModel.schema]);
  static final realDb = Realm(config);

  static void saveProducts(List<ProductModel> products) {
    log('Adding products  to RealmDB.');
    List<RealmProductModel> realmProductList = products
        .map((product) {
          return product.toRealm();
        })
        .toList()
        .cast<RealmProductModel>();
    realDb.write((){
      realDb.addAll(realmProductList);
    });
    log("Getting all cars from the Realm.");
    var cars = realDb.all<RealmProductModel>();
    log("There are ${cars.length} cars in the Realm.");

  }
}
