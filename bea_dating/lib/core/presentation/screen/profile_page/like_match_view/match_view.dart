import 'dart:developer';

import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchListView extends StatelessWidget {
  MatchListView({super.key, required this.user, required this.headline});
  UserModel user;
  String headline;

  AppFonts appFonts = AppFonts();
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchuser =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          user.name,
          style: appFonts.flextext(blackclr, Fweight: 400, size: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 1, offset: Offset(1, 0))],
                    color: const Color.fromARGB(255, 133, 169, 220)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 8, left: 8, top: 6, bottom: 6),
                  child: Text(
                    headline,
                    style: appFonts.flextext(blackclr, Fweight: 500, size: 15),
                  ),
                )),
            SizedBox(
              height: mediaqueryHight(.02, context),
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: fetchuser,
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      snapshot) {
                          if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        List<Map<String,dynamic>>userdata=snapshot.data!.docs.map((user) =>user.data()as Map<String,dynamic> ,).toList();
                          List<Map<String, dynamic>> matchedUsers = userdata
                      .where((userData) => user.match.contains(userData['uid']))
                      .toList();
                           if (matchedUsers.isEmpty) {
                    return Center(child: Text('No matches found'));

                  }    return Container(height:mediaqueryHight(.82, context),
                  child: ListView.separated( itemCount: matchedUsers.length,separatorBuilder: (context, index) {
                    return SizedBox(height: mediaqueryHight(.001, context),);
                  },itemBuilder: (context, index) {
                      Map<String,dynamic> preuser=matchedUsers[index];
                      String name=preuser['name'];
                    var image=preuser['image'];

                  return  Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: listTileclr),child: ListTile(
                    leading: CircleAvatar(maxRadius: 40,foregroundImage: NetworkImage(image[0]) ,),title: Text(name),
                  ));
                  }, ),
                );
                      },
                       
            )
           
          ],
        ),
      ),
    );
  }
}



