import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/bloc/user_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/bloc/user_event.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/bloc/user_state.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/model/user_model.dart';

class BlocProviderRepo extends StatelessWidget {
  const BlocProviderRepo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc Provider repo")),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is UserErrorState) {
            return Center(child: Text(state.error));
          }
          if (state is UserSuccessState) {
            final List<Datum> userList = state.userModel.data;

            return userList.isNotEmpty
                ? ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            "${userList[index].firstName} ${userList[index].lastName}",
                          ),
                          subtitle: Text(userList[index].email),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              userList[index].avatar,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
                : Center(child: Text("No Data Found!"));
          }
          return SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add(LoadUserEvent());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
