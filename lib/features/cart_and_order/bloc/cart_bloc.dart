import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_event.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  CartBloc():super(CartState.initial()){
    on<SetSelectedAddressEvent>(_setSelectedAddress);
    on<SetSelectedPaymentMethodEvent>(_setSelectedPaymentOption);
  }

  void _setSelectedAddress(SetSelectedAddressEvent event,emit){
    emit(state.copyWith(selectedAddress: event.selectedAddress));
  }
  void _setSelectedPaymentOption(SetSelectedPaymentMethodEvent event,emit){
    emit(state.copyWith(selectedPaymentMethod: event.selectedPaymentMethod));
  }
}