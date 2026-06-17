import 'package:shopping_app/features/cart_and_order/model/payment_method_model.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';
import 'package:shopping_app/features/profile/models/order_model.dart';

class CartState {
  final List<int> favoriteProductIds;
  final Map<int, int> productCartCount;
  final LoadingStatus placeOrderStatus;
  final AddressModel? selectedAddress;
  final PaymentMethodModel? selectedPaymentMethod;
  final List<PaymentMethodModel> paymentMethods;
  final OrderModel? currentOrder;

  const CartState({
    required this.currentOrder,
    required this.selectedAddress,
    required this.selectedPaymentMethod,
  required this.paymentMethods,
    required this.placeOrderStatus,
    required this.favoriteProductIds,
    required this.productCartCount,
  });

  CartState copyWith({
    AddressModel? selectedAddress,
    PaymentMethodModel? selectedPaymentMethod,
    List<PaymentMethodModel>? paymentMethods,
    LoadingStatus? placeOrderStatus,
    List<int>? favoriteProductIds,
    Map<int, int>? productCartCount,
    OrderModel? currentOrder
  }) {
    return CartState(
      currentOrder: currentOrder ?? this.currentOrder,
      favoriteProductIds: favoriteProductIds ?? this.favoriteProductIds,
      productCartCount: productCartCount ?? this.productCartCount,
      placeOrderStatus: placeOrderStatus ?? this.placeOrderStatus,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }

  factory CartState.initial() {
    return CartState(
      currentOrder: null,
      selectedAddress: null,
      selectedPaymentMethod: null,
      favoriteProductIds: [1, 4],
      productCartCount: {},
      placeOrderStatus: LoadingStatus.ready,
      paymentMethods: [
        PaymentMethodModel(
          id: "abc",
          title: "Master Card",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ2bVBFkHXTJxCa1ekBbMsqgBBWHS-3Mf6CxVcW1MsePj2EeSZwj4njTUJ&s=10",
        ),
        PaymentMethodModel(
          id: "def",
          title: "Phone Pay",
          image: "https://img.icons8.com/color/1200/phone-pe.jpg",
        ),
        PaymentMethodModel(
          id: "hij",
          title: "Google Pay",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlqxos-CYEs2cL4nsV8uZFqA3trcWxhRkxg-K-UsXhY1kXKiVwjk2eQI8&s=10",
        ),
      ],
    );
  }
}
