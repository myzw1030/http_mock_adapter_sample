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
    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      apiClient = TmdbApiClient(dio);
    });
    // 映画データを返すことをテスト
    test('fetchSearchMoviesItems returns MoviesSearchData for valid response',
        () async {
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
      // APIクライアントを通じてデータを取得
      final result = await apiClient.fetchSearchMoviesItems('ゴジラ');
      // レスポンスが MoviesSearchData型であることを検証
      expect(result, isA<MoviesSearchData>());
    });

    test('fetchSearchMoviesItems throws error for 404 response', () async {
      // 呼び出されたときに、成功したレスポンスを返すように設定
      dioAdapter.onGet(
        'search/movie',
        (server) => server.reply(404, {'message': 'Not Found'}),
        queryParameters: {
          'query': 'モニラ',
          'language': 'ja-JA',
          'page': 1,
        },
      );
      // APIメソッドがエラーを投げることを検証
      expect(() async => await apiClient.fetchSearchMoviesItems('モニラ'),
          throwsA(isA<DioException>()));
    });
  });
}
