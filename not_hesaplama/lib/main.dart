import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Ortalama Hesaplama"),
        ),
        body: uygulamaGovdesi());
  }

  uygulamaGovdesi() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
            color: Colors.red,
            child: Form(
                child: Column(
              children: <Widget>[
                TextFormField(
                  
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Ders adını giriniz",
                      labelText: "Ders adı"),
                      validator: (gelenDeger){
                        if (gelenDeger.length>0) {
                          return null;
                        }
                        else{
                          return "Ders Giriniz!";
                        }
                      },
                )
              ],
            )),
          )),
          Expanded(
              child: Container(
            color: Colors.orange,
            child: Text("Dinamik"),
          ))
        ],
      ),
    );
  }
}
