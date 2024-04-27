import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyExchangeScreen extends StatefulWidget {
  @override
  _CurrencyExchangeScreenState createState() => _CurrencyExchangeScreenState();
}

class _CurrencyExchangeScreenState extends State<CurrencyExchangeScreen> {
  Map<String, dynamic> rates = {};

  Future<void> getExchangeRates() async {
    // هنا عنوان URL لل-API الذي يقدم بيانات العملة، يجب استبداله بعنوان API الفعلي الذي تستخدمه
    const url =
        'http://api.exchangeratesapi.io/latest?base=TRY&symbols=USD,SYR';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> currencyData = json.decode(response.body);
      setState(() {
        rates = currencyData['rates'];
      });
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }

  @override
  void initState() {
    super.initState();
    getExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أسعار العملات مقابل الليرة السورية'),
      ),
      body: rates != null
          ? ListView.builder(
              itemCount: rates.length,
              itemBuilder: (context, index) {
                String key = rates.keys.elementAt(index);
                return ListTile(
                  title: Text(key),
                  trailing: Text('${rates[key]}'),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
