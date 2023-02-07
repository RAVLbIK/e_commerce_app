// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'user_info_event.dart';
// part 'user_info_state.dart';

// class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
//   UserInfoBloc() : super(UserInfoInitialState()) {
//     final repo = Repository();
//     on<UserInfoEvent>((event, emit) async {
//       try {
//         final Me user = await repo.getMeInformation();
//         emit(UserInfoLoadedState(user: user));
//       } catch (_) {
//         emit(UserInfoErrorState());
//       }
//     });
//     on<UserUpdateInfoEvent>((event, emit) async {
//       //repo update info
//     },);
//   }
// }
