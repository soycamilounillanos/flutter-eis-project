import 'package:flutter/material.dart';
import 'package:my_doggy/model/Post.model.dart';
import 'package:my_doggy/pages/profile.page.dart';
import 'package:my_doggy/provider/MyDoggy.provider.dart';
import 'package:intl/intl.dart';

import 'profile.page.dart';
import './../model/UserProfile.model.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;
  int _page = 0;

  final MyDoggy myDoggyProvider = MyDoggy();
  late Future<List<Post>> listaPost;

  @override
  void initState() {
    //listaPost = myDoggyProvider.getPostsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController
      ..addListener(() {
        var triggerFetchMoreSize =
            0.9 * _scrollController.position.maxScrollExtent;

        if (_scrollController.position.pixels > triggerFetchMoreSize) {
          _pagination();
        }
      });

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("My doggy")),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return FutureBuilder(
        future: postList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData || _isLoading) {
            List<Widget> list = [];

            snapshot.data.forEach((item) => list.add(_box(context, item)));

            return ListView(
              controller: _scrollController,
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
          userId: item.owner.id,
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
            ),
          )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _navegateProfile(
              context: context,
              userId: item.owner.id,
              widget:Text(
                item.owner.firstName + " " + item.owner.lastName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ) 
            ),
            Text(item.publishDate, style: TextStyle(color: Color(0xff9C9C9C))),
          ],
        ),
      ],
    );
  }

  Future<List<Post>> postList() async {
    print(" se llama de nuevo");

    listaPost = myDoggyProvider.getPostsList(page: _page);
    setState(() {
      _isLoading = false;
      _page += 1;
      //add api for laod the more data according to new page
    });
    return listaPost;
  }

  _pagination() {
    setState(() {
      _isLoading = true;
      //add api for laod the more data according to new page
    });
    print(_isLoading);
    print(_page);
  }

//DateFormat("dd-MM-yyyy").format(item.publishDate)
  _navegateProfile(
      {required BuildContext context,
      required Widget widget,
      required String userId}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage(userId: userId)));
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
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Text(text));
  }
}
