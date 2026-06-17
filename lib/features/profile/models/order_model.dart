import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';
import 'package:shopping_app/features/cart_and_order/model/payment_method_model.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';

class OrderModel {
  String orderId;
  DateTime placedOn;
  int orderStatusIndex;
  double productTotalPrice;
  double totalPrice;
  double shippingFee;
  double taxFee;
  PaymentMethodModel paymentMethod;
  AddressModel address;
  List<OrderProductModel> products;
  OrderModel({
    required this.orderId,
    required this.placedOn,
    required this.orderStatusIndex,
    required this.productTotalPrice,
    required this.totalPrice,
    required this.shippingFee,
    required this.taxFee,
    required this.paymentMethod,
    required this.address,
    required this.products
});

  RealmOrderModel toRealm(){
    return RealmOrderModel(
        orderId,
        placedOn,
        orderStatusIndex,
        productTotalPrice,
        totalPrice,
        shippingFee,
        taxFee,
      paymentMethod: paymentMethod.toRealm(),
      address: address.toRealm(),
      products: products.map((OrderProductModel product)=>product.toRealm()).cast<RealmOrderProductModel>()
    );
  }

  factory OrderModel.fromRealm(RealmOrderModel order){
    return OrderModel(orderId: order.orderId, placedOn: order.placedOn, orderStatusIndex: order.orderStatusIndex, productTotalPrice: order.productTotalPrice, totalPrice: order.totalPrice, shippingFee: order.shippingFee, taxFee: order.taxFee, paymentMethod: PaymentMethodModel.fromRealm(order.paymentMethod!), address: AddressModel.fromRealmAddress(order.address!), products: order.products.map((RealmOrderProductModel orderProduct)=>OrderProductModel.fromRealm(orderProduct)).toList().cast<OrderProductModel>());
  }
}