import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget{
  const Searchbar({Key? key}) : super(key :key);

  State<Searchbar> createState()=> _SearchbarState();
}
class _SearchbarState extends State<Searchbar> {
  TextEditingController _searches = TextEditingController();
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }
  //_clear( _searches)async{
    //await _searches.delete();
  //}

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white , borderRadius: BorderRadius.circular(5)),
          child: TextField( controller: _searches , decoration:
            InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.clear)),
              hintText: 'Search...',
              border: InputBorder.none,
            )


          ),

        ),
      )
    ,
    );
  }
}
