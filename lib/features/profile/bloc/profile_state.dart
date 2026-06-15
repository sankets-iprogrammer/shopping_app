import 'package:shopping_app/features/main_screen/model/user_data_model.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/profile/models/address_model.dart';

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

  const ProfileState({
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
      currentEditingAddress: null,
      profileEditingStatus: EditingStatus.ready,
      addressEditingStatus: EditingStatus.ready,
      isSaveAddressLoading: false,
      errorMessage: "",
      isProfileLoadingFailed: false,
        isProfileLoading: false,
        userData: null,
        addresses: [
      AddressModel(id: "a", name: "abcd", number: 3475455, street: "dscdcnd", postalCode: 415502, city: "pune", state: "maharashtra", country: "india"),
      AddressModel(id: "b", name: "efgh", number: 3475455, street: "dscdcnd odsjfdsid sdodsdsc dsoifdsds odisj", postalCode: 415502, city: "pune", state: "maharashtra", country: "india"),
      AddressModel(id: "c", name: "ijkl", number: 3475455, street: "dscdcnd", postalCode: 415502, city: "pune", state: "maharashtra", country: "india"),
    ]);
  }
}
