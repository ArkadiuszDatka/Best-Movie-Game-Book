import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebaseproj/Auth.dart';
import 'package:flutter/physics.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'ApiClass.dart';

void main() {
  runApp(MyApp());
}

final DBRef = FirebaseDatabase.instance.reference();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Login());
  }
}
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign in panel'),
        ),
        body: SignInPage(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _pushPage(context, RegisterPage()),
        ),
      ),
    );
  }
}
class TabBarMain extends StatelessWidget {
  String userID;
  TabBarMain(this.userID);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Best Book/Game/Movie'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Next choice',
              onPressed: () => _pushPage(context, Search(userID)),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.book)),
              Tab(icon: Icon(Icons.videogame_asset)),
              Tab(icon: Icon(Icons.movie)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: <Widget>[
                Flexible(
                  child: FirebaseAnimatedList(
                    query: QReq('Books', userID).orderByChild('check'),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return GestureDetector(
                        onLongPress: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditRecord(
                                snapshot.value["title"],
                                snapshot.value["check"],
                                snapshot.value["type"],
                                snapshot.key,
                                userID,
                                snapshot.value["other"],
                                snapshot.value["type"]
                            )),
                          );
                        },
                          child: Padding(
                          padding: EdgeInsets.all(5.0),
                        child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                color: Colors.black38
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0) //                 <--- border radius here
                              ),
                          ),
//                          color: Colors.black12,
                          child: Row(
                            children: <Widget>[
                              ikona(snapshot.value["check"]),
                              Flexible(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 20.0),
                                  child: Text("${snapshot.value["title"]}",
                                    style: TextStyle(fontSize: 18.0),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Flexible(
                  child: FirebaseAnimatedList(
                    query: QReq('Games', userID),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return GestureDetector(
                        onLongPress: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditRecord(
                                snapshot.value["title"],
                                snapshot.value["check"],
                                snapshot.value["type"],
                                snapshot.key,
                                userID,
                                snapshot.value["other"],
                                snapshot.value["type"]
                            )),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.black38
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0) //                 <--- border radius here
                              ),
                            ),
//                          color: Colors.black12,
                            child: Row(
                              children: <Widget>[
                                ikona(snapshot.value["check"]),
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 20.0),
                                    child: Text("${snapshot.value["title"]}",
                                      style: TextStyle(fontSize: 18.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Flexible(
                  child: FirebaseAnimatedList(
                    query: QReq('Movies', userID),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return GestureDetector(
                        onLongPress: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditRecord(
                                snapshot.value["title"],
                                snapshot.value["check"],
                                snapshot.value["type"],
                                snapshot.key,
                                userID,
                                snapshot.value["other"],
                                snapshot.value["type"]
                            )),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.black38
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0) //                 <--- border radius here
                              ),
                            ),
//                          color: Colors.black12,
                            child: Row(
                              children: <Widget>[
                                ikona(snapshot.value["check"]),
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 20.0),
                                    child: Text("${snapshot.value["title"]}",
                                      style: TextStyle(fontSize: 18.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
//            _buildTable(sortColumnIndex: 0, sortAscending: true),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewRecord(userID)),
              );
            }),
      ),
    );
  }
}


class record {
  String type;
  String other;
  String title;
  bool checkRecord;
  String id;

  record(this.type, this.other, this.title, this.id, this.checkRecord);
}
class AddNewRecord extends StatefulWidget {
  String userID;
  AddNewRecord(this.userID);
  @override
  State<StatefulWidget> createState() {
    return addNewRecordState(userID);
  }
}
class addNewRecordState extends State<AddNewRecord> {
  String userID;
  addNewRecordState(this.userID);
  bool checkValue = false;
  String dropdownValue = 'Books';
  final myController = TextEditingController();
  final otherControler = TextEditingController();
  final suggestionController = TextEditingController();

