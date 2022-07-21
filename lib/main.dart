import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String selectedDocument = "ID";


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Presentation Card"), centerTitle: true,),
      body: SingleChildScrollView(
        child: Center(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 15.0),
                  const Image(image: NetworkImage('https://www.tidalhealthcare.com/wp-content/uploads/2017/07/default-user.png'),height: 100,width: 100,),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {
                      Navigator.pushNamed(context, "myRoute");
                      },
                    child: const Text("Select a photo",textScaleFactor: 1.3, style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),)),
                    const SizedBox(height: 30.0),
            
                    const Text("Name and last name", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      maxLength: 30,
                    ),
                    const Text("Profession or Role", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      maxLength: 30,
                    ),
                    const SizedBox(height: 15.0),
                    DropdownButtonFormField(
                      value: selectedDocument,
                      items: <String>["Type of document","ID", "Passport", "Driver's License"]
                    .map((documentType) => DropdownMenuItem<String>(child: Text(documentType), value: documentType,)).toList(),
                    onChanged: (documentType) =>setState(() => selectedDocument = documentType as String
                    )),
                    const SizedBox(height: 15.0),
                     const Text("Document code/number", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      maxLength: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      ElevatedButton(  
                      onPressed: (){},
                      child: Text("Erase fields", style: TextStyle(fontSize: 20, color: Colors.black),),
                      ),
                      ElevatedButton(  
                      onPressed: (){},
                      child: Text("Save info", style: TextStyle(fontSize: 20, color: Colors.black),),
                      )
                      ],
                    )
                  ],
                    ),)
              ),
            ),
        ),
      );
  }
}
