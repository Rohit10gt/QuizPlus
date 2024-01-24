import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizpluse/Service/database.dart';

class Question extends StatefulWidget {
String category;
Question({required this.category});
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {

  bool show = false;

  getontheload()async{
    QuizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {

    });
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Stream? QuizStream;
  PageController controller = PageController();

  Widget allQuiz(){
    return StreamBuilder(
        stream: QuizStream,
        builder:(context,AsyncSnapshot snapshot){
          return snapshot.hasData? PageView.builder(
              itemCount: snapshot.data.docs.length,
              controller: controller,
              itemBuilder: (context,index){
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.network(
                                ds["Image"],
                                fit: BoxFit.cover,
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: GestureDetector(
                              onTap: (){
                                show = true;
                                setState(() {

                                });
                              },
                              child: show?Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ds["correct"]==ds["option1"]?Colors.green:Colors.red,width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text(ds["option1"],style: TextStyle(fontSize:18, color: Colors.black),),
                              ):Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF818181),width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text(ds["option1"],style: TextStyle(fontSize:18, color: Colors.black),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: GestureDetector(
                              onTap: (){
                                show = true;
                                setState(() {

                                });
                              },
                              child: show?Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ds["correct"]==ds["option2"]?Colors.green:Colors.red,width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text(ds["option2"],style: TextStyle(fontSize:18, color: Colors.black),),
                              ):Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF818181),width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text(ds["option2"],style: TextStyle(fontSize:18, color: Colors.black),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: GestureDetector(
                              onTap: (){
                                show = true;
                                setState(() {

                                });
                              },
                              child: show?Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ds["correct"]==ds["option3"]?Colors.green:Colors.red,width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text(ds["option3"],style: TextStyle(fontSize:18, color: Colors.black),),
                              ):Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF818181),width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text(ds["option3"],style: TextStyle(fontSize:18, color: Colors.black),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: GestureDetector(
                              onTap: (){
                                show = true;
                                setState(() {

                                });
                              },
                              child: show?Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ds["correct"]==ds["option4"]?Colors.green:Colors.red,width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text(ds["option4"],style: TextStyle(fontSize:18, color: Colors.black),),
                              ):Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF818181),width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text(ds["option4"],style: TextStyle(fontSize:18, color: Colors.black),),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                show=false;
                              });
                              controller.nextPage(
                                  duration: Duration(
                                      milliseconds: 200
                                  ),
                                  curve: Curves.easeIn
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF004840),
                                    ),
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(0xFF004840)
                                    )
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }):Container();
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004840),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: (){Navigator.pop(context);},
          ),
        ),
        centerTitle: true,
        title: Text(widget.category,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      body: allQuiz(),
    );
  }
}
