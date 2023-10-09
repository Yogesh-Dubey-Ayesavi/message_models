

# Message Models for Chatbook

This Dart package, "message_models," provides a collection of message models that can be used in a chat application. These message models are designed to represent different types of messages, such as text messages, shift messages, custom messages, image messages, and audio messages. They come with built-in serialization and deserialization capabilities for easy integration with JSON-based communication protocols.

## Installation

To use this package in your Dart project, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  message_models: ^1.0.0
```

Then, run `flutter pub get` to fetch and install the package.

## Message Types

### Text Message

The `TextMessage` class represents a text message. It inherits from the `Message` class and includes properties like `author`, `createdAt`, `text`, and more. You can use it to create and work with text messages in your chat application.

### Shift Message

The `ShiftMessage` class represents a shift message. It contains information about a shift, such as its `author`, `createdAt`, `shift` details, and text content. This class allows you to handle shift-related messages within your chat application.

### Custom Message

The `CustomMessage` class is a versatile message type that lets you define custom message formats. It includes a `customType` property for unique identification and a flexible `metadata` field for custom data storage. You can use it to handle various types of custom messages in your chat app.

### Image Message

The `ImageMessage` class represents an image message. It includes properties like `author`, `createdAt`, `name`, `size`, `uri`, and more. Use it to work with image messages in your chat application.

### Audio Message

The `AudioMessage` class represents an audio message. It includes properties such as `author`, `createdAt`, `name`, `size`, `uri`, `duration`, and more. You can use it to handle audio messages within your chat application.

## Usage

To use these message models, you can import them into your Dart code and create instances of the respective message types. For example:

```dart
import 'package:message_models/text_message.dart';

void main() {
  final textMessage = TextMessage(
    author: ChatUser(name: 'Alice'),
    createdAt: DateTime.now().millisecondsSinceEpoch,
    id: '123456789',
    text: 'Hello, World!',
  );

  print('Text Message: ${textMessage.text}');
}
```

## Contribution

Contributions to this package are welcome! If you have ideas for improvements, bug fixes, or new features, please open an issue or submit a pull request on the GitHub repository: [message_models](https://github.com/your/repository/link).
