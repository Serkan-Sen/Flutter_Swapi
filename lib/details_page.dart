import 'package:flutter/material.dart';
import 'package:flutter_swapi/main.dart';
import 'package:flutter_swapi/service/api_service.dart';
import 'videoplayerwidget.dart';
import 'package:video_player/video_player.dart';

/*class DetailsPage extends StatefulWidget {
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
    return MaterialApp(
      home:SafeArea(
        child: Scaffold(
         
          body: Stack(
             children: <Widget>[
            
             ],
          ),
        ),
      ),
    );
  }
}*/
class BackgroundVideo extends StatefulWidget {
  BackgroundVideo({Key? key, required this.character, required this.index})
      : super(key: key);
  int index;
  var character;

  
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  var planetInfo;
  
  late VideoPlayerController _controller;

  
  @override
  void initState() {

    super.initState();
    
    ApisService.planetInfo("${widget.character["homeworld"]}")
        .then((value) => {planetInfo = value, setState(() {})});
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("asset/star_wars_themed_light_speed_effect_blender_loop_animation.mp4");
      _controller.initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black45,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 22, 35, 211),
            leading: BackButton(
              onPressed: (
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()));
              ),
            ),
            title: Text(
              "${widget.character["name"]}",
              style: TextStyle(color: Color.fromARGB(255, 209, 4, 4)),
            ),
            actions: [],
          ),
          body: Stack(
            children: <Widget>[
              // TODO 7: Add a SizedBox to contain our video.
              SizedBox.expand(
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
             Center(
          child: planetInfo != null
              ? Column(
                  children: [
                    widget.index >= 16
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
            ],
          ),
        ),
      ),
    );
  }

  // TODO 8: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// A basic login widget with a logo and a form with rounded corners.
