import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interect/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _onSubmit(String text){
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });

  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: IconThemeData(
        color: Colors.blue,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 1.0, right: 1.0),
        padding: EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: " Send a message ",
                ),
                onSubmitted: _onSubmit,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.blueAccent,
                ),
                onPressed: () => _onSubmit(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
