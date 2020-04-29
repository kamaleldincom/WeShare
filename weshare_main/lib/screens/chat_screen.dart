import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'constants.dart';

class Message {
  final String time;
  final String text;
  final bool me;
  Message(this.time, this.text, this.me);
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message('5:30 PM', 'I’m waiting at the Gate', false),
    Message('5:30 PM', 'Me too', true),
    Message('5:30 PM', 'I am on the way.', false),
    Message('5:30 PM', 'We are waiting for you', true)
  ];

  void addMessage(value) {
    // String time = DateTime.now().hour.toString() +':'+ DateTime.now().minute.toString();
    // messages.insert(0,Message(time, value, true));
    messages.insert(0, Message('11:30', value, true));
  }

  void getValue(value) {
    addMessage(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Column(
          children: <Widget>[
            Container(
              height: 130.0,
              
              padding: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                // boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black, offset: ),],
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: <Color>[Color(0xFF76D3FF), Color(0xFF5C79FF)]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      BackButton(
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 130.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 30.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ride to Electrical (FKE) P05',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 15.0),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message = messages[index];
                    // final bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, context);
                  },
                ),
              ),
            ),
            _buildMessageTextField(getValue, context),
          ],
        ),
      ),
    );
  }
}

_buildMessage(Message message, context) {
  Container addAvatar(bool me) {
    if (!me) {
      return Container(
          child: CircleAvatar(
        backgroundImage: AssetImage('assets/logo.png'),
        radius: 25.0,
      ));
    } else {
      return Container(height: 0,width: 0,);
    }
  }

  final Container msg = Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      mainAxisAlignment:
          message.me ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        addAvatar(message.me),
        SizedBox(width: 5,),
        Container(
          constraints: BoxConstraints(
            maxWidth: 290.0,
          ),
          // width: 300,
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          // width: MediaQuery.of(context).size.width * 0.75,
          decoration: message.me
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
              Text(
                message.text,
                style: TextStyle(
                  color: message.me ? Colors.white : Colors.grey[700],
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                message.time,
                style: TextStyle(
                  color: message.me ? Colors.white : Colors.grey[700],
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

_buildMessageTextField(getValue, context) {
  String message;
  return Container(
    padding: EdgeInsets.fromLTRB(4, 0, 4, 8),
    height: 80.0,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.location_on),
          iconSize: 25.0,
          color: Colors.grey[600],
          onPressed: () {},
        ),
        Expanded(
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {
              // sent?value='':message=value;
              message = value;
            },
            decoration: InputDecoration(
              suffixIcon: Container(
                width: 30,
                // margin: EdgeInsets.only(right:1),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start ,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              filled: true,
              fillColor: Colors.grey[300],
              focusColor: Colors.grey,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Colors.white, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Colors.white, width: 0.0),
              ),
              hintText: 'Types a message...',
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            gradient: linearGradientvertical,
          ),
          child: IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Colors.white,
            onPressed: () {
              getValue(message);
            },
          ),
        ),
      ],
    ),
  );
}
