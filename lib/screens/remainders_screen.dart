import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RemaindersScreen extends StatelessWidget {
  const RemaindersScreen({Key? key}) : super(key: key);
  static const routeName='/remainders-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const  IconThemeData(
          color: Colors.black, //change your color here
        ),
         backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Remainder\'s",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: Colors.black,size: 25,),
          ),
        ],
      ),
      floatingActionButton:   FloatingActionButton(
        child: const Icon(
            Icons.add,color: Colors.black,
            size: 32
        ),
        backgroundColor: Colors.yellow[300],
        onPressed: (){
          showAdTask(context);
          //TODO:Add new remainder feature to be added
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("TODAY",style:TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 3,),
               Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightBlue[200],
                ),
                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children:  [
                       Column(
                         children: [
                           const   Text("Title"),
                           const  Text("Para"),
                         ],
                       ),
                       Column(
                         children: [
                           Container(
                             height: 2,
                             width:  MediaQuery.of(context).size.width,
                             color: Colors.white,
                           ),
                           SizedBox(height: 5,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               const  Text("TODAY", style: TextStyle(fontStyle: FontStyle.italic),),
                               const  Text("6:00 PM"),
                             ],
                           ),
                         ],
                       ),

                     ],
                   ),
                 ),
              ),
            const SizedBox(height: 20,),
            const Text("UPCOMING",style:TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            const SizedBox(height: 3,),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.lightBlue[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const   Text("Title"),
                        const Text("Para"),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 2,
                          width:  MediaQuery.of(context).size.width,
                          color: Colors.white,
                        ),
                        const  SizedBox(height: 3,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const   Text("TODAY", style: TextStyle(fontStyle: FontStyle.italic),),
                            const   Text("6:00 PM"),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

}

void showAdTask(context) {
  TextEditingController titlename = TextEditingController();
  TextEditingController para = TextEditingController();
  Alert(
      context: context,
      content: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height *0.30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlue[200],
            ),
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller: titlename,
                   decoration: new InputDecoration.collapsed(
                       hintText: 'Title',
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller: para,
                   keyboardType: TextInputType.multiline,
                   maxLines: null,
                   decoration: const InputDecoration.collapsed(
                       hintText: 'Type here..',
                   ),
                 ),
               ),
             ],
           ),
          ),
          const SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height *0.07,
                width: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
                ),
                child: const Center(child: Text("Set Date",style: TextStyle(fontSize: 15),)),

              ),
              Container(
                height: MediaQuery.of(context).size.height *0.07,
                width: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
                ),
                child: const Center(child: Text("Set Time",style: TextStyle(fontSize: 15),)),
              ),
            ],
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.yellow[300],
          child: const Text(
            "+",
            style:  TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        )
      ]).show();
}