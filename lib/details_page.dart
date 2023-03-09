import 'package:flutter/material.dart';
import 'package:flutter_swapi/service/api_service.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.character, required this.index})
      : super(key: key);
  int index;
  var character;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var planetInfo;
  var filmsInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApisService.planetInfo("${widget.character["homeworld"]}")
        .then((value) => {planetInfo = value, setState(() {})});
        
    ApisService.filmsInfo("${widget.character["films"]}")
        .then((value) => {filmsInfo = value, setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 35, 211),
        title: Text(
          "${widget.character["name"]}",
          style: TextStyle(color: Color.fromARGB(255, 209, 4, 4)),
        ),
        actions: [],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:NetworkImage(
              'https://img.freepik.com/free-photo/3d-hyperspace-background-with-warp-tunnel-effect_1048-12526.jpg?w=996&t=st=1678099082~exp=1678099682~hmac=a3875c5a26abe84d17ba672804f275c30027dc147fd70d6af357f622d05c002a'
              ),
              fit:BoxFit.cover
              ),
              ),
        child: Center(
          child: planetInfo != null
              ? Column(
                  children: [
                    widget.index >= 17
                        ? Image.network(
                            "https://starwars-visualguide.com/assets/img/characters/${widget.index + 2}.jpg",
                            width: MediaQuery.of(context).size.width / 2,
                          )
                        : Image.network(
                            "https://starwars-visualguide.com/assets/img/characters/${widget.index + 1}.jpg",
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Name:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character["name"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Gender:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character["gender"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Birth Year:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character["birth_year"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Height:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character["height"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Weight:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character["mass"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Hair:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character["hair_color"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Skin:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character["skin_color"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Eyes:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${widget.character["eye_color"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Planet:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${planetInfo["name"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
