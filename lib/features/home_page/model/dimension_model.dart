import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
        width : json['width'],
        height : json['height'],
        depth : json['depth'],
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['width'] = width;
    data['height'] = height;
    data['depth'] = depth;
    return data;
  }

  RealmDimensionModel toRealm(){
   return RealmDimensionModel(
      width: width,
      height: height,
      depth: depth
    );
  }
  factory Dimensions.fromRealmDimension(RealmDimensionModel? realmDimension){
    return Dimensions(
        width: realmDimension?.width,
        height: realmDimension?.height,
        depth: realmDimension?.depth
    );
  }
}
