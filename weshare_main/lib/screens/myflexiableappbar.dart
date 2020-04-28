import 'package:flutter/material.dart';

import 'constants.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyFlexiableAppBar extends StatelessWidget {

  final double appBarHeight = 250.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      decoration: new BoxDecoration(
        gradient: linearGradientvertical,
        // borderRadius: BorderRadius.vertical(bottom: Radius.circular(20,),),
      ),
      child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 100,
                width: 370,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                    
                      // padding: EdgeInsets.fromLTRB(65, 10, 65, 10),
                      onPressed: () {
                        showSearch(
                          context: context, 
                          delegate: LocationSearch(),
                        );
                      },
                      child: Text(
                        'Origin',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                        color: Colors.white,
                        thickness: 1.5,
                        indent: 10,
                        endIndent: 10,
                        height: 2,
                      ),
                    FlatButton(
                      // padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                      onPressed: () {
                        showSearch(
                          context: context, 
                          delegate: LocationSearch(),
                        );
                      },
                      child: Text(
                        'Destination',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),


              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.timer), 
                      iconSize: 26,
                      color: Colors.white.withOpacity(0.6),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.event_seat), 
                      iconSize: 26,
                      color: Colors.white.withOpacity(0.6),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list), 
                      iconSize: 26,
                      color: Colors.white.withOpacity(0.6),
                      onPressed: (){},
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

class LocationSearch extends SearchDelegate<String>{
  final stops = [
    "arcade Meranti",
    "arcade Meranti",
    "arcade Meranti",
    "arcade Meranti",
    "arcade Meranti",
    "desa Skudai Apartments",
    "school of Computing (N28)",
    "school of Electrical (P19a)",
    "school of Computing (N28a)",
    "school of Electrical (P05)",
  ];
  final recentStops = [
    "school of Computing (N28)",
    "school of Electrical (P19a)",
    "school of Computing (N28a)",
    "school of Electrical (P05)",
  ];
  final favoriteStops = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(
      icon: Icon(Icons.clear), 
      onPressed: (){
        query = "";
      },
    )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    // return IconButton(
    //   icon: AnimatedIcon(
    //     icon: AnimatedIcons.arrow_menu, 
    //     progress: transitionAnimation,
    //   ), 
    //   onPressed: (){},
    // );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty? recentStops
    :stops.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap:(){},
        leading: Icon(Icons.location_city),
        title: RichText(text: TextSpan(
          
          text: suggestionList[index].substring(0, query.length),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text:  suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey,)
            ),
          ],
        )),
      ),
      itemCount: suggestionList.length,
    );
  }

}