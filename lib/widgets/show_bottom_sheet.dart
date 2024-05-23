import 'package:expenses_app/models/expense_model.dart';
import 'package:expenses_app/widgets/custom_from_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowBottomSheetWidget extends StatefulWidget {
  ShowBottomSheetWidget({
    super.key,
  });

  @override
  State<ShowBottomSheetWidget> createState() => _ShowBottomSheetWidgetState();
}

class _ShowBottomSheetWidgetState extends State<ShowBottomSheetWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Category _dropdownValue = Category.food;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              CustomTextFormField(
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'please enter title';
                  } else {
                    return null;
                  }
                },
                controller: _titleController,
                maxLength: 50,
                labelText: 'Enter Title',
                inputType: TextInputType.text,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      validator: (value) {
                        final double? enternedamount = double.tryParse(value!);
                        if (enternedamount == null || enternedamount <= 0) {
                          return 'please enter amount';
                        } else {
                          return null;
                        }
                      },
                      controller: _amountController,
                      labelText: 'Enter Amount',
                      inputType: TextInputType.number,
                      prefixText: '\$',
                    ),
                  ),
                  Expanded(
                    child: TextButton.icon(
                      label: Text(_selectedDate == null
                          ? 'No Select Date'
                          : '${formatter.format(_selectedDate!)}'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.deepPurple,
                      ),
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate =
                            DateTime(now.year - 1, now.month, now.day);
                        final lastDate =
                            DateTime(now.year + 1, now.month, now.day);
                        final DateTime? paickerDate = await showDatePicker(
                          context: context,
                          firstDate: firstDate,
                          lastDate: lastDate,
                          initialDate: now,
                        );
                        setState(() {
                          _selectedDate = paickerDate;
                        });
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  DropdownButton(
                    onChanged: (value) {
                      setState(() {
                        _dropdownValue = value!;
                      });
                    },
                    value: _dropdownValue,
                    items: Category.values.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name.toUpperCase()),
                        value: e,
                      );
                    }).toList(),
                  ),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}

                        // const snackBar = SnackBar(content: Text('Error'));
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // showDialog(
                        //   context: context,
                        //   builder: (ctx) => AlertDialog(
                        //     title: Text('Error'),
                        //     content: Text('No Data enter'),
                        //     actions: [
                        //       TextButton(
                        //         onPressed: () {
                        //           Navigator.pop(ctx);
                        //         },
                        //         child: Text('OK'),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                      child: Text(
                        'SaveExpense',
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      )),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
