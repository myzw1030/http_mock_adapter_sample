// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_list_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoviesListData _$MoviesListDataFromJson(Map<String, dynamic> json) {
  return _MoviesListData.fromJson(json);
}

/// @nodoc
mixin _$MoviesListData {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviesListDataCopyWith<MoviesListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesListDataCopyWith<$Res> {
  factory $MoviesListDataCopyWith(
          MoviesListData value, $Res Function(MoviesListData) then) =
      _$MoviesListDataCopyWithImpl<$Res, MoviesListData>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      @JsonKey(name: 'poster_path') String? posterPath});
}

/// @nodoc
class _$MoviesListDataCopyWithImpl<$Res, $Val extends MoviesListData>
    implements $MoviesListDataCopyWith<$Res> {
  _$MoviesListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? posterPath = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoviesListDataImplCopyWith<$Res>
    implements $MoviesListDataCopyWith<$Res> {
  factory _$$MoviesListDataImplCopyWith(_$MoviesListDataImpl value,
          $Res Function(_$MoviesListDataImpl) then) =
      __$$MoviesListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      @JsonKey(name: 'poster_path') String? posterPath});
}

/// @nodoc
class __$$MoviesListDataImplCopyWithImpl<$Res>
    extends _$MoviesListDataCopyWithImpl<$Res, _$MoviesListDataImpl>
    implements _$$MoviesListDataImplCopyWith<$Res> {
  __$$MoviesListDataImplCopyWithImpl(
      _$MoviesListDataImpl _value, $Res Function(_$MoviesListDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? posterPath = freezed,
  }) {
    return _then(_$MoviesListDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoviesListDataImpl extends _MoviesListData {
  const _$MoviesListDataImpl(
      {this.id, this.title, @JsonKey(name: 'poster_path') this.posterPath})
      : super._();

  factory _$MoviesListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoviesListDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @override
  String toString() {
    return 'MoviesListData(id: $id, title: $title, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesListDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, posterPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesListDataImplCopyWith<_$MoviesListDataImpl> get copyWith =>
      __$$MoviesListDataImplCopyWithImpl<_$MoviesListDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoviesListDataImplToJson(
      this,
    );
  }
}

abstract class _MoviesListData extends MoviesListData {
  const factory _MoviesListData(
          {final int? id,
          final String? title,
          @JsonKey(name: 'poster_path') final String? posterPath}) =
      _$MoviesListDataImpl;
  const _MoviesListData._() : super._();

  factory _MoviesListData.fromJson(Map<String, dynamic> json) =
      _$MoviesListDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(ignore: true)
  _$$MoviesListDataImplCopyWith<_$MoviesListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
