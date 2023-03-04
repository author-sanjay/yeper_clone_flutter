import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C2039),
        title: const Text('Support and Help'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          QnA(
            question: 'How do I reset my password?',
            answer:
                'You can reset your password by clicking on the "Forgot Password" link on the login page and following the instructions.',
          ),
          const SizedBox(height: 16.0),
          QnA(
            question: 'How do I delete my account?',
            answer:
                'You can delete your account by going to the "Account Settings" page and clicking on the "Delete Account" button. Please note that this action is irreversible.',
          ),
          const SizedBox(height: 16.0),
          QnA(
            question: 'How do I contact customer support?',
            answer:
                'You can contact us by sending an email to support@example.com or by filling out the contact form on our website.',
          ),
          const SizedBox(height: 32.0),
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          SocialMediaButton(
            icon: Icons.facebook,
            url: 'https://www.facebook.com/example',
          ),
          const SizedBox(height: 16.0),
          SocialMediaButton(
            icon: Icons.safety_check,
            url: 'https://www.instagram.com/example',
          ),
          const SizedBox(height: 16.0),
          SocialMediaButton(
            icon: Icons.whatsapp,
            url: 'https://wa.me/1234567890',
          ),
          const SizedBox(height: 16.0),
          SocialMediaButton(
            icon: Icons.safety_check,
            url: 'https://twitter.com/example',
          ),
        ],
      ),
    );
  }
}

class QnA extends StatefulWidget {
  final String question;
  final String answer;

  const QnA({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  _QnAState createState() => _QnAState();
}

class _QnAState extends State<QnA> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(widget.question),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.answer),
          ),
        ],
        onExpansionChanged: (isExpanded) {
          setState(() {
            _isExpanded = isExpanded;
          });
        },
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const SocialMediaButton({
    Key? key,
    required this.icon,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => launch(url),
      icon: Icon(icon),
      label: Text('Follow us on'),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
      ),
    );
  }
}
