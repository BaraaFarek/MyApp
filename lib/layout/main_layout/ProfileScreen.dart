import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Network/local/cache_Helper.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String userName;
  late String firstletter;
  @override
  var bloc = app_cubit()..fetchCategories();

  @override
  void initState() {
    super.initState();
    bloc.fetchCategories();
  }

  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<app_cubit, app_states>(
        listener: (BuildContext context, app_states state) {},
        builder: (BuildContext context, app_states state) {
          final appCubit = context.read<app_cubit>();
          final isDark = appCubit.isdark;

          return Scaffold(
            backgroundColor: isDark ? HexColor("17212B") : Colors.white,
            appBar: AppBar(
              backgroundColor: isDark ? HexColor("17212B") : Colors.white,
              iconTheme:
                  IconThemeData(color: isDark ? Colors.white : Colors.black),
              title: Text(
                'Profile',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
            ),
            body: Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Avatar and Name
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.blueGrey,
                          child: Text(
                            firstletter = userName[0],
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          userName = CacheHelper.getData(key: 'name'),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          leading: Icon(Icons.account_balance),
                          title: Text('Bank Account'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Contact Us Tab
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          leading: Icon(Icons.contact_mail),
                          title: Text('Contact Us'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          leading: Icon(Icons.logout_outlined),
                          title: Text('Logout'),
                        ),
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
