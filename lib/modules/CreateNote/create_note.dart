import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/Models/note_model.dart';
import 'package:todo/Shared/Componant/constants.dart';
import 'package:todo/Shared/Cubit/cubit.dart';
import 'package:todo/Shared/Cubit/state.dart';

class CreateNote extends StatelessWidget {
  CreateNote({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  String noteColor = '';


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state){},
        builder: (context , state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: cubit.chosenColor,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: cubit.chosenColor,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 28.0,
                ),
              ),
              actions:  [
                IconButton(
                  onPressed: (){
                    cubit.insertDatabase(
                        title: titleController.text,
                        body: bodyController.text,
                        time: DateFormat('EEE, d MMM    hh:mm aaa').format(DateTime.now()),
                        color: cubit.chosenColor.value,
                    );
                  },
                  icon: const Icon(
                    Icons.done,
                    color: Colors.black,
                    size: 28.0,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 5.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Note Title',
                      hintStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.grey,
                      ),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                    controller: titleController,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter You Note....',
                        hintStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 1000,
                      controller: bodyController,
                    ),
                  ),
                  Row(
                    children: [
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
                                            Icons.image,
                                          ),
                                          SizedBox(
                                            width: 25.0,
                                          ),
                                          Text(
                                              'Add Image'
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
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
                          Icons.add_box_outlined,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          scaffoldKey.currentState!.showBottomSheet((context) {
                            return BlocConsumer<AppCubit , AppStates>(
                              listener: (context , state){},
                              builder: (context , state) {
                                return Container(
                                  height: 100.0,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 20.0,
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                cubit.changeNoteColor(0);
                                              },
                                              icon:  Icon(
                                                Icons.done,
                                                color: bColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.orange,
                                              radius: 20.0,
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                cubit.changeNoteColor(1);
                                              },
                                              icon: Icon(
                                                Icons.done,
                                                color: bColor1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              radius: 20.0,
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                cubit.changeNoteColor(2);
                                              },
                                              icon: Icon(
                                                Icons.done,
                                                color: bColor2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.redAccent,
                                              radius: 20.0,
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                cubit.changeNoteColor(3);
                                              },
                                              icon: Icon(
                                                Icons.done,
                                                color: bColor3,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.yellow,
                                              radius: 20.0,
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                cubit.changeNoteColor(4);
                                              },
                                              icon: Icon(
                                                Icons.done,
                                                color: bColor4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.cyan,
                                              radius: 20.0,
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                cubit.changeNoteColor(5);
                                              },
                                              icon: Icon(
                                                Icons.done,
                                                color: bColor5,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.brown,
                                              radius: 20.0,
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                cubit.changeNoteColor(6);
                                              },
                                              icon: Icon(
                                                Icons.done,
                                                color: bColor6,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.purple,
                                              radius: 20.0,
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                cubit.changeNoteColor(7);
                                              },
                                              icon: Icon(
                                                Icons.done,
                                                color: bColor7,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                            backgroundColor: const Color(0xFFD6EAF8),
                            shape: const RoundedRectangleBorder(
                              borderRadius:BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.color_lens_outlined,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${DateFormat('EEE, d MMM    hh:mm aaa').format(DateTime.now())}',
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                                            Icons.delete,
                                          ),
                                          SizedBox(
                                            width: 25.0,
                                          ),
                                          Text(
                                              'Delete'
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
                                            Icons.favorite,
                                          ),
                                          SizedBox(
                                            width: 25.0,
                                          ),
                                          Text(
                                              'Favorite'
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
                                            Icons.archive,
                                          ),
                                          SizedBox(
                                            width: 25.0,
                                          ),
                                          Text(
                                              'Archive'
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
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
