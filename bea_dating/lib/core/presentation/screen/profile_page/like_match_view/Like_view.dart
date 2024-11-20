import 'dart:developer';

import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/view_account/view_account.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LikeListView extends StatelessWidget {
  LikeListView({super.key, required this.user, required this.headline});
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                List<Map<String, dynamic>> userdata = snapshot.data!.docs
                    .map(
                      (user) => user.data() as Map<String, dynamic>,
                    )
                    .toList();
                List<Map<String, dynamic>> likedUsers = userdata
                    .where((userData) => user.like.contains(userData['uid']))
                    .toList();
                log(likedUsers.length.toString());
                if (likedUsers.isEmpty) {
                  return Center(child: Text('No likes found'));
                }
                return Container(
                  height: mediaqueryHight(.80, context),
                  child: ListView.separated(
                    itemCount: likedUsers.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: mediaqueryHight(.001, context),
                      );
                    },
                    itemBuilder: (context, index) {
                      Map<String, dynamic> preuser = likedUsers[index];
                      String name = preuser['name'];
                      var image = preuser['image'];
                      String uids = preuser['uid'];

                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: listTileclr),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  FadeTransitionPageRoute(
                                      child: ViewAccount(uid: uids)));
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                maxRadius: 26,
                                child: ClipRRect(borderRadius: BorderRadius.circular(50),
                                  child: CachedNetworkImage(
                                    imageUrl: image[0],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                //  foregroundImage: NetworkImage(image[0]),
                              ),
                              title: Text(name),
                            ),
                          ));
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
