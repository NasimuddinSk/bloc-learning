import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/favourite/favourite_app_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/favourite/favourite_app_event.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/favourite/favourite_app_state.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/model/favourite_items_model.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() {
    return _FavouriteAppScreenState();
  }
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteAppBloc>().add(FeatchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        actions: [
          BlocBuilder<FavouriteAppBloc, FavouriteAppInitial>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<FavouriteAppBloc>().add(DeleteItem());
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                  SizedBox(),
                  SizedBox(width: 20),
                ],
              );
            },
          ),
        ],
        title: Text("Favourite app", style: TextStyle(color: Colors.white)),
      ),
      body: BlocBuilder<FavouriteAppBloc, FavouriteAppInitial>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return Center(child: CircularProgressIndicator.adaptive());
            case ListStatus.failure:
              return Center(child: Text("Somthing went wrong..."));
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favouriteItemsList.length,
                itemBuilder: (context, index) {
                  FavouriteItemsModel item = state.favouriteItemsList[index];

                  return Card(
                    color: const Color.fromARGB(12, 255, 203, 203),
                    child: ListTile(
                      title: Text(
                        state.favouriteItemsList[index].value,
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Checkbox(
                        value: state.favouriteItemsList[index].isDeleting,
                        onChanged: (value) {
                          FavouriteItemsModel itemsModel = FavouriteItemsModel(
                            id: item.id,
                            value: item.value,
                            isDeleting: value!,
                            isFavourite: item.isFavourite,
                          );
                          context.read<FavouriteAppBloc>().add(
                            CompleteItem(item: itemsModel),
                          );
                        },
                      ),

                      trailing: IconButton(
                        onPressed: () {
                          FavouriteItemsModel itemsModel = FavouriteItemsModel(
                            id: item.id,
                            value: item.value,
                            isDeleting: item.isDeleting,
                            isFavourite: !item.isFavourite,
                          );
                          context.read<FavouriteAppBloc>().add(
                            FavouriteItem(item: itemsModel),
                          );
                        },
                        icon: Icon(
                          item.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: item.isFavourite ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
