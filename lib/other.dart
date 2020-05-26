//Widget _buildTable({int sortColumnIndex, bool sortAscending = true}) {
//  return SingleChildScrollView(
//    child: DataTable(
//      sortColumnIndex: sortColumnIndex,
//      sortAscending: sortAscending,
//      onSelectAll: (bool value) {
//        log.add('select-all: $value');
//      },
//      columns: <DataColumn>[
//        const DataColumn(
//          label: Text('Title'),
//          tooltip: 'Title',
//        ),
//        DataColumn(
//          label: const Text('Complete'),
//          tooltip: 'Check',
//        ),
//      ],
//      rows: listOfMedia.map<DataRow>((Media media) {
//        return DataRow(
//          key: Key(media.title),
//          onSelectChanged: (bool selected) {
//            log.add('row-selected: ${media.title}');
//          },
//          cells: <DataCell>[
//            DataCell(
//              Text(media.title),
//            ),
//            DataCell(
//              Text(media.chceck.toString()),
//              onTap: () {
//                log.add(media.chceck.toString());
//              },
//            ),
//          ],
//        );
//      }).toList(),
//    ),
//  );
//}
//class Dessert {
//  Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
//      this.sodium, this.calcium, this.iron);
//
//  final String name;
//  final int calories;
//  final double fat;
//  final int carbs;
//  final double protein;
//  final int sodium;
//  final int calcium;
//  final int iron;
//}
//
//final List<Dessert> kDesserts = <Dessert>[
//  Dessert('Frozen yogurt', 159, 6.0, 24, 4.0, 87, 14, 1),
//  Dessert('Ice cream sandwich', 237, 9.0, 37, 4.3, 129, 8, 1),
//  Dessert('Eclair', 262, 16.0, 24, 6.0, 337, 6, 7),
//  Dessert('Cupcake', 305, 3.7, 67, 4.3, 413, 3, 8),
//  Dessert('Gingerbread', 356, 16.0, 49, 3.9, 327, 7, 16),
//  Dessert('Jelly bean', 375, 0.0, 94, 0.0, 50, 0, 0),
//  Dessert('Lollipop', 392, 0.2, 98, 0.0, 38, 0, 2),
//  Dessert('Honeycomb', 408, 3.2, 87, 6.5, 562, 0, 45),
//  Dessert('Donut', 452, 25.0, 51, 4.9, 326, 2, 22),
//  Dessert('KitKat', 518, 26.0, 65, 7.0, 54, 12, 6),
//  Dessert('Frozen ', 159, 6.0, 24, 4.0, 87, 14, 1),
//  Dessert('Ice cream sandwichyogurt', 237, 9.0, 37, 4.3, 129, 8, 1),
//  Dessert('Eclaiyogurtr', 262, 16.0, 24, 6.0, 337, 6, 7),
//  Dessert('Cupcayogurtke', 305, 3.7, 67, 4.3, 413, 3, 8),
//  Dessert('Gingyogurterbread', 356, 16.0, 49, 3.9, 327, 7, 16),
//  Dessert('Jellyoyogurtgurty bean', 375, 0.0, 94, 0.0, 50, 0, 0),
//  Dessert('Lolliyogurtpop', 392, 0.2, 98, 0.0, 38, 0, 2),
//  Dessert('Honeycyogurtomb', 408, 3.2, 87, 6.5, 562, 0, 45),
//  Dessert('Donuyogurtt', 452, 25.0, 51, 4.9, 326, 2, 22),
//  Dessert('KitKyogurtat', 518, 26.0, 65, 7.0, 54, 12, 6),
//];

//...

//final List<String> log = <String>[];




//Widget _buildTable({int sortColumnIndex, bool sortAscending = true}) {
//  return SingleChildScrollView(
//    child: DataTable(
//      sortColumnIndex: sortColumnIndex,
//      sortAscending: sortAscending,
//      onSelectAll: (bool value) {
//        log.add('select-all: $value');
//      },
//      columns: <DataColumn>[
//        const DataColumn(
//          label: Text('Name'),
//          tooltip: 'Name',
//        ),
//        DataColumn(
//          label: const Text('Calories'),
//          tooltip: 'Calories',
//          numeric: true,
//          onSort: (int columnIndex, bool ascending) {
//            log.add('column-sort: $columnIndex $ascending');
//          },
//        ),
//      ],
//      rows: kDesserts.map<DataRow>((Dessert dessert) {
//        return DataRow(
//          key: Key(dessert.name),
//          onSelectChanged: (bool selected) {
//            log.add('row-selected: ${dessert.name}');
//          },
//          cells: <DataCell>[
//            DataCell(
//              Text(dessert.name),
//            ),
//            DataCell(
//              Text('${dessert.calories}'),
//              showEditIcon: true,
//              onTap: () {
//                log.add('cell-tap: ${dessert.calories}');
//              },
//            ),
//          ],
//        );
//      }).toList(),
//    ),
//  );
//}

