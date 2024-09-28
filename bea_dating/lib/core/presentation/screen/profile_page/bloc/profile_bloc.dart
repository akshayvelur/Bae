import 'dart:async';

import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial(user:null, interest: null)){
    on<NavigateToUserDataEvent>(navigateToUserDataState);
 on<InitStateEvent>(initStateEvent);
on< NavigateBackToProfilEvent>( navigateBackToProfilEvent);
on<ProfileUserInterest>(profileUserInterest);
  }



  FutureOr<void> navigateToUserDataState(NavigateToUserDataEvent event, Emitter<ProfileState> emit) {
    emit(NavigateToUserDataState(user: state.user, interest: state.interest));
  }
  FutureOr<void> initStateEvent(InitStateEvent event, Emitter<ProfileState> emit) async{
      
    try{
     // emit(LoadingState(user: state.user));
    UserData userData = UserData();
    UserModel? user = await userData.getUserData();
    if (user != null) {
       print("profile data fetched");
     
   
      emit(IninitState(user: user, interest: state.interest,));
      emit(LoadingSuccessState(user:state.user,interest: state.interest));

    } else {
       print("NO DATA");
    }
  }catch(e){
    print("userinit error${e}");
  }
  }

  FutureOr<void> navigateBackToProfilEvent(NavigateBackToProfilEvent event, Emitter<ProfileState> emit) {
 emit(NavigateBacktoProfileState(user:state.user, interest:state.interest));
  }

  FutureOr<void> profileUserInterest(ProfileUserInterest event, Emitter<ProfileState> emit) {
    emit(ProfileInterestSelectedState(user: state.user, interest: state.interest));
  }
}
