import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MoneyConv extends StatefulWidget {
  const MoneyConv({super.key});

  @override
  State<MoneyConv> createState() => _MoneyConvState();
}

class _MoneyConvState extends State<MoneyConv> {
  final IDRcontroller = TextEditingController();
  final USDcontroller = TextEditingController();
  final YENcontroller = TextEditingController();

  double idr = 0;
  double usd = 0;
  double yen = 0;

  String selectedValue = "idr";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("IDR"), value: "idr"),
      DropdownMenuItem(child: Text("USD"), value: "usd"),
      DropdownMenuItem(child: Text("YEN"), value: "yen"),
    ];
    return menuItems;
  }

  void konversi() {
    double? idrInput = double.tryParse(IDRcontroller.text);
    double? usdInput = double.tryParse(USDcontroller.text);
    double? yenInput = double.tryParse(YENcontroller.text);

    idrInput ??= 0;
    usdInput ??= 0;
    yenInput ??= 0;

    if (idrInput != 0) {
      usdInput = idrInput * 0.000067;
      yenInput = idrInput * 0.0093;
    } else if (usdInput != 0) {
      idrInput = usdInput * 14890.10;
      yenInput = usdInput * 138.26;
    } else if (yenInput != 0) {
      idrInput = yenInput * 107.75;
      usdInput = yenInput * 0.0072;
    }

    setState(() {
      idr = idrInput!;
      usd = usdInput!;
      yen = yenInput!;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TextFormField> fieldForm = [
      TextFormField(
        controller: IDRcontroller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: Text('Nilai dalam Rupiah'))
              ],
            ),
          ),
        ),
      ),
      TextFormField(
        controller: USDcontroller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: Text('Nilai dalam Dollar'))
              ],
            ),
          ),
        ),
      ),
      TextFormField(
        controller: YENcontroller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: Text('Nilai dalam Yen'))
              ],
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Konversi Mata Uang"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        items: dropdownItems,
                        onChanged: (str) => {
                          setState(() {
                            selectedValue = str!;
                          })
                        },
                        value: selectedValue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (selectedValue == "idr") fieldForm[0],
                if (selectedValue == "usd") fieldForm[1],
                if (selectedValue == "yen") fieldForm[2],
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      konversi();
                      IDRcontroller.text = "";
                      USDcontroller.text = "";
                      YENcontroller.text = "";
                    },
                    child: Text('konversikan')),
                SizedBox(
                  height: 20,
                ),
                Flex(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1 / 2.3,
                      child: Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "IDR",
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  idr.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  textAlign: TextAlign.start,
                                )
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1 / 2.3,
                      child: Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "USD",
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  usd.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  textAlign: TextAlign.start,
                                )
                              ],
                            ),
                          )),
                    )
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1 / 2.3,
                      child: Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "YEN",
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  yen.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  textAlign: TextAlign.start,
                                )
                              ],
                            ),
                          )),
                    )
                  ],
                )
              ]),
        ));
  }
}
