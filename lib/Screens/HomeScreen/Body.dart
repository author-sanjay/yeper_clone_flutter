import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yeper_user/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.2 - 27,
                decoration: BoxDecoration(
                    color: kprimarycolor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36)
                    )
                ),
              child: GestureDetector(
                onTap: (() {
                  
                }),
                
                
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    
                    children: <Widget>[
                      
                      Text("Your Balance", style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white,fontWeight: FontWeight.w300
                      ),),
                      Text(
                          "\$ 24",
                          style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 30),
                        ),
                      
                    ],
                  ),
                ),
              ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 54,
                    decoration: BoxDecoration(
                      
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: kprimarycolor.withOpacity(0.23)),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(child:
                        TextField(
                          onChanged: (value){},
                          decoration: InputDecoration(
                              hintText: "Search Card",
                              hintStyle:
                                  TextStyle(
                                    color: kprimarycolor.withOpacity(0.5)

                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  

                            ),
                        ),
                    
                      ),  
                      SvgPicture.asset("assets/icons/search.svg")
                      ],
                    
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
