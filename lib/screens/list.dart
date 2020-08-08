import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:faker/faker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:admu_recweek_app/models/org.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// ignore: must_be_immutable
class ListScreen extends StatefulWidget {
  TextEditingController searchController;
  ScrollController scrollController;

  ListScreen(_searchController, _scrollController) {
    searchController = _searchController;
    scrollController = _scrollController;
  }

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<User> userList = [];
  List<String> strList = [];
  List<Widget> normalList = [];
  String sortStatus = 'Alphabetical';

  @override
  void initState() {
    for (var i = 0; i < 100; i++) {
      var name = faker.person.name();
      userList.add(User(name, faker.company.name(), false));
    }
    userList
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    filterList();
    widget.searchController.addListener(() {
      filterList();
    });
    super.initState();
  }

  filterList() {
    List<User> users = [];
    users.addAll(userList);
    normalList = [];
    strList = [];
    if (widget.searchController.text.isNotEmpty) {
      users.retainWhere((user) => user.name
          .toLowerCase()
          .contains(widget.searchController.text.toLowerCase()));
    }
    users.forEach((user) {
      if (user.favourite) {
        favouriteList.add(
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              IconSlideAction(
                iconWidget: Icon(Icons.star),
                onTap: () {},
              ),
              IconSlideAction(
                iconWidget: Icon(Icons.more_horiz),
                onTap: () {},
              ),
            ],
            child: ListTile(
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage("http://placeimg.com/200/200/people"),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow[100],
                        ),
                      ))
                ],
              ),
              title: Text(user.name),
              subtitle: Text(user.company),
            ),
          ),
        );
      } else {
        normalList.add(
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              IconSlideAction(
                iconWidget: Icon(Icons.star),
                onTap: () {},
              ),
              IconSlideAction(
                iconWidget: Icon(Icons.more_horiz),
                onTap: () {},
              ),
            ],
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage("http://placeimg.com/200/200/people"),
              ),
              title: Text(user.name),
              subtitle: Text(user.company),
            ),
            title: Text(user.name),
            subtitle: Text(user.company),
          ),
        ),
      );
      strList.add(user.name);
    });

    setState(() {
      strList;
      normalList;
      strList;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentStr = "";
    return AlphabetListScrollView(
      strList: strList,
      highlightTextStyle: TextStyle(
        color: const Color(0xff295EFF),
      ),
      showPreview: true,
      itemBuilder: (context, index) {
        return normalList[index];
      },
      indexedHeight: (i) {
        return 80;
      },
      keyboardUsage: true,
      headerWidgetList: <AlphabetScrollListHeader>[
        AlphabetScrollListHeader(widgetList: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(sortStatus,
                      style: TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  InkWell(
                      onTap: () {
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context, scrollController) =>
                              _sortModal(context, scrollController),
                        );
                      },
                      child: Text(
                        "Sort",
                        style: TextStyle(
                            color: const Color(0xff295EFF), fontSize: 16),
                      ))
                ],
              ))
        ], icon: Icon(Icons.sort_by_alpha), indexedHeaderHeight: (index) => 80),
      ],
    );
  }

  Widget _sortModal(BuildContext context, scrollController) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              'Alphabetical',
              style: TextStyle(
                  color: const Color(0xff295EFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            leading: SizedBox(
              child: Image.asset('assets/icons/alphabetical.png'),
              height: 40,
              width: 40,
            ),
            onTap: () {
              setState(() {
                sortStatus = 'Alphabetical';
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'Org Bodies',
              style: TextStyle(
                  color: const Color(0xff295EFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            leading: SizedBox(
              child: Image.asset('assets/icons/org-bodies.png'),
              height: 40,
              width: 40,
            ),
            onTap: () {
              setState(() {
                sortStatus = 'Org Bodies';
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    ));
  }
}
