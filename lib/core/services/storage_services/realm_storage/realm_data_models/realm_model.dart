
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

@RealmModel()
class _RealmAddressModel{
  @PrimaryKey()
  late String id;
  late String name;
  late int number;
  late String street;
  late int postalCode;
  late String city;
  late String state;
  late String country;
}


@RealmModel()
class _RealmPaymentMethodModel{
  @PrimaryKey()
  late String id;
  late String title;
  late String image;
}


@RealmModel()
class _RealmOrderProductModel{
  late _RealmProductModel? product;
  late int quantity;
  late double price;
}


@RealmModel()
class _RealmOrderModel{
  late String orderId;
  late DateTime placedOn;
  late int orderStatusIndex;
  late double productTotalPrice;
  late double totalPrice;
  late double shippingFee;
  late double taxFee;
  late _RealmPaymentMethodModel? paymentMethod;
  late _RealmAddressModel? address;
  late List<_RealmOrderProductModel> products;
}






