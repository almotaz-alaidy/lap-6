import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List titleA = ["marceds", "bmw", "lixus", "audi"];
  List imagesA = [
    Image(
      image: AssetImage("images/marceds.jpg"),
    ),
    Image(
      image: AssetImage("images/bmw.jpg"),
    ),
    Image(
      image: AssetImage("images/lixus.jpg"),
    ),
    Image(
      image: AssetImage("images/audi.jpg"),
    ),
  ];

  List oldPrice = ["60000\$", "50000\$", "4000\$", "3000\$"];
  List newPrice = ["50000\$", "40000\$", "30000\$", "2000\$"];

  bool visabilityA = false;
  bool visabilityB = false;
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        drawer: Drawer(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.grey, Colors.blueGrey]),
          ),
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int x) {
              return Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        visabilityA = true;
                      });
                    },
                    icon: Icon(Icons.add),
                    label: Text("add to cart"),
                  ),
                  Visibility(
                    visible: visabilityA,
                    child: Container(
                      child: Text("added to cart"),
                    ),
                  ),
                  Visibility(
                    visible: visabilityB,
                    child: Container(
                      child: Text("added to favorate"),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Divider(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(titleA[x]),
                    leading: imagesA[x],
                    minLeadingWidth: 100,
                    trailing: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          visabilityB = true;
                        });
                      },
                      icon: Icon(Icons.favorite),
                      label: Text(""),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          oldPrice[x],
                          style: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(newPrice[x]),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
