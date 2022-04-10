import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('User');
    FirebaseAuth _auth = FirebaseAuth.instance;

    final uid = _auth.currentUser!.uid;

    return Scaffold(
      body: Drawer(
          child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(children: <Widget>[
                    FutureBuilder<DocumentSnapshot>(
                      future: users.doc(uid).get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Something went wrong");
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          return Text("Document does not exist");
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;

                          return ClipRect(
                            child: Container(
                              width: 200,
                              height: 234.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn2.vectorstock.com/i/1000x1000/69/51/farmer-stylized-portrait-organic-products-logo-vector-22656951.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                        return Center(child: Text("loading"));
                      },
                    ),
                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                    FutureBuilder<DocumentSnapshot>(
                      future: users.doc(uid).get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Something went wrong");
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          return Text("Document does not exist");
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;

                          return Text("User Name: ${data['Name']}");
                        }

                        return Text("loading");
                      },
                    ),
                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                    Title(
                      color: Colors.blue,
                      child: Text(
                        ""
                        "Email : ${_auth.currentUser!.email}",
                        style: TextStyle(),
                      ),
                    )
                  ]),
                )),
            Divider(
              color: Colors.black,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/MyAccount");
              },
              child: ListTile(
                leading: Icon(Icons.account_box_rounded),
                tileColor: Colors.blue[200],
                title: Text(
                  "My Account",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, "/Cart");
            //   },
            //   child: ListTile(
            //     leading: Icon(Icons.add_shopping_cart),
            //     tileColor: Colors.blue[200],
            //     title: Text(
            //       "My Cart",
            //       style: TextStyle(
            //         fontSize: 17,
            //       ),
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/Order");
              },
              child: ListTile(
                leading: Icon(Icons.add_shopping_cart),
                tileColor: Colors.blue[200],
                title: Text(
                  "My Orders",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, "/ContactUs");
              },
              child: ListTile(
                leading: Icon(Icons.call),
                tileColor: Colors.blue[200],
                title: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/About");
              },
              child: ListTile(
                leading: Icon(Icons.new_releases_rounded),
                tileColor: Colors.blue[200],
                title: Text(
                  "About Agventure",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
              child: ListTile(
                leading: const Icon(
                  Icons.login,
                ),
                tileColor: Colors.blue[200],
                title: const Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('phone');
                Navigator.pushNamed(context, "/");
              },
              child: ListTile(
                leading: const Icon(Icons.logout),
                tileColor: Colors.blue[200],
                title: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void setState(Future<Null> Function() param0, void param1) {}
}

void signout(BuildContext, Context) {
  var alertDialog = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: const AlertDialog(
          title: Text(
        'Sign Out Completed',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}
