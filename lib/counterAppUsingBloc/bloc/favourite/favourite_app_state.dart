import 'package:equatable/equatable.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/model/favourite_items_model.dart';

enum ListStatus { loading, success, failure }

class FavouriteAppInitial extends Equatable {
  final List<FavouriteItemsModel> favouriteItemsList;
  final ListStatus listStatus;

  const FavouriteAppInitial({
    this.favouriteItemsList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteAppInitial copyWith({
    List<FavouriteItemsModel>? favouriteItemsList,
    ListStatus? listStatus,
  }) {
    return FavouriteAppInitial(
      favouriteItemsList: favouriteItemsList ?? this.favouriteItemsList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object> get props => [favouriteItemsList, listStatus];
}
