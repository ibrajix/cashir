import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_response.freezed.dart';
part 'home_response.g.dart';

HomeResponse homeResponseFromJson(String str) => HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

@freezed
class HomeResponse with _$HomeResponse {
  const factory HomeResponse({
    required Data data,
  }) = _HomeResponse;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required String first_name,
    required String last_name,
    required String account_balance,
    required String virtual_acct_no,
    required List<Transaction> transactions,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required String desc,
    required String type,
    required int amount,
    required String date,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}

