
import 'package:realm/realm.dart';
part 'realm_model.realm.dart';

@RealmModel()
class _RealmDimensionModel{
  double? width;
  double? height;
  double? depth;
}

@RealmModel()
class _RealmMeta{
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;
}

@RealmModel()
class _RealmReviewModel{
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;
}


@RealmModel()
class _RealmProductModel{
  @PrimaryKey()
  late int id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String> tags=[];
  String? brand;
  String? sku;
  int? weight;
  _RealmDimensionModel? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<_RealmReviewModel> reviews=[];
  String? returnPolicy;
  int? minimumOrderQuantity;
  _RealmMeta? meta;
  String? thumbnail;
  List<String> images =[];
}






