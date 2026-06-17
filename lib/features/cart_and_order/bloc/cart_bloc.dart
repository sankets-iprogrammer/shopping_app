import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/services/storage_services/realm_storage/realm_storage.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_event.dart';
import 'package:shopping_app/features/cart_and_order/bloc/cart_state.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/profile/models/order_model.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  CartBloc():super(CartState.initial()){
    on<SetSelectedAddressEvent>(_setSelectedAddress);
    on<SetSelectedPaymentMethodEvent>(_setSelectedPaymentOption);
    on<PlaceOrderEvent>(_placeOrder);
    on<ToggleFavoriteIDEvent>(_toggleFavoriteID);
    on<ChangeProductCartCountEvent>(_changeProductCartCount);
  }

  void _setSelectedAddress(SetSelectedAddressEvent event,emit){
    emit(state.copyWith(selectedAddress: event.selectedAddress));
  }
  void _setSelectedPaymentOption(SetSelectedPaymentMethodEvent event,emit){
    emit(state.copyWith(selectedPaymentMethod: event.selectedPaymentMethod));
  }
  void _placeOrder(PlaceOrderEvent event, emit)async{
    emit(state.copyWith(placeOrderStatus: LoadingStatus.loading));
    await Future.delayed(Duration(seconds: 3),(){
      RealmDBStorage.saveOrder(event.order);
      emit(state.copyWith(placeOrderStatus: LoadingStatus.success,currentOrder: event.order));
    });
    await Future.delayed(Duration(seconds: 3),(){
      emit(state.copyWith(placeOrderStatus: LoadingStatus.ready));
    });
  }

  void _toggleFavoriteID(ToggleFavoriteIDEvent event,emit){
    List<int> favoriteProductIds= List.from(state.favoriteProductIds);
    if(state.favoriteProductIds.contains(event.id)){
      favoriteProductIds.remove(event.id);
    }else{
      favoriteProductIds.add(event.id);
    }
    emit(state.copyWith(favoriteProductIds: favoriteProductIds));
  }

  void _changeProductCartCount(ChangeProductCartCountEvent event,emit){
    Map<int,int> productCartCount=Map.from(state.productCartCount);
    int count=productCartCount[event.id]??0;
    log(count.toString());
    if(event.desc){
      productCartCount[event.id]=--count;
      if(count<1){
        productCartCount.remove(event.id);
      }
    }else{
      productCartCount[event.id]=++count;
    }
    emit(state.copyWith(productCartCount: productCartCount));

  }

}