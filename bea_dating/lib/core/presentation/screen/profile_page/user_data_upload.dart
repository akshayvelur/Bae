import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class UserdataUpload extends StatelessWidget {
  UserdataUpload({super.key});
  AppFonts appFonts = AppFonts();
  List<String>dropitem=["one","two","three"];
   String dropdownValue = "one";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Profile Details",
          style: appFonts.appBarfont,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About me",
              style: appFonts.flextext(blackclr, size: 18, Fweight: 600),
            ),
            SizedBox(
              height: mediaqueryHight(.01, context),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: useraboutContainer),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: "about",
                    hintStyle: appFonts.flextext(blackshadow, size: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    counterText: ""),
              ),
            ),
            SizedBox(
              height: mediaqueryHight(.01, context),
            ),
            Text(
              "Interest",
              style: appFonts.flextext(blackclr, size: 18, Fweight: 600),
            ),
            Container(
              height: mediaqueryHight(.06, context),width: mediaqueryWidth(100, context),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: useraboutContainer)
           ,child: Padding(
             padding: const EdgeInsets.only(left: 12,right: 23),
             child: DropdownButton(isExpanded: true,borderRadius: BorderRadius.circular(10),
                  
                // Initial Value 
                value: dropdownValue, 
                  
                // Down Arrow Icon  
                icon: const Icon(Icons.keyboard_arrow_down),     
                  
                // Array list of items 
                items: dropitem.map((String items) { 
                  return DropdownMenuItem(                                                                        
                    value: items, 
                    child: Text(items), 
                  ); 
                }).toList(), 
                // After selecting the desired option,it will 
                // change button value to selected value 
                onChanged: (String? newValue) {    
                }, 
              ),
           ), ),
   
          ],
        ),
      ),
    );
  }
}
