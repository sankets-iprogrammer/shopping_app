import 'package:shopping_app/features/main_screen/model/user_data_model.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';

import '../models/order_model.dart';

class ProfileState {
  final List<AddressModel> addresses;
  final UserDataModel? userData;
  final bool isProfileLoading;
  final bool isProfileLoadingFailed;
  final String errorMessage;
  final bool isSaveAddressLoading;
  final EditingStatus addressEditingStatus;
  final EditingStatus profileEditingStatus;
  final AddressModel? currentEditingAddress;
  final List<OrderModel> orders;

  const ProfileState({
    required this.orders,
    required this.addresses,
    required this.userData,
    required this.isProfileLoading,
    required this.isProfileLoadingFailed,
    required this.errorMessage,
    required this.isSaveAddressLoading,
    required this.addressEditingStatus,
    required this.profileEditingStatus,
    required this.currentEditingAddress
});


  ProfileState copyWith({
    List<OrderModel>? orders,
  List<AddressModel>? addresses,
  UserDataModel? userData, bool? isProfileLoading,
  bool? isProfileLoadingFailed,
    String? errorMessage,
    bool? isSaveAddressLoading,
    EditingStatus? addressEditingStatus,
    EditingStatus? profileEditingStatus,
    AddressModel? currentEditingAddress,

  }
  ){
    return ProfileState(
      orders: orders ?? this.orders,
        currentEditingAddress: currentEditingAddress,
        addressEditingStatus: addressEditingStatus ?? this.addressEditingStatus,
        profileEditingStatus: profileEditingStatus ?? this.profileEditingStatus,
        isSaveAddressLoading: isSaveAddressLoading ?? this.isSaveAddressLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        isProfileLoading: isProfileLoading ?? this.isProfileLoading,
        isProfileLoadingFailed: isProfileLoadingFailed ??
            this.isProfileLoadingFailed,
        addresses: addresses?? this.addresses,
        userData:userData??this.userData
    );
  }

  factory ProfileState.initial(){
    return ProfileState(
      orders: [],
      currentEditingAddress: null,
      profileEditingStatus: EditingStatus.ready,
      addressEditingStatus: EditingStatus.ready,
      isSaveAddressLoading: false,
      errorMessage: "",
      isProfileLoadingFailed: false,
        isProfileLoading: false,
        userData: null,
        addresses: [
      AddressModel(id: "a", name: "Home", number: 9876543210, street: "42, Rose Garden Street, Bandra West", postalCode: 400050, city: "Mumbai", state: "Maharashtra", country: "India"),
      AddressModel(id: "b", name: "Office", number:  9123456789, street: "7th Floor, Tech Park, Andheri East", postalCode: 400069, city: "Mumbai", state: "Maharashtra", country: "India"),
    ]);
  }
}
