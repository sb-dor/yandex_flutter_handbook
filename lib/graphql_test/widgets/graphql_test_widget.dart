import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_flutter_handbook/graphql_test/bloc/graphql_bloc.dart';
import 'package:yandex_flutter_handbook/graphql_test/main.dart';

class GraphqlTestWidget extends StatefulWidget {
  const GraphqlTestWidget({super.key});

  @override
  State<GraphqlTestWidget> createState() => _GraphqlTestWidgetState();
}

class _GraphqlTestWidgetState extends State<GraphqlTestWidget> {
  late final GraphqlBloc _graphqlBloc;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _graphqlBloc = GraphqlBloc(iGraphqlRepository: graphqlRepository());
    _graphqlBloc.add(GraphqlEvent.getUsers());
  }

  @override
  void dispose() {
    _graphqlBloc.close();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: SafeArea(
        child: BlocBuilder<GraphqlBloc, GraphqlState>(
          bloc: _graphqlBloc,
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 10)),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(hintText: "Name"),
                        ),
                      ),
                      SizedBox(width: 10,),

                      Expanded(
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(hintText: "Email"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _graphqlBloc.add(
                            GraphqlEvent.createUser(
                              name: _nameController.text,
                              email: _emailController.text,
                            ),
                          );
                        },
                        child: Text("Create"),
                      ),
                    ],
                  ),
                ),

                switch (state) {
                  Graphql$IntialState() => SliverToBoxAdapter(child: SizedBox.shrink()),
                  Graphql$InProgressState() => SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  Graphql$ErrorState() => SliverFillRemaining(
                    child: Center(child: Text("Error outcropped")),
                  ),
                  Graphql$CompletedState() => SliverList.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: state.user.length,
                    itemBuilder: (context, index) {
                      final user = state.user[index];
                      return ListTile(
                        title: Text("User: ${user.name}"),
                        subtitle: Text("Email: ${user.email ?? ''}"),
                        trailing: Text("Role: ${user.graphqlRoleTest?.role ?? ''}"),
                      );
                    },
                  ),
                },
              ],
            );
          },
        ),
      ),
    );
  }
}
