import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:admu_recweek_app/models/user.dart';
import 'package:admu_recweek_app/models/lions.dart';
import 'package:admu_recweek_app/models/coa.dart';

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
  List<COA> coaList = [];
  List<String> strList = [];
  List<Widget> normalList = [];
  String sortStatus = 'Alphabetical';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await loadLIONS();
      // await loadCOA();
      await loadJSON();
    });
    super.initState();
  }

  loadJSON() async {
    var lionsResult;
    var coaResult;
    // Getting the file path of the JSON and Decoding the file into String
    String lions = await rootBundle.loadString('assets/data/lions.json');
    String coa = await rootBundle.loadString('assets/data/coa.json');
    lionsResult = json.decode(lions.toString());
    coaResult = json.decode(coa.toString());
    // OUTPUT : [{name: Jan Salvador Sebastian, company: mclinica}, {name: Harvey sison, company: ateneo}, {name: Juan Dela Cruz, company: null universty}]
    // print(jsonResult);
    // We created a loop for adding the `name` and `company` to the USER class
    for (int i = 0; i < lionsResult.length; i++) {
      lionsList.add(LIONS(
          lionsResult[i]['Representative'],
          lionsResult[i]['Organization'],
          lionsResult[i]['Org Logo (PNG)'],
          lionsResult[i]['Description'],
          lionsResult[i]['Advocacy'],
          lionsResult[i]['Vision'],
          lionsResult[i]['Mission'],
          lionsResult[i]['Application Process'],
          lionsResult[i]['Featured'],
          lionsResult[i]['Photos for each event'],
          lionsResult[i]['Tagline'],
          lionsResult[i]['Org Photo'],
          lionsResult[i]['Benefits'],
          lionsResult[i]['Flagships'],
          lionsResult[i]['Departments'],
          lionsResult[i]['Facebook'],
          lionsResult[i]['SocMed Handles']));
    }
    // Sorting Area
    lionsList.sort((x, y) =>
        x.organization.toLowerCase().compareTo(y.organization.toLowerCase()));

    for (int i = 0; i < coaResult.length; i++) {
      coaList.add(COA(
          coaResult[i]['Rep Email'],
          coaResult[i]['Representative'],
          coaResult[i]['Institution'],
          coaResult[i]['Cluster'],
          coaResult[i]['Name'],
          coaResult[i]['Abbreviation'],
          coaResult[i]['Tagline'],
          coaResult[i]['Org E-mail'],
          coaResult[i]['Website'],
          coaResult[i]['Facebook'],
          coaResult[i]['Twitter'],
          coaResult[i]['Instagram'],
          coaResult[i]['Write-up about the Organization'],
          coaResult[i]['Advocacy'],
          coaResult[i]['Core Competencies'],
          coaResult[i]['Awards & Recognitions'],
          coaResult[i]['President'],
          coaResult[i]['Pres Email'],
          coaResult[i]['Project 1'],
          coaResult[i]['Write-up Project 1'],
          coaResult[i]['Project 2'],
          coaResult[i]['Write-up Project 2'],
          coaResult[i]['Project 3'],
          coaResult[i]['Write-up Project 3'],
          coaResult[i]['Upload the Media ZIP File here'],
          coaResult[i]['Member Limit?'],
          coaResult[i]['Max Member Count']));
    }

    // Sorting Area
    coaList
        .sort((x, y) => x.name.toLowerCase().compareTo(y.name.toLowerCase()));

    filter();
  }

  filter() {
    List<COA> coas = [];
    List<LIONS> lions = [];
    normalList = [];

    // We added all the userList to the users. for the passing/getting the specific value.
    lions.addAll(lionsList);

    // Loop
    lions.forEach((lion) {
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
            title: Text(lion.organization),
            subtitle: Text("LIONS",
                style: TextStyle(fontSize: 12, color: const Color(0xffFF801D))),
          ),
        ),
      );
      strList.add(lion.organization);
      // print(strList);
    });

    // SetState to change the Value every time is triggers
    setState(() {
      // ignore: unnecessary_statements
      normalList;
    });

    // We added all the userList to the users. for the passing/getting the specific value.
    coas.addAll(coaList);
    // Loop
    coas.forEach((coa) {
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
            title: Text(coa.name),
            subtitle: Text(
                coa.cluster == "Confederation of Publications (COP)"
                    ? "COP"
                    : coa.cluster ==
                            "Student Groups (AEGIS, COMELEC, RegCom, SJC, ASLA, DSWS, LSOPCS, OMB, RLA, SANGGU, USAD)"
                        ? "Student Groups"
                        : "COA",
                style: TextStyle(
                    fontSize: 12,
                    color: coa.cluster == "Confederation of Publications (COP)"
                        ? const Color(0xff002864)
                        : coa.cluster ==
                                "Student Groups (AEGIS, COMELEC, RegCom, SJC, ASLA, DSWS, LSOPCS, OMB, RLA, SANGGU, USAD)"
                            ? const Color(0xff1C41B2)
                            : const Color(0xffE84C4C))),
          ),
        ),
      );
      strList.add(coa.name);
      // print(strList);
    });

    // SetState to change the Value every time is triggers
    setState(() {
      // ignore: unnecessary_statements
      normalList;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        ], icon: Icon(Icons.sort_by_alpha), indexedHeaderHeight: (index) => 90),
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
