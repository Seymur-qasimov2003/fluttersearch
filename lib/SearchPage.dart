import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  List<String> Dostlar = ['Seymur', 'mefi', 'eldar', 'esqo'];
  var items = List<String>.empty(growable: true);
  void initState() {
    items.addAll(Dostlar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Search for a movie',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  child: Icon(Icons.delete_forever_rounded),
                  onTap: () {
                    _controller.clear();
                  },
                ),
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Search',
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: Dostlar.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: InkWell(
                  child: Icon(Icons.delete),
                  onTap: () {
                    setState(() {
                      Dostlar.removeAt(index);
                    });
                  },
                ),
                leading: const Icon(Icons.person),
                title: Text(Dostlar[index]),
              );
            },
          )
        ],
      ),
    );
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(Dostlar);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(Dostlar);
      });
    }
  }
}
