import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Shared/Componant/constants.dart';
import 'package:todo/Shared/Cubit/cubit.dart';
import 'package:todo/Shared/Cubit/state.dart';
import 'package:todo/modules/CreateNote/create_note.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state) {},
        builder: (context , state) {
          var scaffoldKey = GlobalKey<ScaffoldState>();
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: const Text(
                'Notes',
                style: TextStyle(
                  fontSize: 22.0 ,
                  color: DEFUALT_COLOR,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.assignment,
                color: DEFUALT_COLOR,
                size: 25.0,
              ),
              actions: [
                IconButton(
                  onPressed: (){
                    scaffoldKey.currentState!.showBottomSheet((context){
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Row(
                                  children: const[
                                    Icon(
                                      Icons.archive,
                                      color: DEFUALT_COLOR,
                                    ),
                                    SizedBox(
                                      width: 25.0,
                                    ),
                                    Text(
                                        'Archive',
                                      style: TextStyle(
                                        color: DEFUALT_COLOR,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              InkWell(
                                onTap: (){},
                                child: Row(
                                  children: const[
                                    Icon(
                                      Icons.delete,
                                      color: DEFUALT_COLOR,
                                    ),
                                    SizedBox(
                                      width: 25.0,
                                    ),
                                    Text(
                                        'Trash',
                                      style: TextStyle(
                                        color: DEFUALT_COLOR,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              InkWell(
                                onTap: (){},
                                child: Row(
                                  children: const[
                                    Icon(
                                      Icons.brightness_4_outlined,
                                      color: DEFUALT_COLOR,
                                    ),
                                    SizedBox(
                                      width: 25.0,
                                    ),
                                    Text(
                                        'Night Mood',
                                      style: TextStyle(
                                        color: DEFUALT_COLOR,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                      backgroundColor: const Color(0xFFD6EAF8),
                      shape: const RoundedRectangleBorder(
                        borderRadius:BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: DEFUALT_COLOR,
                    size: 28.0,
                  ),
                ),
              ],
            ),
            body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              color: DEFUALT_COLOR,
              elevation: 2.0,
              // currentIndex: AppCubit.get(context).currentIndex,
              // onTap: (index){
              //   AppCubit.get(context).changeNavIndex(index);
              // },
              // items: const [
              //   BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.content_paste,
              //     ),
              //     label: 'My Notes',
              //   ),
              //   BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.done_outline,
              //     ),
              //     label: 'Done',
              //   ),
              //   BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.archive,
              //     ),
              //     label: 'Archive',
              //   ),
              // ],
              // selectedLabelStyle: const TextStyle(
              //   fontWeight: FontWeight.bold,
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: (){
                        AppCubit.get(context).changeNavIndex(0);
                      },
                      icon: const Icon(
                        Icons.content_paste,
                        color: Colors.white,
                      ),
                  ),
                  IconButton(
                    onPressed: (){
                      AppCubit.get(context).changeNavIndex(1);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: DEFUALT_COLOR,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return CreateNote();
                }));
              },
              child: const Icon(
                Icons.edit,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}
