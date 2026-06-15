import 'package:shopping_app/features/cart_and_order/model/payment_method_model.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';

abstract class CartEvent {}
class SetSelectedAddressEvent extends CartEvent{
  AddressModel selectedAddress;
  SetSelectedAddressEvent({required this.selectedAddress});
}

class SetSelectedPaymentMethodEvent extends CartEvent{
  PaymentMethodModel selectedPaymentMethod;
  SetSelectedPaymentMethodEvent({required this.selectedPaymentMethod});
}
