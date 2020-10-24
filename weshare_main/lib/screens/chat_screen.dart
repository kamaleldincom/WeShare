import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/services/database.dart';

import 'constants.dart';

class Message {
  final String uid;
  final String time;
  final String text;
  final String type;
  // final bool me;
  Message(this.uid, this.time, this.text, this.type);

  Map<String, dynamic> toMap(Message message) {
    return {
      'uid': message.uid,
      'time': message.time,
      'text': message.text,
      'type': message.type,
    };
  }
}

class ChatScreen extends StatefulWidget {
  final theMessage = TextEditingController();
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  clearTextInput(textHolder) {
    textHolder.clear();
  }

  List<Message> messages = [
    // Message('5:30 PM', 'I’m waiting at the Gate', false),
    // Message('5:30 PM', 'Me too', true),
    // Message('5:30 PM', 'I am on the way.', false),
    // Message('5:30 PM', 'We are waiting for you', true)
  ];

  String message = '';
  bool sent;
  CurrentRides ride;

  void addMessage(value) {
    // String time = DateTime.now().hour.toString() +':'+ DateTime.now().minute.toString();
    // messages.insert(0,Message(time, value, true));
    // messages.insert(0, Message(,'11:30', value));
  }

  String getValue(value) {
    addMessage(value);
    setState(() {});
    return '';
  }

  // bool

