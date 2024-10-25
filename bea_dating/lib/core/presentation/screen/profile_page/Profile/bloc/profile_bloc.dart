import 'dart:async';

import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial(user:null)){
    on<NavigateToUserDataEvent>(navigateToUserDataState);
 on<InitStateEvent>(initStateEvent);
on< NavigateBackToProfilEvent>( navigateBackToProfilEvent);


  }



  FutureOr<void> navigateToUserDataState(NavigateToUserDataEvent event, Emitter<ProfileState> emit) {
    emit(NavigateToUserDataState(user: state.user));
  }
  FutureOr<void> initStateEvent(InitStateEvent event, Emitter<ProfileState> emit) async{
      
    try{
     // emit(LoadingState(user: state.user));
    UserData userData = UserData();
    UserModel? user = await userData.getUserData();
    if (user != null) {
       print("profile data fetched");
     
   
      emit(IninitState(user: user));
      emit(LoadingSuccessState(user:state.user));

    } else {
       print("NO DATA");
    }
  }catch(e){
    print("userinit error${e}");
  }
  }

  FutureOr<void> navigateBackToProfilEvent(NavigateBackToProfilEvent event, Emitter<ProfileState> emit) {
     emit(LoadingSuccessState(user:state.user));
     print(state.user!.interest);
 emit(NavigateBacktoProfileState(user:state.user,));

  }

}
