import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BlockedListPage extends StatelessWidget {
  BlockedListPage({super.key});

  @override
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> blockUserId = [];
  Stream<QuerySnapshot<Map<String, dynamic>>> getBlockUsers =
      FirebaseFirestore.instance.collection("users").snapshots();
  AppFonts appFonts = AppFonts();
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
          "Blocked",
          style: appFonts.appBarfont,
        ),
      ),
      body: Container(
        height: mediaqueryHight(100, context),
        width: mediaqueryWidth(100, context),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: getBlockUsers,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error${snapshot.error}"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: clrGreen,
                ),
              );
            }
            List<Map<String, dynamic>> allUsers = snapshot.data!.docs
                .map(
                  (e) => e.data() as Map<String, dynamic>,
                )
                .toList();
            //  Removing current user
            Map<String, dynamic> user = allUsers.firstWhere(
              (element) => element['uid'] == _auth.currentUser!.uid,
            );
            blockUserId = List<String>.from(user["blockList"]);
            //  Removing unblocked users
            return ListView.separated(
              itemCount: blockUserId.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> blockeUserList = allUsers.firstWhere(
                  (element) => element["uid"] == blockUserId[index],
                );
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ListTile(contentPadding:EdgeInsets.all(0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                  ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CachedNetworkImage(
                          imageUrl: blockeUserList['image'][0],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: clrGreen,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      blockeUserList['name'],
                      style:
                          appFonts.flextext(blackclr, size: 14, Fweight: 400),
                    ),
                    trailing: Container(
                        height: mediaqueryHight(.05, context),
                        width: mediaqueryWidth(.2, context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: blackshadow,boxShadow: [BoxShadow(blurRadius: 5,)]),
                        child: TextButton(
                          onPressed: () {
                            // unblocking button
                          },
                          child: Text(
                            'Unblock',
                            style: appFonts.flextext(whiteclr,
                                Fweight: 400, size: 12),
                          ),
                        )),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: whiteclr,
              ),
            );
          },
        ),
      ),
    );
  }
}
