import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart' as stellar;

import '../Screens/QR_generated_screen.dart';

final stellar.StellarSDK sdk = stellar.StellarSDK.TESTNET;
final network = stellar.Network.TESTNET;
Codec<String, String> stringToBase64 = utf8.fuse(base64);

Future<List<Widget>> getProducts(context) async {
  final sourceKeyPair = stellar.KeyPair.fromSecretSeed(
    "SD3WZVX7G4YCB3JM7ECNPDKADHJIXL5JOIU37B54TKGLXRLTRZA6LXA2",
  );

 
  String accountId = "GBGR2K2AIYSAHGTY7RXS35G666LACYSDWFUZDHSFPEKQEUER3K4YLD3P";
  List<Widget> cards = <Widget>[];
  List<Widget> text = <Widget>[];
  String itemKey = "";

  stellar.Page<stellar.OperationResponse> payments = await sdk.payments
      .forAccount(accountId)
      .limit(50)
      .order(stellar.RequestBuilderOrder.DESC)
      .execute();

  // print(payments.records);
  for (stellar.OperationResponse response in payments.records!) {
    if (response is stellar.CreateAccountOperationResponse) {
      stellar.CreateAccountOperationResponse por = response;
      if (por.transactionSuccessful! && por.account != accountId) {
        print("Transaction hash: ${por.account}");
        itemKey = por.account.toString();

        stellar.AccountResponse account =
            await sdk.accounts.account(por.account!);
        text.add(Text(
          itemKey,
          textAlign: TextAlign.left,
        ));

        for (String key in account.data!.keys) {
          text.add(Text(
            "$key: ${stringToBase64.decode(account.data![key])}",
            textAlign: TextAlign.left,
          ));
        }

        cards.add(GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QR_Generated_Screen(
                      publicKey: por.account.toString(),
                    )));
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: text,
              ),
            ),
          ),
        ));
      }
    }

    text = [];
  }
  // print(cards);

  return cards;
  // return newAccountKeyPair.accountId;
}