//--------------------------------------------------------------------------------------

//
//Widget _buildTableBooks(List<Media> books) {
////  return ListView(
////      ListTile(
////        leading: Icon(Icons.check),
////        title: Text('Map'),
////        onLongPress: (){
////          print("działa");
////        },
////      ),
////    ],
////  );
//  return ListView.builder(
//    itemCount: books.length,
//    itemBuilder: _buildItemBooks,
//  );
//}
//Widget _buildItemBooks(BuildContext context, int index) {
//  return GestureDetector(
//    onLongPress: (){
//      print("okok");
//    },
//    child: Row(
//      children: <Widget>[
//        Icon(Icons.check),
//        Text(listOfMedia[index].title),
//      ],
//    ),
//  );
//}
//--------------------------------------------------------------------------------------
//final DBRef = FirebaseDatabase.instance.reference();
//void writeData(String title, String type, bool check) {
////  DBRef.child("id1").child(type).child(title).set({
////    'check': check,
////  });
//  DBRef.child("id1").child(new DateTime.now().millisecondsSinceEpoch.toString()).set({
//    'type': type,
//    'title': title,
//    'check': check,
//  });
//}
//void readData(String type) {
//  DBRef.once().then((DataSnapshot dataSnapshot) {
//    print(dataSnapshot.value);
//    print(dataSnapshot.value["id1"][type]);
//  });
//  DBRef.child("id1").onValue.listen((Event event) {
//    print( event.snapshot.value.length);
//
//  });
//}
//void updateData(String title, String type, bool check) {
//  DBRef.child("id1").child(type).child(title).update({'check': check,});
//}
//void deleteData() {
//  DBRef.child("id1").remove();
//}
//class Media {
//  Media(this.type, this.title, this.chceck);
//
//  final String type;
//  final String title;
//  final bool chceck;
//}
//final List<Media> listOfMedia = <Media>[
//  Media("Books", "Harry Potter", true),
//  Media("Games", "Watch Dogs", true),
//  Media("Movies", "Iron Man", false),
//];
//--------------------------------------------------------------------------------------
//class _AnonymouslySignInSection extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => _AnonymouslySignInSectionState();
//}
//
//class _AnonymouslySignInSectionState extends State<_AnonymouslySignInSection> {
//  bool _success;
//  String _userID;
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Container(
//          child: const Text('Test sign in anonymously'),
//          padding: const EdgeInsets.all(16),
//          alignment: Alignment.center,
//        ),
//        Container(
//          padding: const EdgeInsets.symmetric(vertical: 16.0),
//          alignment: Alignment.center,
//          child: RaisedButton(
//            onPressed: () async {
//              _signInAnonymously();
//            },
//            child: const Text('Sign in anonymously'),
//          ),
//        ),
//        Container(
//          alignment: Alignment.center,
//          padding: const EdgeInsets.symmetric(horizontal: 16),
//          child: Text(
//            _success == null
//                ? ''
//                : (_success
//                ? 'Successfully signed in, uid: ' + _userID
//                : 'Sign in failed'),
//            style: TextStyle(color: Colors.red),
//          ),
//        )
//      ],
//    );
//  }
//
//  // Example code of how to sign in anonymously.
//  void _signInAnonymously() async {
//    final FirebaseUser user = (await _auth.signInAnonymously()).user;
//    assert(user != null);
//    assert(user.isAnonymous);
//    assert(!user.isEmailVerified);
//    assert(await user.getIdToken() != null);
//    if (Platform.isIOS) {
//      // Anonymous auth doesn't show up as a provider on iOS
//      assert(user.providerData.isEmpty);
//    } else if (Platform.isAndroid) {
//      // Anonymous auth does show up as a provider on Android
//      assert(user.providerData.length == 1);
//      assert(user.providerData[0].providerId == 'firebase');
//      assert(user.providerData[0].uid != null);
//      assert(user.providerData[0].displayName == null);
//      assert(user.providerData[0].photoUrl == null);
//      assert(user.providerData[0].email == null);
//    }
//
//    final FirebaseUser currentUser = await _auth.currentUser();
//    assert(user.uid == currentUser.uid);
//    setState(() {
//      if (user != null) {
//        _success = true;
//        _userID = user.uid;
//      } else {
//        _success = false;
//      }
//    });
//  }
//}

//-----------------------------------------------------------------------------------