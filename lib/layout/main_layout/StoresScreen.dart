import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/DeliveryComapanies.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';

class Storesscreen extends StatelessWidget {
  Storesscreen({super.key});
  Deliverycomapanies? deliverycomapanies;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => app_cubit()..fetchDeliveryCompanies(),
      child: BlocConsumer<app_cubit, app_states>(
        listener: (BuildContext context, app_states state) {},
        builder: (BuildContext context, app_states state) {
          final appCubit = context.read<app_cubit>();
          return Scaffold(
            backgroundColor:
                appCubit.isdark ? HexColor("17212B") : Colors.white,
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          if (state is loadingDeliveryCompaniesState)
                            Center(child: CircularProgressIndicator()),
                          if (state is successDeliveryCompaniesState)
                            Container(
                              height: 400, // ضبط ارتفاع مناسب
                              child: ListView.builder(
                                itemCount: state.delivery.length,
                                itemBuilder: (context, index) {
                                  final item = state.delivery[index];
                                  return Card(
                                    color: Colors.white.withOpacity(0.9),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      item.name,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Icon(Icons.delivery_dining),
                                                  ],
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  '${item.phone}\nDescription: ${item.description}',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // أيقونة التسليم على الطرف الأخير
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (state is errorsDeliveryCompaniesState)
                            Center(child: Text(state.error)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
