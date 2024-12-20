
import 'package:bea_dating/core/presentation/screen/category/bloc/category_bloc.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/bloc/chat_bloc.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/screen/notification_page/bloc/notification_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_data/bloc/user_upload_bloc.dart';
import 'package:bea_dating/core/presentation/screen/splash_screen/splash_screen.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'firebase_options.dart';
 final navigatorKey=GlobalKey<NavigatorState>();
void main() async{
 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
    runApp(MyApp(navigatorKey: navigatorKey));
});
}
class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.navigatorKey});
 final GlobalKey <NavigatorState>navigatorKey;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserDetailsBloc>(
          create: (context) => UserDetailsBloc(),
        ),
        BlocProvider<HomeblocBloc>(create: (context) => HomeblocBloc(),
       ), BlocProvider<ChatBloc>(create: (context) =>ChatBloc()),
       BlocProvider<CategoryBloc>(create: (context) => CategoryBloc(),
       ),BlocProvider<ProfileBloc>(create: (context) => ProfileBloc(),
       ),BlocProvider<UserUploadBloc>(create: (context) => UserUploadBloc(),
       ),BlocProvider<NotificationBloc>(create:(context) => NotificationBloc(),)
       
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
