import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';

class AddressModel {
  String id;
  String name;
  int number;
  String street;
  int postalCode;
  String city;
  String state;
  String country;
  AddressModel({
    required this.id,
    required this.name,
    required this.number,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country
});

  factory AddressModel.fromRealmAddress(RealmAddressModel realmAddress){
    return AddressModel(id: realmAddress.id, name: realmAddress.name, number: realmAddress.number, street: realmAddress.street, postalCode: realmAddress.postalCode, city: realmAddress.city, state: realmAddress.state, country: realmAddress.country);
  }

  RealmAddressModel toRealm(){
    return RealmAddressModel(id, name, number, street, postalCode, city, state, country);
  }
}