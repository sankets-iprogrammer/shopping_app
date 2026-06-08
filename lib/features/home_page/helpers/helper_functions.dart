import 'package:shopping_app/features/home_page/model/dimension_model.dart';

num? calculateDiscountedPrice(num? originalPrice, num? discount){
  if(originalPrice==null || discount==null || discount ==0){
    return originalPrice;
  }else{
    return double.parse((originalPrice-(originalPrice*discount/100)).toStringAsFixed(2));
  }
}

String getStockStateLabel(int? stock){
  if(stock==null ||stock ==0){
    return "Out of Stock";
  }else if(stock<10){
    return "Only $stock Left !";
  }else{
    return "In Stock";
  }
}

String getDimensionText(Dimensions? dimension){
  if(dimension==null){
    return "-- x -- x --";
  }else{
    return "${dimension.height??"--"} x ${dimension.width??"--"} x ${dimension.depth??"--"} mm";
  }
}