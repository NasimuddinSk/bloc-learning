import 'package:bloc/bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/favourite/favourite_app_event.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/favourite/favourite_app_state.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/model/favourite_items_model.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/repository/favourite_repository.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppInitial> {
  List<FavouriteItemsModel> favouriteItemsList = [];
  List<FavouriteItemsModel> tempFavouriteItemsList = [];

  final FavouriteRepository favouriteRepository;

  FavouriteAppBloc(this.favouriteRepository) : super(FavouriteAppInitial()) {
    on<FeatchFavouriteList>(_fetchList);
    on<FavouriteItem>(_favouriteItem);
    on<CompleteItem>(_completeItem);
    on<DeleteItem>(_deleteItem);
  }

  void _fetchList(
    FeatchFavouriteList event,
    Emitter<FavouriteAppInitial> emit,
  ) async {
    favouriteItemsList = await favouriteRepository.fatchItem();
    emit(
      state.copyWith(
        favouriteItemsList: List.from(favouriteItemsList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _favouriteItem(FavouriteItem event, Emitter<FavouriteAppInitial> emit) {
    final index = favouriteItemsList.indexWhere(
      (item) => item.id == event.item.id,
    );
    favouriteItemsList[index] = event.item;

    emit(state.copyWith(favouriteItemsList: List.from(favouriteItemsList)));
  }

  void _completeItem(CompleteItem event, Emitter<FavouriteAppInitial> emit) {
    final index = favouriteItemsList.indexWhere(
      (item) => item.id == event.item.id,
    );
    tempFavouriteItemsList.add(event.item);

    favouriteItemsList[index] = event.item;

    emit(state.copyWith(favouriteItemsList: List.from(favouriteItemsList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteAppInitial> emit) {
    emit(state.copyWith(favouriteItemsList: List.from(favouriteItemsList)));
  }
}
