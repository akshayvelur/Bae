import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsInitial()) {
   
      on<SplashToWelcomeEvent>(splashToWelcomeEvent);
      on<WelcomeToRulePageEvent>(welcomeToRulePageEvent);
      on<RuleToNameformEvent>(ruleToNameformEvent);
      
      // TODO: implement event handler
    
  }

  FutureOr<void> splashToWelcomeEvent(SplashToWelcomeEvent event, Emitter<UserDetailsState> emit)async {
  await Future.delayed(Duration(seconds: 2));
    emit(NavigationToWelcomscreen());
    print("navigate to welcome");
  }

  FutureOr<void> welcomeToRulePageEvent(WelcomeToRulePageEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigationToRuleState());
     print("navigate to Rule");
  }

  FutureOr<void> ruleToNameformEvent(RuleToNameformEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToNameFormState());
  }
}
