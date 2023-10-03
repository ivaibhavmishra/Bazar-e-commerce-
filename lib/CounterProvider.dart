//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountProvider with ChangeNotifier{

  int count=0;
  void increase(){
    count++;
    notifyListeners();
  }
}


class count extends StatefulWidget{
  const count ({Key? key}) : super(key : key);
  State<count> createState() => _countState();
}


class _countState extends State<count> {

  final CollectionReference _table = FirebaseFirestore.instance.collection("Table1");
  TextEditingController _name = TextEditingController();
  TextEditingController _id = TextEditingController();
  TextEditingController _domain = TextEditingController();


  _create()async{
     showModalBottomSheet(context : context, builder : (BuildContext context){
      return Padding(padding: EdgeInsets.only(top:20, left: 20, right: 20,
      bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _name,
          decoration: InputDecoration(
            hintText: "Enter yor name"
          ),),
          TextField(controller: _id,
              decoration: InputDecoration(
                hintText: "Enter your id"
              ),),
          TextField(controller: _domain,
          decoration: InputDecoration(
            hintText: "Enter your domain"
          ),),
          ElevatedButton(onPressed: ()async{
            await _table.add({"Domain": _domain.text, "id" : _id.text, "Name" : _name.text
          });}, child: Text("Add Data"))

        ],
      ),
      );

    });

  }

  _delete(String productId)async{
    await _table.doc(productId).delete();
  }
 // _update(String (_name ,_id , _domain))async{
 //   await _table.doc(productId).update(_name , _domain , _id);
//  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD OPERATION"),
      ),
      body:StreamBuilder(
        stream: _table.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if(streamSnapshot.hasData){
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index){
                 final DocumentSnapshot documentSnapshot= streamSnapshot.data!.docs[index];
                 print(documentSnapshot['Domain'].toString());
                 print(documentSnapshot['id'].toString());
                 print(documentSnapshot['Name'].toString());
                 return Card(
                   margin: const EdgeInsets.all(10),
                   child: ListTile(
                   title: Text(documentSnapshot['Name'].toString()),
                   subtitle: Text(documentSnapshot['Domain'].toString()),
                   trailing: SizedBox(width: 100, child: Row(
                      children: [
                        IconButton(onPressed: (){
                            _delete(documentSnapshot.id);} , icon: Icon(Icons.delete),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.update))
                      ],
                  ),
                  ))
                );}
            );
          }
          return Center(
            child: CustomScrollView(),
          );
        },
      ),
        floatingActionButton :  FloatingActionButton(
          onPressed: (){_create();}, child: Icon(Icons.add),

        )
    );
  }
}