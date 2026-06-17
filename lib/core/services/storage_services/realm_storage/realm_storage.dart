import 'dart:developer';
import 'package:realm/realm.dart';
import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';
import 'package:shopping_app/features/profile/models/order_model.dart';

class RealmDBStorage {
  static final config = Configuration.local([RealmProductModel.schema,RealmReviewModel.schema,RealmMeta.schema,RealmDimensionModel.schema,RealmOrderProductModel.schema,RealmAddressModel.schema,RealmPaymentMethodModel.schema,RealmOrderModel.schema]);
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
    log("products saved");
  }
  static void clearAllProducts(){
    realmDb.deleteAll<RealmProductModel>();
  }

  static List<ProductModel> getProductList(){
    return realmDb.all<RealmProductModel>().map((RealmProductModel realmProduct){
      return ProductModel.fromRealmProduct(realmProduct);
    }).toList().cast<ProductModel>();
  }

  static ProductModel? getProduct(int id){
    RealmProductModel? realmProduct=realmDb.find<RealmProductModel>(id);
    return realmProduct==null?null:ProductModel.fromRealmProduct(realmProduct);
  }

  static void saveAddresses(List<AddressModel> addresses){
    List<RealmAddressModel> realmAddressList = addresses
        .map((address) {
      return address.toRealm();
    })
        .toList()
        .cast<RealmAddressModel>();
    realmDb.write((){
      realmDb.addAll(realmAddressList,update: true);
    });
  }

  static List<AddressModel> getAddressList(){
    return realmDb.all<RealmAddressModel>().map((RealmAddressModel addressProduct){
      return AddressModel.fromRealmAddress(addressProduct);
    }).toList().cast<AddressModel>();
  }

  static void saveOrder(OrderModel order){
    realmDb.write((){
      realmDb.add(order.toRealm(),update: true);
    });
  }

  static List<OrderModel> getOrders(){
    log("getting orders");
    return realmDb.all<RealmOrderModel>().map((RealmOrderModel order){
      log("order");
      return OrderModel.fromRealm(order);
    }).toList().cast<OrderModel>();
  }
}
