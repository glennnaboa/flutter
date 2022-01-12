import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Post{
  final String title, url, thumbnailUrl;
  Post(this.title, this.url, this.thumbnailUrl);
}



class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);
  
  Future getPostData() async {
     var response = await http
     .get(Uri.https('jsonplaceholder.typicode.com', 'photos'));
     var jsonData = jsonDecode(response.body);
     List<Post> posts = [];

     for(var u in jsonData){
     Post post = Post(u["title"], u["url"],u["thumbnailUrl"]);
     posts.add(post);
     }

     print(posts.length);
     return posts;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: const Text("Photos"),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
          future: getPostData(),
          builder: (context, AsyncSnapshot snapshot) {
             return ListView.builder(
             itemCount: 10, 
             itemBuilder: (context, i){
               return RecipeCard(
                 title: (snapshot.data[i].title),
                 thumnailUrl: (snapshot.data[i].title)
               );
             });
           },
          ), 
        ),
      ),
    );
  }
  
}

