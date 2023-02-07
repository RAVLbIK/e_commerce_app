// import 'dart:developer';

// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitialState()) {
//     on<LoginAppEvent>((event, emit) async {
//       try {
//         final user = await Repository()
//             .authorization(login: event.login, password: event.password);
//         emit(LoginFinishedState(user: user));
//       } catch (e) {
//         log(e.toString());
//         emit(LoginErrorState());
//       }
//     });
//     on<LoginAppCheckEvent>((event, emit) async {
//       try {
//         final String? token = await LocalStorage.instance.getToken();
//         if (token != null && token.isNotEmpty) {
//           final userInfo = await Repository().getMeInformation();
//           if (userInfo.regDate.toString().isNotEmpty) {
//             emit(LoginedUserState());
//           }
//         } else {
//           emit(LoginUserUnloginnedState());
//         }
//       } catch (_) {
//         emit(LoginInitialState());
//       }
//     });
//     on<LogoutAppEvent>((event, emit) async {
//       try {
//         LocalStorage.instance.clearData();
//         emit(LoginInitialState());
//       } catch (_) {
//         emit(LoginErrorState());
//       }
//     },);
//   }
// }
