import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key, this.messageText}) : super(key: key);
  final String? messageText;

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  TextEditingController _textEditingController = TextEditingController();
  late List<Message> messages; // Declare messages variable

  @override
  void initState() {
    super.initState();
    // Initialize messages list here
    messages = [
      Message(
        text: "Hello",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: true,
      ),
      Message(
        text: "Tell Me Anything",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 2)),
        isSentByMe: false,
      ),
      Message(
        text: "Hello", // Use widget.messageText here
        date: DateTime.now().subtract(Duration(minutes: 4)),
        isSentByMe: true,
      ),
      Message(
        text: widget.messageText ?? "Hello", // Use widget.messageText here
        date: DateTime.now().subtract(Duration(minutes: 2)),
        isSentByMe: true,
      ),
    ];
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Talk With Bot",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: const EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: widget.messageText != null && message.text == "Yes"
                        ? Text("${widget.messageText}")
                        : Text(message.text),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: "Type your message here . . .",
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  final text = _textEditingController.text.trim();
                  if (text.isNotEmpty) {
                    final message = Message(
                      text: text,
                      date: DateTime.now(),
                      isSentByMe: true,
                    );
                    setState(() {
                      messages.add(message);
                      _textEditingController.clear();
                    });
                  }
                },
                icon: Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}
