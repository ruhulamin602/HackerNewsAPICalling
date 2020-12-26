import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/resources/news_api_provider.dart';

void main() {
  test('fetch top ids return a list of ids', () async {
    final apiPro = NewsApiProvider();

    apiPro.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });
    final ids = await apiPro.fetchTopIds();

    expect(ids, [1, 2, 3, 4]);
  });

  test('fetch item returns a item Model',() async{
    final apiPro= NewsApiProvider();
    apiPro.client = MockClient((request) async {
      return Response(json.encode({'id':4}), 200);
    });
    final item = await apiPro.fetchItems(1);
    
    expect(item.id, 4);
  });
}