  final String url = "http://www.omdbapi.com/?apikey=da8b89d0&t=";
  Future<Api> futureWeather;
  Future<String> fetchWeather(String title, String type) async {
    String Url = url + title;
    final response = await http.get(Url);
    if (response.statusCode == 200 && type == 'Movies') {
      setState(() {
        suggestionController.text = Api.fromJson(json.decode(response.body)).Title;
      });
      return Api.fromJson(json.decode(response.body)).Title;
      } else {
        throw Exception('Failed to load weather');
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
//        color: Colors.amber[600],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextField(
                onChanged: (text) {
                  setState(() {
                    suggestionController.text = "";
                  });
                  fetchWeather(text, dropdownValue);
                },
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Title",
                ),
              ),
              Container(
                child: InkWell(
                  child: Text(suggestionController.text,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueAccent
                      )),
                  onTap: () {
                    setState(() {
                      myController.text = suggestionController.text;
                    });
                  },
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Column(
                children: <Widget>[
                  DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Books', 'Games', 'Movies']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Row(
                    children: <Widget>[
                      Text("Complete"),
                      Checkbox(
                        value: checkValue,
                        onChanged: (bool value) {
                          setState(() {
                            checkValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    controller: otherControler,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Other",
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.white70,
                      child: Text('Add'),
                      onPressed: () {
//                          print(myController.text + "--" + dropdownValue + "--" + checkValue.toString());
//                          writeData(myController.text, dropdownValue, checkValue);
                        _increment(myController.text, dropdownValue, checkValue, userID, otherControler.text);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class EditRecord extends StatefulWidget {
  String id;
  String title;
  bool check;
  String type;
  String type2;
  String userID;
  String other;

  EditRecord(this.title, this.check, this.type, this.id, this.userID, this.other, this.type2);

  @override
  State<StatefulWidget> createState() {
    return editRecordState(title, check, type, id, userID, other, type2);
  }
}
class editRecordState extends State<EditRecord> {
  String id;
  String title;
  bool check;
  String type;
  String type2;
  String userID;
  String other;
  editRecordState(this.title, this.check, this.type, this.id, this.userID, this.other, this.type2);
  
  bool checkValue = false;
  String dropdownValue = 'Books';
  final myController = TextEditingController();
  final otherControler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    myController.text = title;
    dropdownValue = type;
    checkValue = check;
    otherControler.text = other;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit or Delete"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
//        color: Colors.amber[600],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                title = text;
              },
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Title",
              ),
            ),
            Column(
              children: <Widget>[
                DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      title = myController.text;
                      other = otherControler.text;
                      type = newValue;
                      dropdownValue = newValue;
                      check = checkValue;

                    });
                  },
                  items: <String>['Books', 'Games', 'Movies']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Row(
                  children: <Widget>[
                    Text("Complete"),
                    Checkbox(
                      value: checkValue,
                      onChanged: (bool value) {
                        setState(() {
                          title = myController.text;
                          other = otherControler.text;
                          check = value;
                          checkValue = value;
                        });
                      },
                    ),
                  ],
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  controller: otherControler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Other",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white70,
                      child: Text('Delete'),
                      onPressed: () {
                        DBRef.child(userID).child(type).child(id).remove();
                        Navigator.pop(context);
                      },
                    ),
                    RaisedButton(
                      color: Colors.white70,
                      child: Text('Edit'),
                      onPressed: () {
                        DBRef.child(userID).child(type).child(id).update({
                          'title': myController.text,
                          'check': checkValue,
                          'type': dropdownValue,
                          'other': otherControler.text
                        });
                        if(type != type2){
                          DBRef.child(userID).child(type2).child(id).remove();
                        }
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class Search extends StatefulWidget {
  String userID;
  Search(this.userID);
  @override
  State<StatefulWidget> createState() {
    return searchState(userID);
  }
}
class searchState extends State<Search> {
  final searchController = TextEditingController();
  final suggestionController = TextEditingController();
  String userID;
  searchState(this.userID);
  String dropdownValue = 'Books';
  @override
  void setState(fn) {
    super.setState(fn);
  }

  final String url = "http://www.omdbapi.com/?apikey=da8b89d0&t=";
  Future<Api> futureWeather;
  Future<String> fetchWeather(String title) async {
    String Url = url + title;
    final response = await http.get(Url);
    if (response.statusCode == 200) {
      setState(() {
        suggestionController.text = Api.fromJson(json.decode(response.body)).Title;
      });
      return Api.fromJson(json.decode(response.body)).Title;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
//        color: Colors.amber[600],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextField(
                onChanged: (text) {
                  setState(() {
                    suggestionController.text = "";
                  });
                  fetchWeather(text);
                },
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Search",
                ),
              ),
              Container(
                child: InkWell(
                  child: Text(suggestionController.text,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueAccent
                      )),
                  onTap: () {
                    setState(() {
                      searchController.text = suggestionController.text;
                    });
                  },
                ),
                padding: EdgeInsets.all(10.0),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;

                  });
                },
                items: <String>['Books', 'Games', 'Movies']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.white70,
                  child: Text('Submit'),
                  onPressed: () {
//                  Navigator.pop(context);
                    Find(searchController.text, userID, context, dropdownValue);
//                  _pushPage(context, FindThis(searchController.text, context, userID, dropdownValue));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class noFindThis extends StatefulWidget {
  String serach;
  String type;
  noFindThis(this.serach, this.type);

  @override
  State<StatefulWidget> createState() {
      return findThisState(serach, type);
  }
}
class findThisState extends State<noFindThis> {
  String search;
  String type;
  findThisState(this.search, this.type);
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
//        color: Colors.amber[600],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(search + " record not found in " + type),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.white70,
                child: Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DatabaseReference QReq(String type, String userID){
  return DBRef.child(userID).child(type);
}
Icon ikona(bool check){
  if(check){
    return Icon(Icons.check);
  }else{
    return Icon(Icons.radio_button_unchecked);
  }
}
Future<void> _increment(String title, String type, bool check, String userID, String other) async {
  DatabaseReference _counterRef;
  _counterRef = FirebaseDatabase.instance.reference().child('counter');

  final FirebaseDatabase database = FirebaseDatabase();
  DatabaseReference _messagesRef;
  _messagesRef = database.reference().child(userID).child(type);

  database.reference().child('counter').once().then((DataSnapshot snapshot) {});
  
  final TransactionResult transactionResult =
  await _counterRef.runTransaction((MutableData mutableData) async {
    mutableData.value = (mutableData.value ?? 0) + 1;
    return mutableData;
  });
  if (transactionResult.committed) {
    _messagesRef.push().set({
      'title': title,
      'check': check,
      'type': type,
      'other': other
    });
  }
}
void _pushPage(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => page),
  );
}
void Find(String search, String userID, BuildContext context, String type) async {

  bool printed = false;
  int inc = 0;
  final db = FirebaseDatabase.instance.reference().child(userID).child(type);
  db.once().then((DataSnapshot snapshot) async {
    Map<dynamic, dynamic> values = snapshot.value;
    if(values == null){
      printed = true;
      _pushPage(context, noFindThis(search, type));
    } else {
      values.forEach((key,values) {
        if(values["title"] == search && printed == false) {
          printed = true;
          _pushPage(context, EditRecord(
              values["title"],
              values["check"],
              values["type"],
              key,
              userID,
              values["other"],
              values["type"]));
          inc ++;
        }
      });
    }
    if(printed == false) {
      _pushPage(context, noFindThis(search, type));
    }
  });
}

//http://www.omdbapi.com/?apikey=da8b89d0&t=Ha
//http://www.omdbapi.com/
//https://medium.com/flutter-community/implementing-auto-complete-search-list-a8dd192bd5f6
//https://www.google.com/search?q=flutter+input+text+with+list+of+prompt&oq=flutter+input+text+with+list+of+promp&aqs=chrome.1.69i57j33.23223j0j7&sourceid=chrome&ie=UTF-8