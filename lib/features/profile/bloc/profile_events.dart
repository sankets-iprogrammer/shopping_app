import 'package:shopping_app/features/profile/models/address_model.dart';

abstract class ProfileEvents {}

class SaveAddressEvent extends ProfileEvents{
  final AddressModel address;
   SaveAddressEvent({required this.address});
}

class DeleteAddressEvent extends ProfileEvents{
  final String addressId;
  DeleteAddressEvent({
    required this.addressId
});
}

class GetUserProfileDataEvent extends ProfileEvents{}

class OpenAddressEditingScreenEvent extends ProfileEvents{
  final AddressModel? address;
  OpenAddressEditingScreenEvent({required this.address});
}