import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       color: Colors.white,
  //       child: Center(
  //         child: TextButton(
  //           onPressed: () {},
  //           child: const Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: Text(
  //               "Bienvenido",
  //               style: TextStyle(fontSize: 20, color: Colors.white),
  //             ),
  //           ),
  //           style: TextButton.styleFrom(
  //               backgroundColor: const Color(0xff3AAAFE),
  //               shape: const StadiumBorder()),
  //         ),
  //       ));
  // }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title:  Center(child: Text("My doggy")),        
      ),
      body: _body(),
    );

  }


  _body(){
    return Container(           
      padding: EdgeInsets.all(5.0),
      color: Colors.white,
      child:Column(
        children: [
          _informacionPerfil(),
          _descripcionPost(),
          _imagenPost(),
          Text("5"),




        ],
      ),

    );

  }


  _imagenPost(){
    return Expanded(child: Container(
             margin: EdgeInsets.all(5.0),
             decoration: BoxDecoration(
               color: const Color(0xff7c94b6),
               image: DecorationImage(
                 image: NetworkImage('https://img.dummyapi.io/photo-1564694202779-bc908c327862.jpg'),
                 fit: BoxFit.cover,
               ),
             ),
           )
    );
  }

  _descripcionPost(){
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Text("is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")

    );
  }



  _informacionPerfil(){
    return Row(
      children: [
        Container(
             margin: EdgeInsets.all(5.0),
             width: 50.0,
             height: 50.0,
             decoration: BoxDecoration(
               color: const Color(0xff7c94b6),
               image: DecorationImage(
                 image: NetworkImage('https://randomuser.me/api/portraits/med/women/28.jpg'),
                 fit: BoxFit.cover,
               ),
               borderRadius: BorderRadius.all( Radius.circular(50.0)),
               border: Border.all(
                 color: Colors.grey,
                 width: 1.0,
               ),
             ),
           ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cuero Designer",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("04:00 P.M", style: TextStyle( color: Color(0xff9C9C9C)))
          ],

        ),

      ],      
    ); 




    

  }
}