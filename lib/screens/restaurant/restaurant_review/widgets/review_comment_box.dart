import 'package:flutter/material.dart';

class ReviewCommentBox extends StatelessWidget {

  ReviewCommentBox({
    super.key, required this.onTypeName, required this.onTypeReview, required this.onTapSend,
  });

  final TextEditingController reviewNameControl = TextEditingController();
  final TextEditingController reviewTextControl = TextEditingController();

  final Function(String name) onTypeName;
  final Function(String review) onTypeReview;
  final Function(TextEditingController fieldName, TextEditingController fieldReview) onTapSend;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 124,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: const Border(
            top: BorderSide(
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: reviewNameControl,
                onChanged: (String text) => onTypeName(text),
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16),
                  hintText: 'Your Name..',
                  hintStyle: TextStyle(fontSize: 16),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
              const Divider(),
              TextField(
                controller: reviewTextControl,
                minLines: 1,
                maxLines: 10,
                onChanged: (String text) => onTypeReview(text),
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffix: TextButton(
                    onPressed: () => onTapSend(reviewNameControl, reviewTextControl),
                    child: const Text(
                      'Send Review',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                  hintText: 'Write your review...',
                  hintStyle: const TextStyle(fontSize: 14),
                  isDense: true,
                  contentPadding: const EdgeInsets.only(left: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}