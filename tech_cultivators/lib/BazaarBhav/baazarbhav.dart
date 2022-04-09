import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class BaazarBhav extends StatefulWidget {
  const BaazarBhav({Key? key}) : super(key: key);

  @override
  State<BaazarBhav> createState() => _BaazarBhavState();
}

class _BaazarBhavState extends State<BaazarBhav> {
  List<String> commodity = [];
  List<String> arrival = [];
  List<String> price = [];
  @override
  void initState() {
    super.initState();
    getData();
    // getInfo();
  }

  void getInfo() async {
    final uri = Uri.https('tech-cultivators-api.herokuapp.com', 'bazaarbhav');
    var response = await http.get(uri);
    final json = jsonDecode(response.body);
    print(json['commodity']);
  }

  void getData() async {
    final response = await http.get(
      Uri.parse('https://www.msamb.com/'),
    );
    dom.Document document = parser.parse(response.body);
    var rows = document
        .getElementsByClassName('data-list')[0]
        .getElementsByTagName('tr');

    for (int i = 1; i < rows.length; i++) {
      var curr = rows[i].getElementsByTagName('td');
      commodity.add(curr[0].getElementsByTagName('a')[0].innerHtml);
      arrival.add(curr[1].innerHtml);
      price.add(curr[3].innerHtml);
    }
    setState(() {
      commodity;

      price;
      arrival;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Baazar Bhav",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          commodity.length <= 1
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : buildTable(),
        ],
      ),
    );
  }

  List<DataColumn> _createColumns(List<String> columns) {
    return [
      const DataColumn(
        label: Text(
          "Commodity",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
      const DataColumn(
        label: SizedBox(
          width: 90,
          child: Text(
            "Arrival (Qts)",
            style: TextStyle(fontSize: 13),
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          "Modal Price (Rs./Qtl)",
          style: TextStyle(fontSize: 13),
        ),
      ),
    ];
  }

  List<DataRow> _createRows() {
    List<DataRow> rows = [];
    for (int i = 0; i < commodity.length; i++) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Text(
                commodity[i],
              ),
            ),
            DataCell(
              Text(
                arrival[i],
              ),
            ),
            DataCell(
              Text(
                price[i],
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }

  Widget buildTable() {
    List<String> columns = [
      "Commodity",
      "Arrival (Qts)",
      "Modal Price (Rs./Qtl)"
    ];
    return DataTable(
      columns: _createColumns(columns),
      rows: _createRows(),
      columnSpacing: 25,
      dataRowHeight: 40,
      dataTextStyle: const TextStyle(
          fontSize: 10, color: Colors.black, fontWeight: FontWeight.w400),
    );
  }
}
