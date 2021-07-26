import 'package:flutter/material.dart';
import 'package:searchbar_demo/testpage.dart';
import 'package:searchbar_demo/testpage2.dart';

const searchList = [
  '001_瓶子1',
  '002_瓶子2',
  '003_瓶子3',
  '004_瓶子4',
];

const recentSuggest = [
  '001_瓶子1',
  '002_瓶子2',
  '003_瓶子3',
  '004_瓶子4',
];

class SearchBarDemo extends StatefulWidget {
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchBarDemo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchBarDelegate(),
              );
            },
          )
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  //清空按钮
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = "", //搜索值为空
      )
    ];
  }

  //返回上级按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, query) //点击时关闭整个搜索页面
        );
  }

  //搜到到内容后的展现
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  void showResults(BuildContext context) {
    switch (query) {
      case "001_瓶子1":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Test2(),
          ),
        );
        break;
    }
    super.showResults(context);
  }

  //设置推荐
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionsList.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          text: TextSpan(
              text: suggestionsList[index].substring(query.length),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionsList[index].substring(query.length),
                    style: const TextStyle(color: Colors.grey))
              ]),
        ),
        onTap: () {
          query = suggestionsList[index];
          // query =  suggestionsList[index].toString();
          showResults(context);
          close(context, query);
          print(query);

          switch (query) {
            case "001_瓶子1":
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Test2(),
                ),
              );
              break;
            case "002_瓶子2":
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Test(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

// class Test extends StatelessWidget {
//   Test({required Key key, required this.title}) : super(key: key);
//   String title = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//     );
//   }
// }

class PlasticCap {
  final int id;
  final String model;
  final String type;

  PlasticCap({required this.id, required this.model, required this.type});
}

// 這個posts 是一個List的數據類型
final List<PlasticCap> caps = [
  PlasticCap(
    id: 0,
    model: "1810 BC蓋",
    type: "冷充",
  ),
  PlasticCap(
    id: 1,
    model: "1810 BPSJ蓋",
    type: "冷充",
  ),
];
