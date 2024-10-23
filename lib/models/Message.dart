class Message {
  final String msg;         // Final field for the message content
  final MessageType msgType; // Message type (user or bot)

  Message({required this.msg, required this.msgType});
}

// Enum to differentiate between user and bot messages
enum MessageType { user, bot }
