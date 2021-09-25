import 'package:flutter/material.dart';
import 'package:my_doggy/model/Post.model.dart';
import 'package:my_doggy/pages/profile.page.dart';
import 'package:my_doggy/provider/MyDoggy.provider.dart';
import 'package:intl/intl.dart';

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
          if (snapshot.hasData) {
            List<Widget> list = [];

            snapshot.data.forEach((item) => list.add(_box(context, item)));
            return ListView(
              children: list,
            );
          } else
            return Center(child: CircularProgressIndicator());
        });
  }

  Widget _box(BuildContext context, Post item) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xff707070)),
      ),
      child: Column(
        children: [
          _informacionPerfil(context, item),
          _descripcionPost(item),
          _imagenPost(item),
          _infoLikePost(item),
        ],
      ),
    );
  }

  _imagenPost(Post item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(item.image)),
    );
  }

  _descripcionPost(Post item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(item.text)],
    );
  }

  _informacionPerfil(BuildContext context, Post item) {
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
                image: NetworkImage(item.owner.picture),
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
              item.owner.firstName + " " + item.owner.lastName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(item.publishDate, style: TextStyle(color: Color(0xff9C9C9C))),
          ],
        ),
      ],
    );
  }

//DateFormat("dd-MM-yyyy").format(item.publishDate)
  _navegateProfile({required BuildContext context, required Widget widget}) {
    return GestureDetector(
        onTap: () {
          var userProfile = UserProfile(
              id: "60d0fe4f5311236168a109ca",
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
                  timezone: "-9:00"));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage(userProfile: userProfile)));
        },
        child: widget);
  }

  _infoLikePost(Post item) {
    List<Widget> listTags = [];
    for (var tag in item.tags) {
      listTags.add(_tagsList(tag.toString()));
    }

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
                  "${item.likes}",
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
            ...listTags
          ],
        ));
  }

  Widget _tagsList(text) {
    return Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
              ),
        ),
        child: Text(text));
  }
}
