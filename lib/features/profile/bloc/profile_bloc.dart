import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/profile/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileBloc,ProfileState>{
  ProfileBloc():super(ProfileState.initial());
}