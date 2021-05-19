import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/addendumItemAddAdminScreen.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/addendumItemDetailAdminScreen.dart';
import 'package:homeboltech/api/api.dart';
import 'package:homeboltech/models/AddendumModel.dart';
import 'package:homeboltech/redux/action.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';

import '../../../../main.dart';

class AddendumAdminScreen extends StatefulWidget {
  @override
  _AddendumAdminScreenState createState() => _AddendumAdminScreenState();
}

class _AddendumAdminScreenState extends State<AddendumAdminScreen> {
  bool _isLoading = false;

  ///////////////// get all addendum start /////////////////
  _getAllAddendum() async {
    setState(() {
      _isLoading = true;
    });

    var res = await CallApi().getDataWithToken('sadmin/getAllAddandum');
    print('res - $res');
    var body = json.decode(res.body);
    print('body - $body');
    print('.....................');

    if (res.statusCode == 200) {
      var addendum = addendumModelFromJson(res.body).data;

      print(
          'store.state.addendumAdminState start --- ${store.state.addendumAdminState.length}');
      print(
          'store.state.addendumAdminState start --- ${store.state.addendumAdminState[0].name}');
      print(
          'store.state.addendumAdminState start --- ${store.state.addendumAdminState}');
      store.dispatch(AddendumAdminAction(addendum));
      print(
          'store.state.addendumAdminState end --- ${store.state.addendumAdminState}');
    }

    setState(() {
      _isLoading = false;
    });
  }
  ///////////////// get all addendum end /////////////////

  ///
  @override
  void initState() {
    _getAllAddendum();
    // TODO: implement initState
    super.initState();
  }

  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F8FB),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF0101D3),
          ),
        ),
        title: Text(
          'Addendum',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(page: AddendumItemAddAdminScreen()),
              );
            },
            child: Container(
              // padding: EdgeInsets.only(right: 11, left: 13, top: 9, bottom: 9),
              margin: EdgeInsets.only(right: 10, left: 10, top: 0, bottom: 5),
              // decoration: BoxDecoration(
              //   color: Color.fromRGBO(1, 1, 211, 0.1),
              //   borderRadius: BorderRadius.circular(15),
              // ),
              child: Icon(
                Icons.add_circle_outline,
                size: 30,
                color: Color(0xFF0101D3),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 19, left: 20, right: 20, bottom: 5),
        child: Column(
          children: [
            ////////////////////// Addendum list start //////////////////////
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 5.0),
                  physics: BouncingScrollPhysics(),
                  // itemCount: 10,
                  itemCount: store.state.addendumAdminState.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          ScaleRoute(page: AddendumItemDetailAdminScreen()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.only(
                          right: 20,
                          left: 11,
                          top: 10,
                          bottom: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // 'ERP Database Development',
                              store.state.addendumAdminState[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'poppins',
                              ),
                            ),
                            Text(
                              // 'shdsh',
                              'ID:${store.state.addendumAdminState[index].id}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(45, 45, 45, 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            ////////////////////// Addendum list end //////////////////////
          ],
        ),
      ),
    );
  }
}
