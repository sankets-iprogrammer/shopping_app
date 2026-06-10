import 'package:shopping_app/features/profile/models/address_model.dart';

class ProfileState {
  final List<AddressModel> addresses;

  const ProfileState({required this.addresses});

  ProfileState copyWith(
  List<AddressModel>? addresses
  ){
    return ProfileState(
        addresses: addresses?? this.addresses
    );
  }

  factory ProfileState.initial(){
    return ProfileState(addresses: [
      AddressModel(id: "a", name: "abcd", number: 3475455, street: "dscdcnd", postalCode: 415502, city: "pune", state: "maharashtra", country: "india"),
      AddressModel(id: "b", name: "efgh", number: 3475455, street: "dscdcnd", postalCode: 415502, city: "pune", state: "maharashtra", country: "india"),
      AddressModel(id: "c", name: "ijkl", number: 3475455, street: "dscdcnd", postalCode: 415502, city: "pune", state: "maharashtra", country: "india"),
    ]);
  }
}
