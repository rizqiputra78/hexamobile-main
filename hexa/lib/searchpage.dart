import 'package:anim_list/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaaterialApp',
      home: Search(),
    );
  }
}

class Search extends StatefulWidget {
  const Search ({Key? key}) : super (key : key );
  @override
  _SearchState createState () => _SearchState();
}

class _SearchState extends State<Search> {
  Icon CustomIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Cari parfume');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                if (CustomIcon.icon == Icons.search) {
                  CustomIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                    leading : Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan Nama parfum...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  CustomIcon = const Icon(Icons.search);
                  customSearchBar = const Text ('Cari parfum');
                }
              });
            },
            icon: const Icon(Icons.search),
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('klik Icon Search untuk mencari parfum'),
          ),
        ],
      ),
    );
  }
}
