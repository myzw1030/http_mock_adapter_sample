import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockito_sample/models/movies_search_data/movies_list_data.dart';

part 'movies_search_data.freezed.dart';

part 'movies_search_data.g.dart';

@freezed
class MoviesSearchData with _$MoviesSearchData {
  const factory MoviesSearchData({
    @Default(1) int page,
    @JsonKey(name: 'total_pages') @Default(1) int totalPages,
    @Default(<MoviesListData>[]) List<MoviesListData> results,
  }) = _MoviesSearchData;

  factory MoviesSearchData.fromJson(Map<String, dynamic> json) =>
      _$MoviesSearchDataFromJson(json);
}
