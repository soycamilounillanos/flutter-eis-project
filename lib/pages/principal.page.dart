import 'package:flutter/material.dart';
import 'package:my_doggy/model/Post.model.dart';
import 'package:my_doggy/pages/profile.page.dart';
import 'package:my_doggy/provider/MyDoggy.provider.dart';

import 'profile.page.dart';
import './../model/UserProfile.model.dart';
class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
  }

 

class _PrincipalPageState extends State<PrincipalPage> {

  
  final MyDoggy myDoggyProvider = MyDoggy();
  Future<List<Post>>? listaPost;

   @override
  void initState() {
    listaPost = myDoggyProvider.getPostsList();
    super.initState();

  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My doggy")),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return FutureBuilder(
      future: listaPost,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData){

          List<Widget> list = [];

          snapshot.data.forEach( (item) => list.add(_box(context)));
          
          print(list.length);
          return ListView(
            children: list,
          );
        } else
          return Text("No hay datos");
      }
    );
  }

  Widget _box(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xff707070)),
      ),
      child: Column(
        children: [
          _informacionPerfil(context),
          _descripcionPost(),
          _imagenPost(),
          _infoLikePost(),
        ],
      ),
    );
  }

  _imagenPost() {
    return FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        image: NetworkImage(
            "https://img.dummyapi.io/photo-1564694202779-bc908c327862.jpg"));
  }

  _descripcionPost() {
    return Container(
        margin: EdgeInsets.all(5.0),
        child: Text(
            "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."));
  }

  _informacionPerfil(BuildContext context) {
    return Row(
      children: [
        _navegateProfile(
          context: context,
          widget: Container(
            margin: EdgeInsets.all(5.0),
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: NetworkImage(
                    'https://randomuser.me/api/portraits/med/women/28.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cuero Designer",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("04:00 P.M", style: TextStyle(color: Color(0xff9C9C9C))),
          ],
        ),
      ],
    );
  }

  _navegateProfile({required BuildContext context, required Widget widget}) {
    return GestureDetector(
        onTap: () {
          var userProfile = UserProfile(id: "60d0fe4f5311236168a109ca",
            title: "ms",
            firstName: "Sara",
            lastName: "Andersen",
            picture: "https://randomuser.me/api/portraits/women/58.jpg",
            gender: "female",
            email: "sara.andersen@example.com",
            dateOfBirth: "1996-04-30T19:26:49.610Z",
            phone: "92694011",
            registerDate: "2021-06-21T21:02:07.374Z",
            updatedDate: "2021-06-21T21:02:07.374Z",
            location: Location(
                street: "9614, SÃ¸ndermarksvej",
                city: "Kongsvinger",
                state: "Nordjylland",
                country: "Denmark",
                timezone: "-9:00"
            )
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage(userProfile: userProfile)));
        },
        child: widget);
  }

  _infoLikePost() {
    return Container(
        margin: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 25,
                ),
                Text(
                  "5",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            _tagsList(),
            _tagsList(),
            _tagsList(),
          ],
        ));
  }

  _tagsList() {
    return Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
              ),
        ),
        child: Text("Hola"));
  }



}