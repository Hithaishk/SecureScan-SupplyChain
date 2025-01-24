import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart' as stellar;

final stellar.StellarSDK sdk = stellar.StellarSDK.TESTNET;
final network = stellar.Network.TESTNET;
Codec<String, String> stringToBase64 = utf8.fuse(base64);

Future<List<Widget>> getQRProducts(accountId) async {
  final sourceKeyPair = stellar.KeyPair.fromSecretSeed(
    "SD3WZVX7G4YCB3JM7ECNPDKADHJIXL5JOIU37B54TKGLXRLTRZA6LXA2",
  );

  //GA7GMOVYB6QLXHKXVVTSZR3XOHM3KBCPLDV5YKSZAP4P56IYOAK6DPSO - Public Key
  // print("response");

  List<Widget> text = <Widget>[];
  String itemKey = "";

  // print(cards);

  stellar.AccountResponse account = await sdk.accounts.account(accountId);
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

  return text;
  // return newAccountKeyPair.accountId;
}
