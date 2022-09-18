import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage> {

  var textFieldController = TextEditingController();

   @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar-AlerDialog-PopUp')),
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(
              child :Text('SnackBarDefault'),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Hello'),),
                );
              }
            ), // SnackBar

            ElevatedButton(
              child :Text('SnackBarAction'),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text('Do you want to delete ?'),
                      action: SnackBarAction(
                        label: 'Yes',
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Deleted'),),
                        );
                      },
                    ),
                  ),
                );
              }
            ), // SnackBar

            ElevatedButton(
              child :Text('SnackBarSpecial'),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text(
                          'No Wifi Signal',
                          style: TextStyle(color: Colors.indigoAccent),
                      ),
                      backgroundColor: Colors.white,
                      action: SnackBarAction(
                        label: 'Try Again',
                        textColor: Colors.red,
                        onPressed: (){
                          print('Try Agained But None');
                        }
                   ),
                  )
                );
              }
            ), // SnackBar

            Spacer(),

            ElevatedButton(
              child : Text('Basic Alert Dialog'),
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Lesson Alert Dialog'),
                        content: Text('Lesson Instead'),
                        actions: [
                          TextButton(
                              child: Text('Cancel'),
                              onPressed: (){
                                Navigator.pop(context);},
                              ),
                          TextButton(
                            child: Text('OK'),
                            onPressed: (){
                                print('OK ITs Selected');
                                Navigator.pop(context);},
                        ),
                      ], // Actions
                    );
                  }
                );
              }
            ), // AlertDialog

            ElevatedButton(
              child : Text('Special Alert Dialog'),
              onPressed: (){
                   showDialog(
                       context: context,
                       builder: (BuildContext context){
                         return AlertDialog(
                           title: Text('Special Alert Dialog Main',style: TextStyle(color : Colors.white),),
                           content:SizedBox(
                             height: 80,
                             child: Column(
                               children: [
                                 TextField(
                                   controller: textFieldController,
                                   decoration: InputDecoration(
                                     labelText: 'WRITE DATA HERE'
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           backgroundColor: Colors.indigoAccent,
                           actions: [
                             TextButton(
                               child: Text('Cancel',style: TextStyle(color : Colors.white),),
                               onPressed: (){
                                 Navigator.pop(context);},
                             ),
                             TextButton(
                               child: Text('Read Data',style: TextStyle(color : Colors.white),),
                               onPressed: (){
                                 String readedData = textFieldController.text;
                                 print('OK ITs Data Readed : $readedData ');
                                 textFieldController.text = '';
                                 Navigator.pop(context);},
                       ),
                      ],
                    );
                  }
                );
              },
            ), // SpecialAlertDialog

            Spacer(),

            PopupMenuButton(
              child: Icon(Icons.open_in_new_rounded),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value : 1 ,
                  child : Text(
                      'Delete',
                    style: TextStyle (color: Colors.red))),
                PopupMenuItem(
                    value : 2 ,
                    child : Text(
                      'Edit',
                      style: TextStyle (color: Colors.indigoAccent)))],
              onCanceled: (){print('No Selected');},
              onSelected: (menuItemValue){
                if(menuItemValue == 1){print('Deleted Selected');}
                if(menuItemValue == 2){print('Editing Selected');}},
           ),

          ],
        ),
      ),
    );
  }
}
