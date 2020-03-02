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
  String dersAdi;
  int dersKredi = 1;
  double dersHarfDegeri = 4;
  List<Ders> tumDersler;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    tumDersler = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
            }
          },
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
          Container(
            padding: EdgeInsets.all(8),
            child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Ders adını giriniz",
                        labelText: "Ders adı",
                        labelStyle: TextStyle(fontSize: 22),
                        hintStyle: TextStyle(fontSize: 22),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (gelenDeger) {
                        if (gelenDeger.length > 6) {
                          return null;
                        } else {
                          return "Ders Giriniz!";
                        }
                      },
                      onSaved: (i) {
                        dersAdi = i;
                        setState(() {
                          tumDersler
                              .add(Ders(dersAdi, dersHarfDegeri, dersKredi));
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                                items: dersKredileriItems(),
                                value: dersKredi,
                                onChanged: (secilenKredi) {
                                  setState(() {
                                    dersKredi = secilenKredi;
                                  });
                                }),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<double>(
                                items: dersHarfDegerleriItems(),
                                value: dersHarfDegeri,
                                onChanged: (secilenHarf) {
                                  setState(() {
                                    dersHarfDegeri = secilenHarf;
                                  });
                                }),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.blue,
                      height: 40,
                      indent: 2,
                    )
                  ],
                )),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
              itemBuilder: _listeElemanlariOlustur,
              itemCount: tumDersler.length,
            ),
          ))
        ],
      ),
    );
  }

  dersKredileriItems() {
    List<DropdownMenuItem<int>> krediler = [];

    for (var i = 1; i <= 10; i++) {
      krediler.add(DropdownMenuItem<int>(
        value: i,
        child: Text(
          "$i Kredi",
          style: TextStyle(fontSize: 30),
        ),
      ));
    }

    return krediler;
  }

  dersHarfDegerleriItems() {
    List<DropdownMenuItem<double>> harfler = [];

    harfler.add(DropdownMenuItem(
      child: Text("AA", style: TextStyle(fontSize: 30)),
      value: 4,
    ));
    harfler.add(DropdownMenuItem(
      child: Text("BA", style: TextStyle(fontSize: 30)),
      value: 3.5,
    ));
    harfler.add(DropdownMenuItem(
      child: Text("BB", style: TextStyle(fontSize: 30)),
      value: 3,
    ));
    harfler.add(DropdownMenuItem(
      child: Text("CB", style: TextStyle(fontSize: 30)),
      value: 2.5,
    ));
    harfler.add(DropdownMenuItem(
      child: Text("CC", style: TextStyle(fontSize: 30)),
      value: 2,
    ));
    harfler.add(DropdownMenuItem(
      child: Text("DC", style: TextStyle(fontSize: 30)),
      value: 1.5,
    ));
    harfler.add(DropdownMenuItem(
      child: Text("DD", style: TextStyle(fontSize: 30)),
      value: 1,
    ));
    harfler.add(DropdownMenuItem(
      child: Text("FF", style: TextStyle(fontSize: 30)),
      value: 0,
    ));

    return harfler;
  }

  Widget _listeElemanlariOlustur(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(tumDersler[index].ad),
        subtitle: Text(tumDersler[index].kredi.toString() +
            " kredi Ders Nor Değeri " +
            tumDersler[index].harfDegeri.toString()),
      ),
    );
  }
}

class Ders {
  String ad;
  double harfDegeri;
  int kredi;

  Ders(this.ad, this.harfDegeri, this.kredi);
}
