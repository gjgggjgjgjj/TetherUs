import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class MessageWidget extends StatelessWidget {
  final String text;
  final String sender;

  const MessageWidget({
    required this.text,
    required this.sender,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sender == "me" ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: sender == "me" ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text),
      ),
    );
  }
}


class ChatScreen extends StatelessWidget {
    final String chatId;

    const ChatScreen({
        super.key,
        required this.chatId, 
    });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('timestamp')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        final messages = snapshot.data!.docs;

        return ListView(
          children: messages.map((doc) {
            final data = doc.data();
            return MessageWidget(
              text: data['text'],
              sender: data['sender'],
            );
          }).toList(),
        );
      },
    );
  }
}

