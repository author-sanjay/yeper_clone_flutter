import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C2039),
        leading: Image.asset(
          "assets/images/back.png",
          scale: 5,
        ),
        title: Text(
          "Referrals",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/5/57/Shri_Virat_Kohli_for_Cricket%2C_in_a_glittering_ceremony%2C_at_Rashtrapati_Bhavan%2C_in_New_Delhi_on_September_25%2C_2018_%28cropped%29.JPG",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "Hiba Saleh",
              style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            trailing: Text(
              "Oct 14, 10:24 AM",
              style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/5/57/Shri_Virat_Kohli_for_Cricket%2C_in_a_glittering_ceremony%2C_at_Rashtrapati_Bhavan%2C_in_New_Delhi_on_September_25%2C_2018_%28cropped%29.JPG",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "Hiba Saleh",
              style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            trailing: Text(
              "Oct 14, 10:24 AM",
              style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ]),
      ),
    );
  }
}
