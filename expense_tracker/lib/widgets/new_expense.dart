import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.onAddExpense, super.key});
  final void Function(Expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              "Please enter correct title, amount, date and category."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(Expense(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    ));
    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }
  // void _presentDatePicker() {
  //   final now = DateTime.now();
  //   final firstDate = DateTime(
  //     now.year - 1,
  //     now.month,
  //     now.day,
  //   );
  //   showDatePicker(
  //     context: context,
  //     firstDate: firstDate,
  //     lastDate: now,
  //   ).then((value) => );
  // }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSize + 16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\$ ',
                        label: Text('Amount'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'No date selected'
                              : formatter.format(_selectedDate!),
                        ),
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (categoryy) => DropdownMenuItem(
                            value: categoryy,
                            child: Text(
                              categoryy.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text('Save Expense'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


// class _NewExpenseState extends State<NewExpense> {
//   var _title;
//   final _amount = TextEditingController();
//   void _titleAdded(String newValue) {
//     _title = newValue;
//   }

//   @override
//   Widget build(context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           TextField(
//             onChanged: _titleAdded,
//             maxLength: 50,
//             keyboardType: TextInputType.text,
//             decoration: const InputDecoration(
//               label: Text('Title'),
//             ),
//           ),
//           TextField(
//             controller: _amount,
//             keyboardType: const TextInputType.numberWithOptions(
//               signed: false,
//               decimal: true,
//             ),
//             decoration: const InputDecoration(
//               label: Text('Amount'),
//             ),
//           ),
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   print(_title);
//                   print(_amount);
//                 },
//                 child: const Text('Save Expense'),
//               ),
//               ElevatedButton(onPressed: () {}, child: const Text('Cancel'))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
