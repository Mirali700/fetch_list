

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fetch_list/services/get_from_api.dart';
import 'package:flutter/material.dart';

import 'models/comments_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   late List<Comments> comments;
   @override
  void initState() {
    super.initState();
  
    comments = [];
  }

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            CarouselSlider.builder(
              itemCount: comments.length,
              itemBuilder: (context, index, realIndex) {
                return Card(
                  child: ListTile(
                    title: Image.network(comments[index].url),
                    subtitle: Column(
                      children: [Text(
                      comments[index].title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Image.network(comments[index].thumbnailUrl),
                    ],
                    ),
                    trailing: Text(comments[index].albumId.toString()),
                    leading: Text(comments[index].id.toString()),
                  ),
                );
              },
              options: CarouselOptions(
                height: 400.0, // Adjust this as per your requirement

                enlargeCenterPage: true,
                aspectRatio: 16 / 9,

                viewportFraction: 0.8,
              ),
            )
          ],
        ),
        floatingActionButton: IconButton(
            onPressed: () async {
              comments = await getComments();
              setState(() {});
            },
            icon: const Icon(Icons.add)),
      ),
    );
  }
}