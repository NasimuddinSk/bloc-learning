import 'package:equatable/equatable.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/model/favourite_items_model.dart';

abstract class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();

  @override
  List<Object> get props => [];
}

class FeatchFavouriteList extends FavouriteAppEvent {}

class FavouriteItem extends FavouriteAppEvent {
  final FavouriteItemsModel item;
  const FavouriteItem({required this.item});
}

class CompleteItem extends FavouriteAppEvent {
  final FavouriteItemsModel item;

  const CompleteItem({required this.item});
}

class DeleteItem extends FavouriteAppEvent {}
