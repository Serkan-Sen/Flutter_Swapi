import 'package:flutter/material.dart';
import 'package:flutter_swapi/details_page.dart';
import 'package:flutter_swapi/service/api_service.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const MyHomePage(title: 'May The Force Be With You'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> listCharacters = [];
  var pageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApisService.allCharacters("?page=${pageNumber}").then(
      (value) => {
        if (value != null)
          {
            pageNumber += 1,
            for (var item in value)
              {
                listCharacters.add(item),
                setState(() {}),
              },
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 35, 211),
        title: Text(
          widget.title,
          style: TextStyle(color: Color(0xFFFFC500),fontSize: 18.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (pageNumber <= 9) {
                ApisService.allCharacters("?page=${pageNumber}").then(
                  (value) => {
                    if (value != null)
                      {
                        pageNumber += 1,
                        setState(() {}),
                        for (var item in value)
                          {
                            listCharacters.add(item),
                          },
                      }
                  },
                );
              } else {
                const snackBar = SnackBar(
                  content: Text('No more StarWars characters to load!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: 
        ListView.builder(
        
          itemCount: listCharacters.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: index >= 16
                  ? Image.network(
                      "https://starwars-visualguide.com/assets/img/characters/${index + 2}.jpg")
                  : Image.network(
                      "https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg"),
              trailing: TextButton(
                onPressed: () => {
                  // print("Button pressed: ${listCharacters[index]}"),
                  // print("Button pressed: $index"),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BackgroundVideo(
                        character: listCharacters[index],
                        index: index,
                      ),
                    ),
                  ),
                },
                child: const Text(
                  "Details",
                  style: TextStyle(color: Color(0xff4C9BE5), fontSize: 15),
                ),
              ),
              title: Text(
                "${listCharacters[index]["name"]}",
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
    );
  }
}
