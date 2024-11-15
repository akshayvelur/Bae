import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/image_view.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MydataPage extends StatelessWidget {
  MydataPage({super.key});
  AppFonts appFonts = AppFonts();
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserData userData = UserData();
  List<String> images = [];
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsers =
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
          "Media",
          style: appFonts.appBarfont,
        ),
      ),
      body: Container(
        height: mediaqueryHight(100, context),
        width: mediaqueryWidth(100, context),
        child: Column(children: [
          StreamBuilder(
            stream: getUsers,
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: clrGreen,
                  ),
                );
              }
              List<Map<String, dynamic>> users = snapshot.data!.docs
                  .map(
                    (e) => e.data() as Map<String, dynamic>,
                  )
                  .toList();
              Map<String, dynamic> currentUser = users.firstWhere(
                (element) => element['uid'] == _auth.currentUser!.uid,
              );
              List<String> chatRoom =
                  List<String>.from(currentUser['chatUsers']);
              return Container(
                height: mediaqueryHight(.898, context),
                width: mediaqueryWidth(100, context),
                child: ListView.builder(
                  itemCount: chatRoom.length,
                  itemBuilder: (context, index) {
                    return StreamBuilder(
                      stream: userData.getAllMedia(chatRoom[index]),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: clrGreen,
                            ),
                          );
                        }
                        List<Map<String, dynamic>> allChat = snapshot.data!.docs
                            .map(
                              (e) => e.data() as Map<String, dynamic>,
                            )
                            .toList();
                        List<Map<String, dynamic>> media = allChat
                            .where(
                              (element) => element['type'] == "image",
                            )
                            .toList();
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 500,
                            maxWidth: 500,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              int crossAxisCount = 3;
                              double spacing = 2;
                              double itemHeight = (constraints.maxWidth -
                                      (crossAxisCount - 1) * spacing) /
                                  crossAxisCount;

                              int rowCount =
                                  (media.length / crossAxisCount).ceil();
                              double totalHeight = (rowCount * itemHeight) +
                                  ((rowCount - 1) * spacing) +
                                  20;

                              return SizedBox(
                                height: totalHeight,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: media.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: spacing,
                                    mainAxisSpacing: spacing,
                                    childAspectRatio: 1, // Square items
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  itemBuilder: (context, index) {
                                    return InkWell(onTap: () {
                                      Navigator.of(context).push(FadeTransitionPageRoute(child: ImageViewPage(image: media[index]['msg'])));
                                    },
                                      child: CachedNetworkImage(
                                        imageUrl: media[index]["msg"],
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                            color: clrGreen,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Center(
                                          child: Icon(
                                              Icons.image_not_supported_rounded),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
