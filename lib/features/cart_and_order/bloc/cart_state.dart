import 'package:shopping_app/features/cart_and_order/model/payment_method_model.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';

class CartState {
  final AddressModel? selectedAddress;
  final PaymentMethodModel? selectedPaymentMethod;
  final List<PaymentMethodModel> paymentMethods;
  const CartState({this.selectedAddress, this.selectedPaymentMethod ,this.paymentMethods =const[]});
  CartState copyWith({ AddressModel? selectedAddress, PaymentMethodModel? selectedPaymentMethod ,List<PaymentMethodModel>? paymentMethods}){
    return CartState(
      selectedAddress: selectedAddress??this.selectedAddress,
      selectedPaymentMethod: selectedPaymentMethod??this.selectedPaymentMethod,
        paymentMethods :paymentMethods??this.paymentMethods
    );
  }

  factory CartState.initial(){
    return CartState(paymentMethods: [
      PaymentMethodModel(id: "abc",title: "Master Card",image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ2bVBFkHXTJxCa1ekBbMsqgBBWHS-3Mf6CxVcW1MsePj2EeSZwj4njTUJ&s=10"),
      PaymentMethodModel(id: "def",title: "Phone Pay",image: "https://img.icons8.com/color/1200/phone-pe.jpg"),
      PaymentMethodModel(id: "hij",title: "Google Pay",image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlqxos-CYEs2cL4nsV8uZFqA3trcWxhRkxg-K-UsXhY1kXKiVwjk2eQI8&s=10"),


    ]);
  }
}