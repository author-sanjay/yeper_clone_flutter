// // ignore_for_file: prefer_const_constructors, file_names, avoid_print, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../constants.dart';
// import '../../../modals/GetCards.dart';
// import '../../../modals/GetCardsapi.dart';

// class HeaderWithSearchbar extends StatefulWidget {
//   const HeaderWithSearchbar({
//     Key? key,
//     required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   State<HeaderWithSearchbar> createState() => _HeaderWithSearchbarState();
// }

// class _HeaderWithSearchbarState extends State<HeaderWithSearchbar> {
//   late List<GetCard> _getdeals;
//   late String name;
//   bool _isloading = true;

//   @override
//   void initState() {
//     super.initState();
//     getDeals();
//   }

//   Future<void> getDeals() async {
//     // _getdeals = await GetCardsapi.getbyname(String name);
//     setState(() {
//       _isloading = false;
//     });
//     print(_getdeals);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
//       height: widget.size.height * 0.2,
//       child: Stack(
//         children: <Widget>[
//           Container(
//             height: widget.size.height * 0.2 - 27,
//             decoration: BoxDecoration(
//                 color: kprimarycolor,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(36),
//                     bottomRight: Radius.circular(36))),
//             child: GestureDetector(
//               onTap: (() {
//                 print("Hello");
//               }),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(top: 40),
//                       child: Center(
//                         child: Text(
//                           "Choose Your Cards",
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline5
//                               ?.copyWith(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w300),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                 padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                 height: 54,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                         offset: Offset(0, 10),
//                         blurRadius: 50,
//                         color: kprimarycolor.withOpacity(0.23)),
//                   ],
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: TextField(
//                         onChanged: (value) {
//                           name=value;
//                         },
//                         decoration: InputDecoration(
//                           hintText: "Search Card",
//                           hintStyle:
//                               TextStyle(color: kprimarycolor.withOpacity(0.5)),
//                           enabledBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(child: SvgPicture.asset("assets/icons/search.svg"))
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
 
//   }
// }


