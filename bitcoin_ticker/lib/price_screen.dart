import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/services/exchangeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  bool isWaiting = false;
  Map<String, String> coinValues = {};
  String selectedCurrency = 'USD';

  ExchangeService exchangeService = ExchangeService();
  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> items = [];

    for (String currency in currenciesList) {
      items.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: items,
      onChanged: (value) {
        setState(() {
          if (value != null) {
            selectedCurrency = value;
            getData();
          }
        });
      },
    );
  }
  CupertinoPicker getCupertinoPicker() {

    List<Text> allCurrencies = [];
    for (String currency in currenciesList) {
      allCurrencies.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency=allCurrencies[selectedIndex].data!;
          getData();
        });
      },
      children: allCurrencies,
    );
  }



  List<Widget> createCards() {

    List<Widget> cards = [];
    for(String crypto in cryptoList){
      cards.add(CryptoCard(selectedCurrency: this.selectedCurrency, cryptoCurrency: crypto, value: isWaiting ? '?' : coinValues[crypto]!));
    }
    return cards;
  }



  void getData() async {
    isWaiting = true;
    try{
      var data = await exchangeService.getExchangeRate(selectedCurrency);
      setState(() {
        coinValues = data;
        isWaiting = false;
      });

    }catch(e){
      print('hiba a getData()-ban $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🤑 Coin Ticker',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: createCards()
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getCupertinoPicker(): getDropdownButton(),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({required this.selectedCurrency, required this.cryptoCurrency, required this.value});

  final String selectedCurrency;
  final String cryptoCurrency;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
        child: Text(
          '1$cryptoCurrency = $value $selectedCurrency',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
