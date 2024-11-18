import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/data/data_uploading/profile_image%20_uploading.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/domin/usecase/image_upload.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial(user: null)) {
    on<NavigateToUserDataEvent>(navigateToUserDataState);
    on<InitStateEvent>(initStateEvent);
    on<NavigateBackToProfilEvent>(navigateBackToProfilEvent);
    on<ProImageUploadingEvent>(proImageUploadingEvent);
    on<ProfilePhotoDetetingEvent>(profilePhotoDetetingEvent);
  }

  FutureOr<void> navigateToUserDataState(
      NavigateToUserDataEvent event, Emitter<ProfileState> emit) {
    emit(NavigateToUserDataState(user: state.user));
  }

  FutureOr<void> initStateEvent(
      InitStateEvent event, Emitter<ProfileState> emit) async {
    try {
      // emit(LoadingState(user: state.user));
      UserData userData = UserData();
      UserModel? user = await userData.getUserData();
      if (user != null) {
        print("profile data fetched");

        emit(IninitState(user: user));
        emit(LoadingSuccessState(user: state.user));
      } else {
        print("NO DATA");
      }
    } catch (e) {
      print("userinit error${e}");
    }
  }

  FutureOr<void> navigateBackToProfilEvent(
      NavigateBackToProfilEvent event, Emitter<ProfileState> emit) async {
    UserData userData = UserData();
    UserModel? user = await userData.getUserData();
    if (user != null) {
      emit(LoadingSuccessState(user: user));
    }
    print(state.user!.interest);
    emit(NavigateBacktoProfileState(
      user: state.user,
    ));
  }

  FutureOr<void> proImageUploadingEvent(
      ProImageUploadingEvent event, Emitter<ProfileState> emit) async {
    List<XFile> image = [];
    String ?_imgUrl ;
    Authentic _authentic = Authentic();
    ProfileImageUpdating profileImageUpdating=ProfileImageUpdating();

  
      final XFile ? img = await ImagePicker().pickImage(source: ImageSource.gallery);
   
 
    // uploading image and downloading url

    try {

  if(img!=null){
    Uint8List imageBytes = await img.readAsBytes();
  
    _imgUrl=  await  profileImageUpdating.uploadImage("profileimage", imageBytes);
      
      log("url${_imgUrl.toString()}");
   } } catch (e) {
      log("MY IMAGE${e.toString()}");
    }
    // updating on firbase
  await profileImageUpdating.updating(_imgUrl!);
  add(InitStateEvent());
  }

  FutureOr<void> profilePhotoDetetingEvent(ProfilePhotoDetetingEvent event, Emitter<ProfileState> emit) async{
     ProfileImageUpdating profileImageUpdating=ProfileImageUpdating();

    await profileImageUpdating.deletingImages(event.deleteId);

  
       UserData userData = UserData();
    UserModel? user = await userData.getUserData();
    if (user != null) {
      
       emit(LoadingSuccessState(user: user));
      emit(ProfilePhotoDetetingSate(user: user));
    }
    print(state.user!.interest);

  }
}