  @override
  Widget build(BuildContext context) {
    ride = ModalRoute.of(context).settings.arguments;
    User user = Provider.of<User>(context);

    return StreamProvider.value(
        value: DatabaseService.withRid(rid: ride.rid).messages,
        builder: (context, snapshot) {
          // print();
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
              ),
              title: Text(
                'Ride to ${ride.to}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.info_outline_rounded,
                    
                    color: Colors.white,
                  ),
                  iconSize: 25.0,
                  onPressed: () {},
                ),
              ],
              centerTitle: true,
            ),
            body: GestureDetector(
              child: Column(
                children: <Widget>[
                  // Container(
                  //   height: MediaQuery.of(context).size.height/12,
                  //   padding: EdgeInsets.only(top: 30),
                  //   decoration: BoxDecoration(
                  //     // boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black, offset: ),],
                  //     gradient: LinearGradient(
                  //         begin: Alignment.centerRight,
                  //         end: Alignment.centerLeft,
                  //         colors: <Color>[
                  //           Color(0xFF76D3FF),
                  //           Color(0xFF5C79FF)
                  //         ]),
                  //   ),
                  //   child: Row(
                  //     // crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       BackButton(
                  //         color: Colors.white,
                  //       ),
                  //       // SizedBox(
                  //       //   height: 10,
                  //       // ),
                  //       Text(
                  //         'Ride to ${ride.to}',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 16.0,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       IconButton(
                  //         icon: Icon(
                  //           Icons.info_outline_rounded,
                            
                  //           color: Colors.white,
                  //         ),
                  //         iconSize: 25.0,
                  //         onPressed: () {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  ChatListView(),
                  // _buildMessageTextField(getValue, context),
                  Container(
                    padding: EdgeInsets.all(10),
                    // height: MediaQuery.of(context).size.height/11,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: widget.theMessage,
                            maxLines: 2,
                            minLines: 1,
                            
                            textCapitalization: TextCapitalization.sentences,
                            onChanged: (value) {
                              setState(() {
                                if (sent == true) {
                                  value = '';

                                  sent = false;
                                } else {
                                  message = value;
                                }
                              });
                            },
                            decoration: InputDecoration(
                              suffixIcon: Container(
                                width: MediaQuery.of(context).size.width/4,
                                // margin: EdgeInsets.only(right:1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                  children: <Widget>[
                                    message != ''
                                    ? IconButton(
                                        icon: Icon(Icons.cancel),
                                        iconSize: 20.0,
                                        color: Colors.grey[600],
                                        onPressed: () {
                                          widget.theMessage.clear();
                                          message = '';
                                          setState(() {});
                                        },
                                      )
                                    : 
                                    Container(
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.attachment),
                                            iconSize: 20.0,
                                            color: Colors.grey[600],
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.camera_alt,
                                              
                                              color: Colors.grey[600],
                                            ),
                                            iconSize: 20.0,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                    
                                  ],
                                ),
                              ),
                              filled: true,
                              fillColor: Theme.of(context).backgroundColor,
                              focusColor: Colors.grey,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              hintText: 'Type a Message',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            gradient: linearGradientvertical,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.send),
                            iconSize: 20.0,
                            color: Colors.white,
                            onPressed: () {
                              if (message != '') {
                                // message = getValue(message);
                                addMessage(message);

                                DatabaseService.withRid(rid: ride.rid)
                                    .sendMessage(
                                        ride,
                                        Message(
                                            user.uid,
                                            DateTime.now().toString(),
                                            message,
                                            'text'));
                                widget.theMessage.clear();
                                message = '';
                                sent = false;

                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class ChatListView extends StatelessWidget {
  ChatListView({
    Key key,
    // @required this.messages,
  }) : super(key: key);

  final ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Message> messages = Provider.of<List<Message>>(context) ?? [];
    List<Message> reversedMessages = messages.reversed.toList() ?? [];
    return Expanded(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView.builder(
          reverse: true,
          //  helps with scrollingcontroller: listScrollController,
          padding: EdgeInsets.only(top: 15.0),
          itemCount: reversedMessages.length,
          itemBuilder: (BuildContext context, int index) {
            final Message message = reversedMessages[index];
            return _buildMessage(message, context);
          },
        ),
      ),
    );
  }
}

_buildMessage(Message message, context) {
  String dateTime = message.time ?? " ";
  var characterIndex = dateTime.indexOf(" ");
  var date = dateTime.substring(0, characterIndex);
  var time = dateTime.substring(characterIndex);
  characterIndex = time.indexOf(".");
  time = time.substring(0, characterIndex - 3);
  User user = Provider.of<User>(context);
  Container addAvatar(String uid) {
    if (uid != user.uid) {
      return Container(
        child: CircleAvatar(
          child: FutureBuilder(
            future: DatabaseService().getUserDetails(message.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.photo) {
                  return FutureBuilder(
                    future: DatabaseService().getImage(message.uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData)
                        return CircleAvatar(
                          child: ClipOval(
                            child: snapshot.data,
                          ),
                          // backgroundImage: NetworkImage(snapshot.data.preview),
                          radius: 20,
                        );

                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Container(child: Icon(Icons.person, size: 25));

                      if (snapshot.connectionState == ConnectionState.none) {
                        return Container(
                          child: Icon(Icons.person, color: Colors.black),
                        );
                      }
                      return Container(
                        child:
                            Icon(Icons.person, size: 25, color: Colors.black),
                      );
                    },
                  );
                } else {
                  Container(child: Icon(Icons.person, size: 25));
                }
              }
              return Container(child: Icon(Icons.person, size: 25));
            }
          ),

        // backgroundImage: AssetImage('assets/logo.png'),
        radius: 20.0,
      ));
    } else {
      return Container(
        height: 0,
        width: 0,
      );
    }
  }

  final Container msg = Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      mainAxisAlignment: message.uid == user.uid
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: <Widget>[
        addAvatar(message.uid),
        SizedBox(
          width: 5,
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width/1.45,
          ),
          // width: 300,
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          // width: MediaQuery.of(context).size.width * 0.75,
          decoration: message.uid == user.uid
              ? BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: <Color>[Color(0xFF76D3FF), Color(0xFF5C79FF)]),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                )
              : BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  message.text,
                  style: TextStyle(
                    color: message.uid == user.uid
                        ? Colors.white
                        : Colors.grey[700],
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                time,
                style: TextStyle(
                  color:
                      message.uid == user.uid ? Colors.white : Colors.grey[700],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  return msg;
}
