import 'package:realm/realm.dart';
import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
        createdAt : json['createdAt'],
        updatedAt : json['updatedAt'],
        barcode : json['barcode'],
    qrCode : json['qrCode']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['barcode'] = barcode;
    data['qrCode'] = qrCode;
    return data;
  }

  RealmMeta toRealm(){
    return RealmMeta(
      createdAt : createdAt,
      updatedAt : updatedAt,
      barcode : barcode,
      qrCode: qrCode,
    );
  }

  factory Meta.fromRealmMeta(RealmMeta? realmMeta){
    return Meta(
      createdAt : realmMeta?.createdAt,
      updatedAt : realmMeta?.updatedAt,
      barcode : realmMeta?.barcode,
      qrCode: realmMeta?.qrCode,
    );
  }
}