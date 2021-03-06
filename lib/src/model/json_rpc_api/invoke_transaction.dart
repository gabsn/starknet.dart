import 'package:freezed_annotation/freezed_annotation.dart';

import 'function_call.dart';
import 'json_rpc_api_error.dart';

part 'invoke_transaction.freezed.dart';
part 'invoke_transaction.g.dart';

@freezed
class InvokeTransaction with _$InvokeTransaction {
  const factory InvokeTransaction.result({
    required InvokeTransactionResponseResult result,
  }) = InvokeTransactionResult;
  const factory InvokeTransaction.error({
    required JsonRpcApiError error,
  }) = InvokeTransactionError;

  factory InvokeTransaction.fromJson(Map<String, Object?> json) =>
      json.containsKey('error')
          ? InvokeTransactionError.fromJson(json)
          : InvokeTransactionResult.fromJson(json);
}

@freezed
class InvokeTransactionRequest with _$InvokeTransactionRequest {
  const factory InvokeTransactionRequest({
    required FunctionCall functionInvocation,
    required List<String> signature,
    required String maxFee,
    required String version,
  }) = _InvokeTransactionRequest;

  factory InvokeTransactionRequest.fromJson(Map<String, Object?> json) =>
      _$InvokeTransactionRequestFromJson(json);
}

@freezed
class InvokeTransactionResponseResult with _$InvokeTransactionResponseResult {
  const factory InvokeTransactionResponseResult({
    required String transaction_hash,
  }) = _InvokeTransactionResponseResult;

  factory InvokeTransactionResponseResult.fromJson(Map<String, Object?> json) =>
      _$InvokeTransactionResponseResultFromJson(json);
}
