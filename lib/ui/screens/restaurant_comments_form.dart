import 'package:flutter/material.dart';

enum Rate {
  veryBad(0),
  bad(1),
  good(2),
  veryGood(3),
  perfect(4),
  theBest(5);

  final int value; // store numeric value
  const Rate(this.value);
}

class RestaurantCommentsForm extends StatefulWidget {
  const RestaurantCommentsForm({super.key});

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentFormState();
}

class _RestaurantCommentFormState extends State<RestaurantCommentsForm> {
  Rate _selectRate = defaultRate;
  final _feedbackController = TextEditingController();

  static const defaultRate = Rate.veryBad;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String feedback = _feedbackController.text.trim();

    Navigator.pop(context, {
      'feedback': feedback,
      'rate': _selectRate.value, 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: const Text(
              'How was your dinner?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),

          DropdownButtonFormField<Rate>(
            initialValue: _selectRate,
            items: Rate.values
                .map(
                  (rate) => DropdownMenuItem<Rate>(
                    value: rate,
                    child: Text('${rate.value}'),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectRate = value;
                });
              }
            },
            decoration: const InputDecoration(labelText: 'Rate'),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: _feedbackController,
            decoration: const InputDecoration(
              labelText: 'Feedback',
              hintText: 'Any feedback?',
            ),
            maxLength: 50,
          ),

          const SizedBox(height: 12),

          ElevatedButton(onPressed: onAdd, child: const Text('Comment')),
        ],
      ),
    );
  }
}
