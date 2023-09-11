import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key})
      : super(
            key:
                key); // Here's the correct way to declare a constructor with an optional key.

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Vairables
  final _keyboard = GlobalKey<FormState>();
  int? _selectedValue;
  bool round = false;
  double amount = 0.00;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Me',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tip Me!!!'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
          child: SingleChildScrollView(
            child: Form(
              key: _keyboard,
              child: Builder(
                builder: (context) => Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 230,
                          child: TextFormField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d*')),
                            ],
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                icon: Icon(Icons.store),
                                labelText: 'Cost of Service'),
                          ),
                        ),
                        const SizedBox(
                            width: 230,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.room_service,
                                  color: Colors.green,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.all(15),
                                  child: Text("How was your service?"),
                                )
                              ],
                            )),
                        SizedBox(
                          width: 230,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: RadioListTile(
                                  title: const Text("Amazing (20%)"),
                                  value: 20,
                                  groupValue: _selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: RadioListTile(
                                  title: const Text("Good (18%)"),
                                  value: 18,
                                  groupValue: _selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: RadioListTile(
                                  title: const Text("Okey (15%)"),
                                  value: 15,
                                  groupValue: _selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: RadioListTile(
                                  title: const Text("Terrible (0%)"),
                                  value: 0,
                                  groupValue: _selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            child: Row(
                          children: [
                            const Icon(
                              Icons.credit_card,
                              color: Colors.green,
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.all(15),
                              child: Text("Round Tip to "),
                            ),
                            Expanded(child: Container()),
                            Switch(
                                value: round,
                                activeColor: Colors.green,
                                onChanged: (bool value) {
                                  setState(() {
                                    round = value;
                                    if (round && amount==0) {
                                      amount =
                                          amount - amount.floorToDouble() > .5
                                              ? amount.ceilToDouble()
                                              : amount.floorToDouble();
                                    } else {
                                      double inputValue =
                                          double.parse(_controller.text);
                                      double tipPercentage =
                                          (_selectedValue ?? 0) / 100;
                                      amount = inputValue +
                                          (inputValue * tipPercentage);
                                    }
                                  });
                                })
                          ],
                        )),
                        SizedBox(
                          width: 400,
                          child: ElevatedButton(
                            onPressed: () {
                              double inputValue =
                                  double.parse(_controller.text);
                              double tipPercentage =
                                  (_selectedValue ?? 0) / 100;
                              double total =
                                  inputValue + (inputValue * tipPercentage);

                              if (round) {
                                total = total.ceilToDouble();
                              }
                              setState(() {
                                amount = total;
                              });
                            },
                            child: const Text("CALCULATE"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                '''Total amount: \$${amount.toStringAsFixed(2)}''')
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
