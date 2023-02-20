import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:sizer/sizer.dart';

class TranjuctionDetailsPage extends StatefulWidget {
  const TranjuctionDetailsPage({super.key});

  @override
  State<TranjuctionDetailsPage> createState() => _TranjuctionDetailsPageState();
}

class _TranjuctionDetailsPageState extends State<TranjuctionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff1C2039),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "Hi Spookie weirdo",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Total Balance",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$124.57",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last Transactions",
                    style: TextStyle(
                        color: Color(0xff1A1A1A),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        color: Color(0xff3491DB),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: Color(0xff1C2039),
                  child: Icon(
                    Icons.wallet,
                    color: Colors.white,
                  )),
              title: Text(
                "Yara Khalil",
                style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Oct 14, 10:24 AM",
                style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              trailing: Text(
                "-\$15.00",
                style: TextStyle(
                    color: Color(0xffE50300),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: Color(0xff1C2039),
                  child: Icon(
                    Icons.wallet,
                    color: Colors.white,
                  )),
              title: Text(
                "Yara Khalil",
                style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Oct 14, 10:24 AM",
                style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              trailing: Text(
                "-\$15.00",
                style: TextStyle(
                    color: Color(0xff1CAF12),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: Color(0xff1C2039),
                  child: Icon(
                    Icons.wallet,
                    color: Colors.white,
                  )),
              title: Text(
                "Yara Khalil",
                style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Oct 14, 10:24 AM",
                style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              trailing: Text(
                "-\$15.00",
                style: TextStyle(
                    color: Color(0xffE50300),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
