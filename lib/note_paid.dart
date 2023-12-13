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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.favorite_border),
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.delete,color: Colors.red,),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[index]["title"],
                                          style: GoogleFonts.aldrich(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
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
                                        Text(
                                          snapshot.data!.docs[index]["notes"],
                                          style: GoogleFonts.aldrich(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                      onPressed: (){
                        FirebaseFirestore.instance.collection("notes").add({
                          "title" : title.text.trim(),
                          "notes" : notes.text.trim(),
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
