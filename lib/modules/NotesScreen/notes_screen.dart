import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        padding: const EdgeInsets.all(10.0),
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1/1.15,
        children: List.generate(20, (index) => notesListItem(context)),
      ),
    );
  }

  Widget notesListItem (context)
  {
    return InkWell(
      onTap: (){
      },
      child: Material(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15.0),
        elevation: 0.4,
        child: Container(
          height: MediaQuery.of(context).size.height*0.27,
          width: MediaQuery.of(context).size.width*0.45,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [
              Text(
                'My First in this new application',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'this my first note in my new Application , and this is the body of this note ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
