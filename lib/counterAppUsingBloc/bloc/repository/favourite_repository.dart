import 'package:todo_app/counterAppUsingBloc/bloc/model/favourite_items_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemsModel>> fatchItem() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_genarateList(10));
  }

  List<FavouriteItemsModel> _genarateList(int length) {
    return List.generate(
      length,
      (index) =>
          FavouriteItemsModel(id: index.toString(), value: "Item: $index"),
    );
  }
}
