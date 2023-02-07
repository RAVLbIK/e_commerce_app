// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'searchclothes_event.dart';
// part 'searchclothes_state.dart';

// class SearchClothesBloc extends Bloc<SearchClothesEvent, SearchClothesState> {
//   SearchClothesBloc() : super(SearchClothesInitialState()) {
//     on<SearchClothesByStringEvent>((event, emit) async {
//       try {
//         final results = await Repository().searchClothesByText(text: event.text);
//         final List<SearchClothesModel> filtred =
//             results.where((element) => element.isPublished == 1).toList();
//         if (results.isNotEmpty) {
//           emit(SearchClothesLoadedState(ClothesList: filtred));
//         } else {
//           emit(SearchClothesEmptyState());
//         }
//       } catch (_) {
//         emit(SearchClothesErrorState());
//       }
//     },);
//   }
// }
