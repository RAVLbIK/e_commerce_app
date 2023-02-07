// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:sentry_flutter/sentry_flutter.dart';

// part 'cart_event.dart';
// part 'cart_state.dart';

// class CartBloc extends Bloc<CartEvent, CartState> {
//   CartBloc() : super(CartInitialState()) {
//     on<CartFetchEvent>((event, emit) async {
//       try {
//         final clothes = await Repository().fetchLibrary();
//         if (clothes.isEmpty) {
//           emit(CartEmptyState());
//         } else {
//           emit(CartLoadedState(clothes: clothes));
//         }
//       } catch (_) {
//         emit(CartErrorState());
//       }
//     });
//     on<CartAddEvent>((event, emit) async {
//       //todo: add logic and repo
//     });
//     on<CartRemoveEvent>((event, emit) async {
//       //todo: add logic and repo
//       try {
//         final result =
//             await Repository().removeClothesFromCart(clothesId: event.clothesId);
//         final clothes = await Repository().fetchLibrary();
//         if (result) {
//           if (clothes.isEmpty) {
//             emit(CartEmptyState());
//           } else {
//             emit(CartLoadedState(clothes: clothes));
//           }
//         }
//       } catch (_) {
//         emit(CartErrorState());
//       }
//     },);
//   }
// }
