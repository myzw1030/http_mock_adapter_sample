import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito_sample/api/api_client.dart';
import 'package:mockito_sample/models/movies_search_data/movies_search_data.dart';

import 'fixture.dart';

void main() {
  group('TmdbApiClient Tests', () {
    late Dio dio;
    late DioAdapter dioAdapter;
    late TmdbApiClient apiClient;
    // 各テストケースが実行される前に行う初期設定
    setUp(() async {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      apiClient = TmdbApiClient(dio);
    });
    // 映画データを返すことをテスト
    test('fetchSearchMOviesItems returns movies data', () async {
      // スタブデータ
      final mockResponse = fixture('movies_search.json');
      // 呼び出されたときに、成功したレスポンスを返すように設定
      dioAdapter.onGet(
        'search/movie',
        (server) => server.reply(200, jsonDecode(mockResponse)),
        queryParameters: {
          'query': 'ゴジラ',
          'language': 'ja-JA',
          'page': 1,
        },
      );
      // 返された結果が MoviesSearchData型であることを検証
      final result = await apiClient.fetchSearchMoviesItems('ゴジラ');
      expect(result, isA<MoviesSearchData>());
      expect(result.results, isNotEmpty);
    });

    // エラーケース
    test('fetchSearchMOviesItems 404 Error', () async {
      // 呼び出されたときに、成功したレスポンスを返すように設定
      dioAdapter.onGet(
        'search/movie',
        (server) => server.reply(404, {'message': 'Not Found'}),
        queryParameters: {
          'query': 'ああああああああああ',
          'language': 'ja-JA',
          'page': 1,
        },
      );
      // APIメソッドがエラーを投げることを検証
      try {
        await apiClient.fetchSearchMoviesItems('ああああああああああ');
      } catch (e) {
        if (e is DioException) {
          print('Caught DioError: ${e.response?.data}');
        } else {
          rethrow;
        }
      }
    });
  });
}
