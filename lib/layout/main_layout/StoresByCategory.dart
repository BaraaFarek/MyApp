import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';

class StoresByCategory extends StatelessWidget {
  final int categoryId;

  StoresByCategory({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => app_cubit()..fetchStoresByCategory(categoryId),
      child: BlocConsumer<app_cubit, app_states>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is loadingStoresByCategoryState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is successStoresByCategoryState) {
            return ListView.builder(
              itemCount: state.stores.length,
              itemBuilder: (context, index) {
                final store = state.stores[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        store.imageStore,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          store.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(store.address),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Phone: ${store.phone}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Rating: ${store.rating}'),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is errorStoresByCategoryState) {
            return Center(child: Text(state.error));
          } else {
            // Return an empty container if the state does not match any expected states
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
