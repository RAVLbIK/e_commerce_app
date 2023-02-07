// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'clothes_list_by_category_event.dart';
// part 'clothes_list_by_category_state.dart';

// class ClothesListByCategoryBloc
//     extends Bloc<ClothesListByCategoryEvent, ClothesListByCategoryState> {
//   ClothesListByCategoryBloc() : super(ClothesListByCategoryInitialState()) {
//     on<FetchClothesListByCategoryEvent>((event, emit) async {
//       try {
//         if (event.category != 0) {
//           final clothes = await Repository()
//               .fetchClothesListByCategory(schoolClass: event.classNumber);
//           emit(ClothesListByCategoryloadedState(clothes: clothes));
//         } else {
//           emit(ClothesListByCategoryNotSelectedState());
//         }
//       } catch (_) {
//         emit(ClothesListByCategoryErrorState());
//       }
//     },);
//   }
// }
