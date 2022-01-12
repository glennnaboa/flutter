import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screens/post_page.dart';
void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(  
        body: const FirstRoute(),
        
      ),
    );
  }
}


                

 final List<String> _listItem = [
    'assets/desmond.jpg',
    'assets/altair.jpg',
    'assets/ezio.jpg',
    'assets/connor.jpg',
    'assets/edward.jpg',
  ];


class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       appBar: AppBar(
         elevation: 0,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
         leading: Icon(Icons.menu, color: Colors.white),
         centerTitle: true,
         title: Text("HOME", style: TextStyle(fontFamily: 'Assassin'),),
      ),
         backgroundColor: Color.fromARGB(255, 65, 64, 64),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/assassins-creed-logo.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                         colors: [
                           Colors.black.withOpacity(.4),
                             Colors.black.withOpacity(.1),
                         ]
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 30,),
                      ]),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Individuals", 
                      style: TextStyle( fontFamily:'Assassin',  fontSize: 25,  fontWeight: FontWeight.bold,   color: Colors.grey[100]) ),
                      SizedBox(height: 20,),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeItem(image: 'assets/desmond.jpg', title: 'Desmond Miles'),
                            makeItem(image: 'assets/altair.jpg', title: 'Altaïr Ibn-La Ahad'),
                            makeItem(image: 'assets/ezio.jpg', title: 'Ezio Auditore da Firenze'),
                            makeItem(image: 'assets/connor.jpg', title: 'Connor Kenway'),
                            makeItem(image: 'assets/edward.jpg', title: 'Edward Kenway')
                          ],
                        )
                      )
                    ]
                    ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Weapons", 
                      style: TextStyle( fontFamily:'Assassin',  fontSize: 25,  fontWeight: FontWeight.bold,   color: Colors.grey[100]) ),
                      SizedBox(height: 20,),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeItem(image: 'assets/spear-of-leonidas.jpg', title: 'Spear of Leonidas'),
                            makeItem(image: 'assets/assasins-tomahawk.jpg', title: 'Assassins Tomahawk'),
                            makeItem(image: 'assets/sword-of-altair.jpg', title: 'Sword Of Altair')
                          ],
                        )
                      )
                    ]
                    ),
                ),

                 Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Posts", 
                      style: TextStyle( fontFamily:'Assassin',  fontSize: 25,  fontWeight: FontWeight.bold,   color: Colors.grey[100]) ),
                      SizedBox(height: 20,),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeItem(image: 'assets/spear-of-leonidas.jpg', title: 'Spear of Leonidas'),
                            makeItem(image: 'assets/assasins-tomahawk.jpg', title: 'Assassins Tomahawk'),
                            makeItem(image: 'assets/sword-of-altair.jpg', title: 'Sword Of Altair')
                          ],
                        )
                      )
                    ]
                    ),
                ),

                Container(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                      Text("Photos", 
                      style: TextStyle( fontFamily:'Assassin',  fontSize: 25,  fontWeight: FontWeight.bold,   color: Colors.grey[100]) ),
                      SizedBox(height: 20,),
                      Container(
                         child:  GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          padding: EdgeInsets.all(20.0),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: _listItem.map((item) => Card(
                            child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover
                                  ),
                                ),
                            ),
                          )).toList()
                          )
                      )
                     ]
                  ),
                ),

                 Container(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                      Text("Photos", 
                      style: TextStyle( fontFamily:'Assassin',  fontSize: 25,  fontWeight: FontWeight.bold,   color: Colors.grey[100]) ),
                      SizedBox(height: 20,),
                      Center (
                         child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                            ),
                            child: const Text('Login'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const PostPage()),
                              );
                            },
                          ),
                      )
                     ]
                  ),
                ),

                ],
            ),
          ),
        ),
    );
  }

  Widget makeItem({image, title}){
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
            )
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Align(
            child: Text(title, style: TextStyle(color: Colors.white, fontFamily: 'Assassin', fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}




