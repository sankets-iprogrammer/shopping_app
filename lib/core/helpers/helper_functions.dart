import 'package:intl/intl.dart';
import 'package:shopping_app/features/home_page/model/dimension_model.dart';

class HelperFunctions {
  static double? calculateDiscountedPrice(double? originalPrice, double? discount ,{int? count}){
    if(originalPrice==null || discount==null || discount ==0){
      return originalPrice;
    }else{
      return double.parse(((originalPrice-(originalPrice*discount/100))*(count??1)).toStringAsFixed(2));
    }
  }

  static String getStockStateLabel(int? stock){
    if(stock==null ||stock ==0){
      return "Out of Stock";
    }else if(stock<10){
      return "Only $stock Left !";
    }else{
      return "In Stock";
    }
  }

  static String getDimensionText(Dimensions? dimension){
    if(dimension==null){
      return "-- x -- x --";
    }else{
      return "${dimension.height??"--"} x ${dimension.width??"--"} x ${dimension.depth??"--"} mm";
    }
  }

  static String getDateTimeString(DateTime dateTime){
    return DateFormat.yMMMd().format(dateTime);
  }
}
