import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class NotePaid extends StatefulWidget {
  const NotePaid({Key? key}) : super(key: key);

  @override
  State<NotePaid> createState() => _NotePaidState();
}

class _NotePaidState extends State<NotePaid> {
  TextEditingController title = TextEditingController();
  TextEditingController notes = TextEditingController();

  List<Color> textColor = [
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.black,
  ];
  List<Color> colorScheme = [
    Colors.red,
    Colors.yellow,
    Colors.grey,
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.cyanAccent,
    Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: (){
        //
        //     },
        //     icon: Icon(Icons.favorite_border),
        //   ),
        // ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("notes").snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return MasonryGridView.builder(
                itemCount: snapshot.data!.docs.length,
                mainAxisSpacing: 5,
                crossAxisSpacing: 4,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: colorScheme[index],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          snapshot.data!.docs[index]["title"],
                                          style: GoogleFonts.aldrich(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: textColor[index],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          snapshot.data!.docs[index]["notes"],
                                          style: GoogleFonts.aldrich(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 15,
                                            color: textColor[index],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: (){
                                    FirebaseFirestore.instance
                                        .collection("notes")
                                        .doc(snapshot.data!.docs[index].id)
                                        .delete();
                                  },
                                  icon: Icon(Icons.delete,color: textColor[index],),
                                ),
                                IconButton(
                                  onPressed: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('NotePad'),
                                          content: Container(
                                            height: 250,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: title,
                                                  decoration: InputDecoration(
                                                      hintText: "Title",
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      )
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  maxLines: 5,
                                                  controller: notes,
                                                  decoration: InputDecoration(
                                                      hintText: "Notes",
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: ()async{
                                                // Close the dialog
                                                await FirebaseFirestore.instance.collection("notes").doc(snapshot.data!.docs[index].id).update({
                                                  "title" : title.text.trim(),
                                                  "notes" : notes.text.trim(),
                                                }).then((value){
                                                  Navigator.pop(context);
                                                  title.clear();
                                                  notes.clear();
                                                }).onError((error, stackTrace){
                                                  print(error);
                                                });
                                              },
                                              child: Text('Update'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Close the dialog
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('cancel'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit,color: textColor[index],),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (context){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                        hintText: "Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                      ),
                    ),
                    TextFormField(
                      maxLines: 10,
                      controller: notes,
                      decoration: InputDecoration(
                        hintText: "Notes",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: ()async{
                        await FirebaseFirestore.instance.collection("notes").add({
                          "title" : title.text.trim(),
                          "notes" : notes.text.trim(),
                        }).then((value){
                          Navigator.pop(context);
                          title.clear();
                          notes.clear();
                        }).onError((error, stackTrace){
                          print(error);
                        });
                      },
                      child: Text("ADD NOTE"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
