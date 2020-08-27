import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:admu_recweek_app/models/orgs.dart';

// ignore: must_be_immutable
class ListScreen extends StatefulWidget {
  final TextEditingController searchController;
  final ScrollController scrollController;
  final List<Orgs> orgList;
  final List<String> strList;
  final List<Widget> normalList;
  final FirebaseUser user;

  ListScreen(this.searchController, this.scrollController, this.user,
      this.orgList, this.strList, this.normalList);

  @override
  _ListScreenState createState() => _ListScreenState(
      searchController, scrollController, user, orgList, strList, normalList);
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController searchController;
  ScrollController scrollController;
  FirebaseUser user;
  List<Orgs> orgList;
  List<String> strList;
  List<Widget> normalList;
  String sortStatus = 'Alphabetical';

  _ListScreenState(this.searchController, this.scrollController, this.user,
      this.orgList, this.strList, this.normalList);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
        return 90;
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
                  // InkWell(
                  //     onTap: () {
                  //       showMaterialModalBottomSheet(
                  //         context: context,
                  //         builder: (context, scrollController) =>
                  //             _sortModal(context, scrollController),
                  //       );
                  //     },
                  //     child: Text(
                  //       "Sort",
                  //       style: TextStyle(
                  //           color: const Color(0xff295EFF), fontSize: 16),
                  //     ))
                ],
              ))
        ], icon: Icon(Icons.sort_by_alpha), indexedHeaderHeight: (index) => 90),
      ],
    );
  }

  // Widget _sortModal(BuildContext context, scrollController) {
  //   return Material(
  //       child: SafeArea(
  //     top: false,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         ListTile(
  //           title: Text(
  //             'Alphabetical',
  //             style: TextStyle(
  //                 color: const Color(0xff295EFF),
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16),
  //           ),
  //           leading: SizedBox(
  //             child: Image.asset('assets/icons/alphabetical.png'),
  //             height: 40,
  //             width: 40,
  //           ),
  //           onTap: () {
  //             setState(() {
  //               sortStatus = 'Alphabetical';
  //             });
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //         ListTile(
  //           title: Text(
  //             'Org Bodies',
  //             style: TextStyle(
  //                 color: const Color(0xff295EFF),
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16),
  //           ),
  //           leading: SizedBox(
  //             child: Image.asset('assets/icons/org-bodies.png'),
  //             height: 40,
  //             width: 40,
  //           ),
  //           onTap: () {
  //             setState(() {
  //               sortStatus = 'Org Bodies';
  //             });
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     ),
  //   ));
  // }
}
