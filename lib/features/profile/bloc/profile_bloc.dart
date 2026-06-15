import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/overlay_widgets.dart';
import 'package:shopping_app/core/network_project/api_calls.dart';
import 'package:shopping_app/features/main_screen/model/user_data_model.dart';
import 'package:shopping_app/features/profile/bloc/profile_events.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';

class ProfileBloc extends Bloc<ProfileEvents,ProfileState>{
  ProfileBloc():super(ProfileState.initial()){
    on<SaveAddressEvent>(_saveAddress);
    on<GetUserProfileDataEvent>(_getProfileData);
    on<DeleteAddressEvent>(_deleteAddress);
    on<OpenAddressEditingScreenEvent>(_openAddressEditingScreen);
  }

  void _saveAddress(SaveAddressEvent event,emit){
    List<AddressModel> addresses =state.addresses;
    addresses.add(event.address);
    emit(state.copyWith(addresses: addresses,addressEditingStatus: EditingStatus.success));
  }

  void _getProfileData(GetUserProfileDataEvent event,emit)async{
    emit(state.copyWith(isProfileLoading: true));
    try{
      UserDataModel userData=await ApiCalls.getCurrentUser();
      emit(state.copyWith(isProfileLoading: false,userData: userData));
    }on DioException catch(e){
      emit(state.copyWith(isProfileLoading: false,isProfileLoadingFailed: true,errorMessage:e.message));
    }catch(e){
      emit(state.copyWith(isProfileLoading: false,isProfileLoadingFailed: true,errorMessage:"Unknown error"));
    }
  }

  void _deleteAddress(DeleteAddressEvent event, emit) async {
    emit(state.copyWith(isProfileLoading: true));
    await Future.delayed(Duration(seconds: 2),
            () async {
          List<AddressModel> addresses = state.addresses;
          addresses.removeWhere((address) {
            return address.id == event.addressId;
          });
          emit(state.copyWith(addresses: addresses,));
        });
  }

  void _openAddressEditingScreen(OpenAddressEditingScreenEvent event,emit){
    emit(state.copyWith(currentEditingAddress: event.address,addressEditingStatus: EditingStatus.editing));
  }

}