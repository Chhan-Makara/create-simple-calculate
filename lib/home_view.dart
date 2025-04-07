import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var txtQty = TextEditingController();
  var txtPrice = TextEditingController();
  var txtTotal = TextEditingController();

  void setTotal() {
    if (txtQty.text == "") {
      txtPrice.text = "0";
    } else if (txtPrice.text == "") {
      txtTotal.text = "0";
    } else {
      txtTotal.text =
          "${double.parse(txtQty.text) * double.parse(txtPrice.text)}";
    }
  }

  void setClear() {
    txtQty.clear();
    txtPrice.clear();
    txtTotal.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple total")),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          Text("Qty"),
          TextField(
            onChanged: (e) {
              setTotal();
            },
            controller: txtQty,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 10),
          Text("Price"),
          TextField(
            onChanged: (e) {
              setTotal();
            },
            controller: txtPrice,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 10),
          Text("Total"),
          TextField(
            controller: txtTotal,
            readOnly: true,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setClear();
            },
            child: Text("Clear"),
          ),
        ],
      ),
    );
  }
}
