import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetMNMCall {
  static Future<ApiCallResponse> call({
    String? authtoken = '',
    String? firstname = '',
    String? lastname = '',
    String? email = '',
    String? status2 = '',
    String? sortID = '',
    String? order = '',
    int? nextPage,
    int? numLoadedItems,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMNM',
      apiUrl: 'https://dm858f7bhd.execute-api.us-east-1.amazonaws.com/dbcall',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authtoken}',
      },
      params: {
        'firstName': firstname,
        'lastName': lastname,
        'email': email,
        'status2': status2,
        'sortID': sortID,
        'order': order,
        'nextPage': nextPage,
        'numLoaded': numLoadedItems,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic allCustomers(dynamic response) => getJsonField(
        response,
        r'''$..first_name''',
        true,
      );
  static dynamic allRecords(dynamic response) => getJsonField(
        response,
        r'''$.recordsets''',
        true,
      );
  static dynamic allemail(dynamic response) => getJsonField(
        response,
        r'''$.recordsets[:][:].email''',
        true,
      );
  static dynamic allfirst(dynamic response) => getJsonField(
        response,
        r'''$.recordsets[:][:].first_name''',
        true,
      );
  static dynamic alllast(dynamic response) => getJsonField(
        response,
        r'''$.recordsets[:][:].last_name''',
        true,
      );
  static dynamic allprintstat(dynamic response) => getJsonField(
        response,
        r'''$.recordsets[:][:].print_status''',
        true,
      );
}

class SignInCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) {
    final body = '''
{
"username":"${username}",
"password":"${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sign In',
      apiUrl:
          'https://kflg0vpg7d.execute-api.us-east-1.amazonaws.com/dev/signin',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
