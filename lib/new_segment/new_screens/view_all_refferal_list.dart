import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/new_segment/new_models/referal_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ViewAllRefferalList extends StatefulWidget {
  final RxList<ReferalModel> list;
  const ViewAllRefferalList({
    super.key,
    required this.list,
  });

  @override
  State<ViewAllRefferalList> createState() => _ViewAllRefferalListState();
}

class _ViewAllRefferalListState extends State<ViewAllRefferalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView.builder(
            itemCount: widget.list.length,
            // itemCount: refferalController.getRefferalList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.list[index].name.toString(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.list[index].contri.toString(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ))
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
