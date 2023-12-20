import 'package:mockito_sample/models/movies_search_data/movies_search_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class TmdbApiClient {
  factory TmdbApiClient(Dio dio, {String baseUrl}) = _TmdbApiClient;

  // 検索時の映画の一覧情報
  @GET('search/movie')
  Future<MoviesSearchData> fetchSearchMoviesItems(
    @Query('query') String searchQuery, {
    @Query('page') int page = 1,
    @Query('language') String language = 'ja-JA',
  });
}
