import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';
import 'package:shopping_app/features/home_page/model/review_model.dart';

import 'dimension_model.dart';
import 'meta_model.dart';

class ProductModel {
int id;
String? title;
String? description;
String? category;
double? price;
double? discountPercentage;
double? rating;
int? stock;
List<String>? tags;
String? brand;
String? sku;
int? weight;
Dimensions? dimensions;
String? warrantyInformation;
String? shippingInformation;
String? availabilityStatus;
List<Reviews>? reviews;
String? returnPolicy;
int? minimumOrderQuantity;
Meta? meta;
String? thumbnail;
List<String>? images;

ProductModel(
    {required this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.tags,
      this.brand,
      this.sku,
      this.weight,
      this.dimensions,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.reviews,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.meta,
      this.thumbnail,
      this.images});

factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
  id :json['id'],
  title : json['title'],
  description : json['description'],
  category : json['category'],
  price : json['price'],
  discountPercentage :(json['discountPercentage']??0).toDouble(),
  rating :json['rating'],
  stock : json['stock'],
  tags : json['tags']?.cast<String>(),
  brand : json['brand'],
  sku : json['sku'],
  weight : json['weight'],
  dimensions : json['dimensions'] != null
      ?  Dimensions.fromJson(json['dimensions'])
      : null,
  warrantyInformation : json['warrantyInformation'],
  shippingInformation : json['shippingInformation'],
  availabilityStatus : json['availabilityStatus'],
      returnPolicy : json['returnPolicy'],
      minimumOrderQuantity : json['minimumOrderQuantity'],
      meta : json['meta'] != null ?  Meta.fromJson(json['meta']) : null,
  thumbnail : json['thumbnail'],
  images : json['images']?.cast<String>(),
  reviews: json['reviews']?.map((v){return Reviews.fromJson(v);}).toList().cast<Reviews>()
  );
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data =  {};
  data['id'] = id;
  data['title'] = title;
  data['description'] = description;
  data['category'] = category;
  data['price'] = price;
  data['discountPercentage'] = discountPercentage;
  data['rating'] = rating;
  data['stock'] = stock;
  data['tags'] = tags;
  data['brand'] = brand;
  data['sku'] = sku;
  data['weight'] = weight;
  if (dimensions != null) {
    data['dimensions'] = dimensions!.toJson();
  }
  data['warrantyInformation'] = warrantyInformation;
  data['shippingInformation'] = shippingInformation;
  data['availabilityStatus'] = availabilityStatus;
  if (reviews != null) {
    data['reviews'] = reviews!.map((v) => v.toJson()).toList();
  }
  data['returnPolicy'] = returnPolicy;
  data['minimumOrderQuantity'] = minimumOrderQuantity;
  if (meta != null) {
    data['meta'] = meta!.toJson();
  }
  data['thumbnail'] = thumbnail;
  data['images'] = images;
  return data;
}

RealmProductModel toRealm(){
  return RealmProductModel(
    id,
      title : title,
      description : description,
      category :category,
      price : price,
      discountPercentage : discountPercentage,
      rating :rating,
      stock : stock,
      tags : tags?? const[],
      brand : brand,
      sku : sku,
      weight : weight,
      dimensions : dimensions?.toRealm(),
      warrantyInformation : warrantyInformation,
      shippingInformation :shippingInformation,
      availabilityStatus : availabilityStatus,
      returnPolicy : returnPolicy,
      minimumOrderQuantity : minimumOrderQuantity,
      meta : meta?.toRealm(),
      thumbnail : thumbnail,
      images : images??const[],
      reviews: reviews==null?const []: reviews!.map((v){return v.toRealm();}).toList().cast<RealmReviewModel>()

  );
}

factory ProductModel.fromRealmProduct(RealmProductModel realmProduct){
  return ProductModel(
    id: realmProduct.id,
      title : realmProduct.title,
      description : realmProduct.description,
      category :realmProduct.category,
      price : realmProduct.price,
      discountPercentage : realmProduct.discountPercentage,
      rating :realmProduct.rating,
      stock : realmProduct.stock,
      tags : realmProduct.tags,
      brand : realmProduct.brand,
      sku : realmProduct.sku,
      weight : realmProduct.weight,
      dimensions : Dimensions.fromRealmDimension(realmProduct.dimensions),
      warrantyInformation : realmProduct.warrantyInformation,
      shippingInformation :realmProduct.shippingInformation,
      availabilityStatus : realmProduct.availabilityStatus,
      returnPolicy : realmProduct.returnPolicy,
      minimumOrderQuantity : realmProduct.minimumOrderQuantity,
      meta : Meta.fromRealmMeta(realmProduct.meta),
      thumbnail : realmProduct.thumbnail,
      images : realmProduct.images,
      reviews: realmProduct.reviews.map((realmReview){ return Reviews.fromRealmReview(realmReview);}).toList().cast<Reviews>()

  );
}
}


class OrderProductModel{
  ProductModel product;
  int quantity;
  double price;
  OrderProductModel({
    required this.product,
    required this.quantity,
    required this.price
});

  RealmOrderProductModel toRealm(){
    return RealmOrderProductModel(quantity, price,product: product.toRealm());
  }

  factory OrderProductModel.fromRealm(RealmOrderProductModel orderProduct){
    return OrderProductModel(product: ProductModel.fromRealmProduct(orderProduct.product!), quantity: orderProduct.quantity, price: orderProduct.price);
  }
}


