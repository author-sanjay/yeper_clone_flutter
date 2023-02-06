import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yeper_user/constants.dart';

class KYC extends StatelessWidget {
  const KYC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("KYC",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
        backgroundColor: Colors.white,
        elevation: 0.1,
      ),
      body: kycbody(),
    );
  }
}

class kycbody extends StatefulWidget {
  const kycbody({
    super.key,
  });
  static late String acnumber;
  static late String bankname;
  static late String ifsc;
  static late String gst;
  static late String pan;
  @override
  State<kycbody> createState() => _kycbodyState();
}

class _kycbodyState extends State<kycbody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        child: Column(
          children: [
            Text(
              "Update KYC",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "We Use it only for Payment\n and Tax records",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      kycbody.acnumber = value;
                    },
                    decoration:
                        const InputDecoration(labelText: "Account Number"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      kycbody.bankname = value;
                    },
                    decoration: const InputDecoration(labelText: "Bank Name"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      kycbody.ifsc = value;
                    },
                    decoration: const InputDecoration(labelText: "Bank IFSC"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      // phone_number = value;
                      // DetailsFields.address = value;
                      kycbody.gst = value;
                    },
                    decoration: const InputDecoration(
                        labelText: "GST Number (Optional)"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      // DetailsFields.referal = value;
                      kycbody.pan = value;
                    },
                    decoration: const InputDecoration(labelText: "Pan Number"),
                    // keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: (() {
                      // setState(() {
                      //   adduser();
                      // });
                    }),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: kprimarycolor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
