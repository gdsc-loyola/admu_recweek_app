import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
// import 'package:faker/faker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:admu_recweek_app/models/org.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:admu_recweek_app/models/user.dart';
import 'package:admu_recweek_app/models/lions.dart';

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
  List<LIONS> lionsList = [];
  List<String> strList = [];
  List<Widget> normalList = [];
  String sortStatus = 'Alphabetical';

  // @override
  // void initState() {
  //   for (var i = 0; i < 100; i++) {
  //     var name = faker.person.name();
  //     userList.add(User(name, faker.company.name(), false));
  //   }
  //   userList
  //       .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  //   filterList();
  //   widget.searchController.addListener(() {
  //     filterList();
  //   });
  //   super.initState();
  // }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });
    super.initState();
  }

  loadJson() async {
    var jsonResult;

    // Getting the file path of the JSON and Decoding the file into String
    String data = await rootBundle.loadString('assets/data/lions.json');
    jsonResult = json.decode(data.toString());

    // OUTPUT : [{name: Jan Salvador Sebastian, company: mclinica}, {name: Harvey sison, company: ateneo}, {name: Juan Dela Cruz, company: null universty}]
    print(jsonResult);

    // We created a loop for adding the `name` and `company` to the USER class
    for (int i = 0; i < jsonResult.length; i++) {
      lionsList.add(LIONS(
          jsonResult[i]['Representative'],
          jsonResult[i]['Organization'],
          jsonResult[i]['Org Logo (PNG)'],
          jsonResult[i]['Description'],
          jsonResult[i]['Advocacy'],
          jsonResult[i]['Vision'],
          jsonResult[i]['Mission'],
          jsonResult[i]['Application Process'],
          jsonResult[i]['Featured'],
          jsonResult[i]['Photos for each event'],
          jsonResult[i]['Tagline'],
          jsonResult[i]['Org Photo'],
          jsonResult[i]['Benefits'],
          jsonResult[i]['Flagships'],
          jsonResult[i]['Departments'],
          jsonResult[i]['Facebook'],
          jsonResult[i]['SocMed Handles']));
    }

    // Sorting Area
    lionsList.sort((x, y) =>
        x.organization.toLowerCase().compareTo(y.organization.toLowerCase()));

    // Called the Filter
    filter();
  }

  // filterList() {
  //   List<User> users = [];
  //   users.addAll(userList);
  //   normalList = [];
  //   strList = [];
  //   if (widget.searchController.text.isNotEmpty) {
  //     users.retainWhere((user) => user.name
  //         .toLowerCase()
  //         .contains(widget.searchController.text.toLowerCase()));
  //   }
  //   users.forEach((user) {
  //     normalList.add(
  //       Slidable(
  //         actionPane: SlidableDrawerActionPane(),
  //         actionExtentRatio: 0.25,
  //         secondaryActions: imageUrl == ""
  //             ? null
  //             : <Widget>[
  //                 IconSlideAction(
  //                     iconWidget: Image.asset('assets/icons/list_bookmark.png'),
  //                     onTap: () {
  //                       Fluttertoast.showToast(
  //                           msg: "You have bookmarked this organization",
  //                           toastLength: Toast.LENGTH_SHORT,
  //                           gravity: ToastGravity.BOTTOM,
  //                           timeInSecForIosWeb: 1,
  //                           backgroundColor: Colors.grey,
  //                           textColor: Colors.white,
  //                           fontSize: 16.0);
  //                     },
  //                     color: const Color(0xff7598FF))
  //               ],
  //         child: ListTile(
  //           leading: CircleAvatar(
  //             backgroundImage:
  //                 NetworkImage("http://placeimg.com/200/200/people"),
  //           ),
  //           title: Text(user.name),
  //           subtitle: Text(user.company),
  //         ),
  //       ),
  //     );
  //     strList.add(user.name);
  //   });

  //   setState(() {
  //     strList;
  //     normalList;
  //     strList;
  //   });
  // }

  filter() {
    List<LIONS> orgs = [];
    normalList = [];

    // We added all the userList to the users. for the passing/getting the specific value.
    orgs.addAll(lionsList);

    // Loop
    orgs.forEach((org) {
      // Since, normalList is an WidgetArray = []
      // Here is the adding of Widget that depends on the lenght of the Array in  `users`
      normalList.add(
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: imageUrl == ""
              ? null
              : <Widget>[
                  IconSlideAction(
                      iconWidget: Image.asset('assets/icons/list_bookmark.png'),
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "You have bookmarked this organization",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      color: const Color(0xff7598FF))
                ],
          child: ListTile(
            leading: SizedBox(child: Image.asset('assets/orgs/dsc/logo.png')),
            title: Text(org.organization),
            subtitle: Text("LIONS"),
          ),
        ),
      );
      strList.add(org.organization);
      print(strList);
    });

    // SetState to change the Value every time is triggers
    setState(() {
      normalList;
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
