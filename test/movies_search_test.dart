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
    test('fetchSearchMOviesItems moviesSearchData', () async {
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
      // 返された結果が MoviesSearchData型であることを検証
      expect(result, isA<MoviesSearchData>());
      // レスポンスデータの検証
      expect(result.results, isNotEmpty);
      for (var movie in result.results) {
        expect(movie.id, isNotNull);
        expect(movie.id, isA<int>());
        expect(movie.title, isNotNull);
        expect(movie.title, isA<String>());
        expect(movie.posterPath, isNotNull);
        expect(movie.posterPath, isA<String>());
      }
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
