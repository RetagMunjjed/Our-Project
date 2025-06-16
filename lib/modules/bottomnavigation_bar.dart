import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/cubit/bottom_navigation_bar_cubit.dart';
import 'package:untitled10/cubit/bottom_navigation_bar_status.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context )=>cubit_bottom_navigation_bar(),
      child: BlocConsumer<cubit_bottom_navigation_bar,Status_bottom_navigation_bar>(
          listener: (BuildContext context , Status_bottom_navigation_bar status){},
          builder: (BuildContext context , Status_bottom_navigation_bar status){
            cubit_bottom_navigation_bar keyOfCubit = cubit_bottom_navigation_bar.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xfffdb1a1),
                elevation: 5,
                shadowColor: Colors.indigo[900],
                titleSpacing: 30,
                  actions: [
                    Builder(
                      builder:(context)=> IconButton(
                        icon: Icon(Icons.menu, size: 28, color: Colors.white),
                        onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                        },
                      ),
                    ),
                  ],

              ),
              endDrawer: Drawer(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 154, 149, 149),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 150,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Name",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                    ListTile(
                      title: Text("Favorite"),
                      leading: Icon(Icons.favorite),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("Language"),
                      leading: Icon(Icons.language),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("Log Out"),
                      leading: Icon(Icons.logout),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("Setting"),
                      leading: Icon(Icons.settings),
                      onTap: () {},
                    )
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  elevation: 3,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.black,
                  backgroundColor: Color(0xfffdb1a1),
                  currentIndex: keyOfCubit.ontap_index_forChangingScreen,
                  selectedLabelStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),
                  unselectedLabelStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),
                  onTap: (index){
                    keyOfCubit.function_to_change_the_screens(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined,size:30 ,),
                        label: 'Home'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.list_alt_outlined,size:28 ),
                        label: 'Orders'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_box_outlined,size:28 ),
                        label: 'Profile'
                    ),
                  ]


              ),
              body: keyOfCubit.Screens[keyOfCubit.ontap_index_forChangingScreen],

            );
          },
          ),
    );
  }
}
