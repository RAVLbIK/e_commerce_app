// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'register_event.dart';
// part 'register_state.dart';

// class RegisterUserBloc extends Bloc<RegisterEvent, RegisterState> {
//   RegisterUserBloc() : super(RegisterInitialState()) {
//     on<RegistrationEvent>((event, emit) async {
//       try {
//         final User user = await Repository().register(
//             fullName: event.name,
//             login: event.login,
//             password: event.password,
//             sex: event.sex);
//         emit(RegisterSuccessfulState(user: user));
//       } catch (e) {
//         emit(RegisterErrorState(errorMessage: e.toString()));
//       }
//     },);
//   }
// }
