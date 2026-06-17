

import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';

class PaymentMethodModel{
  String id;
  String title;
  String image;
  PaymentMethodModel({
    required this.id,
    required this.title,
    required this.image
});

  RealmPaymentMethodModel toRealm(){
    return RealmPaymentMethodModel(id, title, image);
  }
  factory PaymentMethodModel.fromRealm(RealmPaymentMethodModel paymentMethod){
    return PaymentMethodModel(id: paymentMethod.id, title: paymentMethod.title, image: paymentMethod.image);
  }
}