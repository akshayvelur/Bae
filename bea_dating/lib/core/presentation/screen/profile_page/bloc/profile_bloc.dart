import 'dart:async';

import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()){
    on<NavigateToUserDataEvent>(navigateToUserDataState);
 on<InitStateEvent>(initStateEvent);
  }



  FutureOr<void> navigateToUserDataState(NavigateToUserDataEvent event, Emitter<ProfileState> emit) {
    emit(NavigateToUserDataState());
  }
  FutureOr<void> initStateEvent(InitStateEvent event, Emitter<ProfileState> emit) async{
        print("jjj");
    try{
    UserData userData = UserData();
    UserModel? user = await userData.getUserData();
    if (user != null) {
      emit(IninitState(user: user));

    } else {}
  }catch(e){
    print("userinit error${e}");
  }
  }











  // FutureOr<void> initStateEvent(InitStateEvent event, Emitter<ProfileState> emit) async{

  // }


}
