import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homeboltech/Admin/screensAdmin/AdminModels/AdminPendingTaskModel.dart';
import 'package:homeboltech/Admin/screensAdmin/BottomNavigationPagesAdmin/HomePageAdmin/taskDetailsPageAdmin.dart';
import 'package:homeboltech/api/api.dart';
import 'package:homeboltech/main.dart';
import 'package:homeboltech/redux/action.dart';
import 'package:homeboltech/routeTransition/routeAnimation.dart';
import 'package:intl/intl.dart';

class CompletedTAskAdminPAge extends StatefulWidget {
  @override
  _CompletedTAskAdminPAgeState createState() => _CompletedTAskAdminPAgeState(); 
}

class _CompletedTAskAdminPAgeState extends State<CompletedTAskAdminPAge> {
  bool isLoading = true;
  bool isSearching = false;
  bool noData = false;
  TextEditingController searchController = TextEditingController();

  var completedTaskData;
  var completedTaskRes;

  ScrollController _controller = new ScrollController();

  int _lastId;
  int _searchlastId;
  bool _isLoadingMore = false;


  //  @override
  // void initState() {
  //   super.initState();
  //   _getcompletedTaskData();
  //   //menuSelected = 0;
  // }


  ///
  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          if (!mounted) return;
          setState(() {
            print("top");
          });
        }
        // you are at top position

        else {
          print("bottom");
          if(isSearching){
            if(_isLoadingMore == false){
              _loadMoreSearchTask();
            }else{
              print('loading data');
            }
          }
          else{
            if(_isLoadingMore == false){
              _loadMoreCurrentTask(_lastId); //api will be call at the bottom at the list
            }else{
              print('loading data');
            }
          }
        }
        // you are at bottom position
      }
    });
    _getcompletedTaskData();
    // TODO: implement initState
    super.initState();
  }

  ///


  Future<void> _getcompletedTaskData() async {

    setState(() {
      isLoading = true;
      store.state.adminSearchTaskState = [];
    });

    var res = await CallApi().getDataWithTokenNPercent('sadmin/all_task_tech', '&status=Completed');
    final body = json.decode(res.body);
    
    print(body);

     if (res.statusCode != 200) {

      print("Something went wrong");
      setState(() {
      isLoading = false;
      });
    }
    else if (res.statusCode == 200) {
      completedTaskRes = adminPendingTaskModelFromJson(res.body);

       store.dispatch(AdminCompletedTaskAction(completedTaskRes.data)); // update data in store...
       
       //print(store.state.biographicalInfoState);
       if (!mounted) return;
       setState(() {
         completedTaskData = store.state.adminCompletedTaskState;
       });

       if (completedTaskData.length > 0) {
        _lastId = completedTaskData[completedTaskData.length - 1].id;
      }
       print("_lastId......................");
       print(_lastId);


    setState(() {
      isLoading = false;
      });
    }
    else if (res.statusCode == 400) {
      print("beng amar");
      setState(() {
      noData = true;
      isLoading = false;
      });
    }
    
    else{
      print("else o asi");
      setState(() {
      isLoading = false;
      });
    }


// setState(() {
//       isLoading = false;
//       });
    
  }


  //////////////// get more task start ///////////////
  Future<void> _loadMoreCurrentTask(lastID) async {
    setState(() {
      _isLoadingMore = true;
    });

    var res = await CallApi().getDataWithTokenNPercent('sadmin/all_task_tech', '&status=Completed&lastId=$lastID');
    final body = json.decode(res.body);
    
    print(body);
    print('body - $body');
    print('..........more more more...........');

    if (res.statusCode == 200) {
      var loadList = adminPendingTaskModelFromJson(res.body).data;
      if (loadList.length > 0) {
        _lastId = loadList[loadList.length - 1].id;
        print("_lastId....................................");
        print(_lastId);
      }
      for (int i = 0; i < loadList.length; i++) {
        store.state.adminCompletedTaskState.add(loadList[i]);
      }
    }

    if (!mounted) return;
    setState(() {
      _isLoadingMore = false;
    });
  }
  //////////////// get more task end ////////////////
  

  //////////////// search task start ////////////////
  Future<void> _searchCurrentTask(lastID) async {
    setState(() {
      isLoading = true;
    });

    print("search oijar");

    var res = await CallApi().getDataWithTokenNPercent('sadmin/all_task_tech', '&status=Completed&str=${searchController.text}');
    final body = json.decode(res.body);
    
    print(body);
    print('body - $body');
    print('..........more more more...........');

    if (res.statusCode == 200) {
      var searchList = adminPendingTaskModelFromJson(res.body).data;

       store.dispatch(AdminSearchTaskAction(searchList)); // update data in store...
      print(store.state.adminSearchTaskState.length);
      if (store.state.adminSearchTaskState.length > 0) {
        _searchlastId = store.state.adminSearchTaskState[store.state.adminSearchTaskState.length - 1].id;
      }
    }

    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }
  //////////////// search task end ////////////////
  


  //////////////// get more task start ///////////////
  Future<void> _loadMoreSearchTask() async {
    setState(() {
      _isLoadingMore = true;
    });

    var res = await CallApi().getDataWithTokenNPercent('sadmin/all_task_tech', '&status=Completed&str=${searchController.text}&lastId=$_searchlastId');
    final body = json.decode(res.body);
    
    print(body);
    print('body - $body');
    print('..........more more search...........');

    if (res.statusCode == 200) {
      var searchLoadList = adminPendingTaskModelFromJson(res.body).data;
      if (searchLoadList.length > 0) {
       setState(() {
          _searchlastId = searchLoadList[searchLoadList.length - 1].id;
       });
        print("_searchlastId....................................");
        print(_searchlastId);
      }
      for (int i = 0; i < searchLoadList.length; i++) {
        store.state.adminSearchTaskState.add(searchLoadList[i]);
      }
    }

    if (!mounted) return;
    setState(() {
      _isLoadingMore = false;
    });
  }
  //////////////// get more task end ////////////////

  

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
          'Task',
          style: TextStyle(
            color: Color(0xFF0101D3),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: isLoading
       ? Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 30),
          child: SpinKitWanderingCubes(
            color: Color(0xFF0101D3),
            size: 45,
            ),
          )
      :
      Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        margin: EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: RefreshIndicator(
          onRefresh: _getcompletedTaskData,
                  child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            child: Container(
              child: Column(
                children: [
                  ////////////////////// search text field start //////////////////////
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F8FB),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Color.fromRGBO(45, 45, 45, 0.1),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      onSubmitted: _searchCurrentTask,
                      onChanged: (value){
                        if(value == ""){
                          setState(() {
                            isSearching = false;
                          });
                        }else{
                          setState(() {
                            isSearching = true;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF2D2D2D),
                        ),
                        hintText: "Search tasks",
                        hintStyle: TextStyle(
                          color: Color(0xFF9696A0),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 17, bottom: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ////////////////////// search text field end //////////////////////

                  //////////////////// current tasks text start /////////////////////
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Completed Tasks',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  //////////////////// current tasks text end /////////////////////
                  


                  //////////////////// Search current tasks card grid start /////////////////////
                  isSearching ? Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 40,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            alignment: store.state.adminSearchTaskState.length <=1 ? WrapAlignment.start : WrapAlignment.spaceAround,
                           // spacing: 10.0,
                            children: List.generate(
                              store.state.adminSearchTaskState.length , (index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    ScaleRoute(page: TaskDetailsAdminPage(store.state.adminSearchTaskState[index])),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.only(bottom: 10),
                                  width: MediaQuery.of(context).size.width / 2.4,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(3, 172, 98, 0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: isLoading ? 
                                      Container(
                                        width: MediaQuery.of(context).size.width / 2.4,
                                        height: MediaQuery.of(context).size.width / 2,
                                        child: Center(
                                              child: SpinKitWanderingCubes(
                                                color: Color(0xFF0101D3),
                                                size: 45,
                                                ),
                                              ),
                                      )
                                        : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: Text(
                                              store.state.adminSearchTaskState[index].createdAt == null ? "" :
                                              "${DateFormat.yMMMMd().format(store.state.adminSearchTaskState[index].createdAt)}", //start date oito
                                              //'Sep 20, 2020',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(45, 45, 45, 0.8),
                                              ),
                                            ),
                                          ),
                                          //////////////////////
                                          PopupMenuButton<int>(
                                          onSelected: (selected) {
                                           if(selected == 1){
                                             removeSearchTaskButton( store.state.adminSearchTaskState[index]);
                                           }
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          icon: Icon(
                                           FlutterIcons.dots_two_vertical_ent,
                                            // color: Color(0xff707070)
                                            //     .withOpacity(0.3),
                                          ),
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: 1,
                                              child: Text(
                                                "Remove",
                                                style: TextStyle(
                                                    color: Color(0xFF5A5B5C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 2,
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Color(0xFF5A5B5C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                          offset: Offset(0, 100),
                                        ),
                                          //////////////////////
                                          // IconButton(
                                          //   onPressed: () {},
                                          //   icon: Icon(
                                          //     FlutterIcons.dots_two_vertical_ent,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 15, bottom: 4, left: 15),
                                      child: Text(
                                        "Task - ${store.state.adminSearchTaskState[index].id}",
                                        //'Create Site map',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            'by ${store.state.adminSearchTaskState[index].user.firstname}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(45, 45, 45, 0.7),
                                            ),
                                          ),
                                          // SizedBox(width: 25),
                                          // Text(
                                          //   'Design',
                                          //   style: TextStyle(
                                          //     fontSize: 12,
                                          //     color: Color.fromRGBO(45, 45, 45, 0.7),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15, top: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            'In ${store.state.adminSearchTaskState[index].status}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(45, 45, 45, 1),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(left: 10, right: 13),
                                            child: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Color(0xFF4A4B57),
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15, top: 20, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CircleAvatar(
                                                    radius: 18,
                                                    backgroundImage: 
                                                    store.state.adminSearchTaskState[index].tech.image != null ?
                                                    NetworkImage(
                                                        "${store.state.adminSearchTaskState[index].tech.image}")
                                                    :
                                                     AssetImage(
                                                      'assets/images/person.jpg',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                              );
                            },
                          ),
                          
                          ),
                        ),
                                         _isLoadingMore
                                            ? Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.all(20),
                                                child: Center(
                                                  child: SpinKitFadingCircle(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    size: 40,
                                                  ),
                                                ),
                                              )
                                            : Container()
                                        //: Container()
                      ],
                    ),
                  )
                  //////////////////// Search current tasks card grid end /////////////////////
                  :
                  //////////////////// current tasks card grid start /////////////////////
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            alignment: completedTaskData.length <=1 ? WrapAlignment.start : WrapAlignment.spaceAround,
                           // spacing: 10.0,
                            children: List.generate(
                              completedTaskData.length , (index) {
                                  
                          //          if (_isLoadingMore) {
                          //    return Container(
                          //      height: 40,
                          //      child: Center(
                          //        child: CupertinoActivityIndicator()
                          //        ),
                          //    );
                          // }
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    ScaleRoute(page: TaskDetailsAdminPage(completedTaskData[index])),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.only(bottom: 10),
                                  width: MediaQuery.of(context).size.width / 2.4,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(3, 172, 98, 0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: isLoading ? 
                                        Container(
                                          width: MediaQuery.of(context).size.width / 2.4,
                                          height: MediaQuery.of(context).size.width / 2,
                                          child: Center(
                                                child: SpinKitWanderingCubes(
                                                  color: Color(0xFF0101D3),
                                                  size: 45,
                                                  ),
                                                ),
                                        )
                                          : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: Text(
                                              completedTaskData[index].createdAt == null ? "" :
                                              "${DateFormat.yMMMMd().format(completedTaskData[index].createdAt)}", //start date oito
                                              //'Sep 20, 2020',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(45, 45, 45, 0.8),
                                              ),
                                            ),
                                          ),
                                          //////////////////////
                                          PopupMenuButton<int>(
                                          onSelected: (selected) {
                                           if(selected == 1){
                                             removeTaskButton( completedTaskData[index]);
                                           }
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          icon: Icon(
                                           FlutterIcons.dots_two_vertical_ent,
                                            // color: Color(0xff707070)
                                            //     .withOpacity(0.3),
                                          ),
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: 1,
                                              child: Text(
                                                "Remove",
                                                style: TextStyle(
                                                    color: Color(0xFF5A5B5C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 2,
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Color(0xFF5A5B5C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                          offset: Offset(0, 100),
                                        ),
                                          //////////////////////
                                          // IconButton(
                                          //   onPressed: () {},
                                          //   icon: Icon(
                                          //     FlutterIcons.dots_two_vertical_ent,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 15, bottom: 4, left: 15),
                                      child: Text(
                                        "Task - ${completedTaskData[index].id}",
                                        //'Create Site map',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            'by ${completedTaskData[index].user.firstname}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(45, 45, 45, 0.7),
                                            ),
                                          ),
                                          // SizedBox(width: 25),
                                          // Text(
                                          //   'Design',
                                          //   style: TextStyle(
                                          //     fontSize: 12,
                                          //     color: Color.fromRGBO(45, 45, 45, 0.7),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15, top: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            'In ${completedTaskData[index].status}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(45, 45, 45, 1),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(left: 10, right: 13),
                                            child: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Color(0xFF4A4B57),
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15, top: 20, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CircleAvatar(
                                                    radius: 18,
                                                    backgroundImage: 
                                                    completedTaskData[index].tech.image != null ?
                                                    NetworkImage(
                                                        "${completedTaskData[index].tech.image}")
                                                    :
                                                     AssetImage(
                                                      'assets/images/person.jpg',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                              );
                            },
                          ),
                  ),
                        ),

                  // completedTaskData.length - 1 == index
                  //                       ?
                                         _isLoadingMore
                                            ? Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.all(20),
                                                child: Center(
                                                  child: SpinKitFadingCircle(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    size: 40,
                                                  ),
                                                ),
                                              )
                                            : Container()
                                        //: Container()
                      ],
                    ),
                  )
                  //////////////////// current tasks card grid end /////////////////////
                  //SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 ////////////////////////////////// remove task ///////////////////////////
 void removeTaskButton(taskRemove) async {
   setState(() {
     isLoading = true;
   });

      var data = {
                  "id": taskRemove.id,
                };

         print(data);
       var res = await CallApi().postDataWithToken(data, 'sadmin/task_delete_tech');
       var body = json.decode(res.body);
       print(body);

       if(res.statusCode == 402){
        _errorDialog("Something went wrong");
        setState(() {
          isLoading = false;
        });
      }
      else if(res.statusCode == 200){

        for(var d in store.state.adminCompletedTaskState){
        if(d.id == taskRemove.id){
          store.state.adminCompletedTaskState.remove(taskRemove);
          store.dispatch(AdminCompletedTaskAction(store.state.adminCompletedTaskState));
          break;
        }else{
          print("not deleted from completed");
        }
      }

      _errorDialog('Task removed successfully');
          setState(() {
          isLoading = false;
        });
      }
      else{
        _errorDialog("Something went wrong");
        setState(() {
          isLoading = false;
        });
      }
   
 }
 ////////////////////////////////// remove task ///////////////////////////
 

 ////////////////////////////////// remove search task ///////////////////////////
 void removeSearchTaskButton(taskRemove) async {
   setState(() {
     isLoading = true;
   });

      var data = {
                  "id": taskRemove.id,
                };

         print(data);
       var res = await CallApi().postDataWithToken(data, 'sadmin/task_delete_tech');
       var body = json.decode(res.body);
       print(body);

       if(res.statusCode == 402){
        _errorDialog("Something went wrong");
        setState(() {
          isLoading = false;
        });
      }
      else if(res.statusCode == 200){

        for(var d in store.state.adminCompletedTaskState){
        if(d.id == taskRemove.id){
          store.state.adminCompletedTaskState.remove(taskRemove);
          store.dispatch(AdminCompletedTaskAction(store.state.adminCompletedTaskState));
          break;
        }else{
          print("not deleted from completed");
        }
      }

      for(var d in store.state.adminSearchTaskState){
        if(d.id == taskRemove.id){
          store.state.adminSearchTaskState.remove(taskRemove);
          store.dispatch(AdminSearchTaskAction(store.state.adminSearchTaskState));
          break;
        }else{
          print("not deleted from search");
        }
      }
      _errorDialog('Task removed successfully');
          setState(() {
          isLoading = false;
        });
      }
      else{
        _errorDialog("Something went wrong");
        setState(() {
          isLoading = false;
        });
      }
   
 }
 ////////////////////////////////// remove search task ///////////////////////////
 
 

 ////////////// Error Dialog STart //////////
  Future<Null> _errorDialog(title) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: Colors.white)),
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      margin: EdgeInsets.all(15),
                      child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quicksand',
                        color: Color(0xff003A5B),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        border: Border.all(color: Colors.white)),
                    child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: 0, bottom: 20, left: 30, right: 30),
                        decoration: BoxDecoration(
                          color: Color(0xFF0101D3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("Done",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: "quicksand"))),
                  ),
                ),
              ],
            ),
          );
        });
  }
////////////// Errort Dialog End //////////
}