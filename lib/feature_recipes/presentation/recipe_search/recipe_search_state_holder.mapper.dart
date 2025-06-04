// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipe_search_state_holder.dart';

class RecipeSearchStateHolderMapper
    extends ClassMapperBase<RecipeSearchStateHolder> {
  RecipeSearchStateHolderMapper._();

  static RecipeSearchStateHolderMapper? _instance;
  static RecipeSearchStateHolderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = RecipeSearchStateHolderMapper._());
      RecipeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipeSearchStateHolder';

  static List<Recipe> _$filtered(RecipeSearchStateHolder v) => v.filtered;
  static const Field<RecipeSearchStateHolder, List<Recipe>> _f$filtered =
      Field('filtered', _$filtered);
  static List<Recipe> _$allRecipes(RecipeSearchStateHolder v) => v.allRecipes;
  static const Field<RecipeSearchStateHolder, List<Recipe>> _f$allRecipes =
      Field('allRecipes', _$allRecipes);
  static String _$value(RecipeSearchStateHolder v) => v.value;
  static const Field<RecipeSearchStateHolder, String> _f$value =
      Field('value', _$value);
  static Set<String> _$favorites(RecipeSearchStateHolder v) => v.favorites;
  static const Field<RecipeSearchStateHolder, Set<String>> _f$favorites =
      Field('favorites', _$favorites);

  @override
  final MappableFields<RecipeSearchStateHolder> fields = const {
    #filtered: _f$filtered,
    #allRecipes: _f$allRecipes,
    #value: _f$value,
    #favorites: _f$favorites,
  };

  static RecipeSearchStateHolder _instantiate(DecodingData data) {
    return RecipeSearchStateHolder(
        filtered: data.dec(_f$filtered),
        allRecipes: data.dec(_f$allRecipes),
        value: data.dec(_f$value),
        favorites: data.dec(_f$favorites));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipeSearchStateHolder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipeSearchStateHolder>(map);
  }

  static RecipeSearchStateHolder fromJson(String json) {
    return ensureInitialized().decodeJson<RecipeSearchStateHolder>(json);
  }
}

mixin RecipeSearchStateHolderMappable {
  String toJson() {
    return RecipeSearchStateHolderMapper.ensureInitialized()
        .encodeJson<RecipeSearchStateHolder>(this as RecipeSearchStateHolder);
  }

  Map<String, dynamic> toMap() {
    return RecipeSearchStateHolderMapper.ensureInitialized()
        .encodeMap<RecipeSearchStateHolder>(this as RecipeSearchStateHolder);
  }

  RecipeSearchStateHolderCopyWith<RecipeSearchStateHolder,
          RecipeSearchStateHolder, RecipeSearchStateHolder>
      get copyWith => _RecipeSearchStateHolderCopyWithImpl<
              RecipeSearchStateHolder, RecipeSearchStateHolder>(
          this as RecipeSearchStateHolder, $identity, $identity);
  @override
  String toString() {
    return RecipeSearchStateHolderMapper.ensureInitialized()
        .stringifyValue(this as RecipeSearchStateHolder);
  }

  @override
  bool operator ==(Object other) {
    return RecipeSearchStateHolderMapper.ensureInitialized()
        .equalsValue(this as RecipeSearchStateHolder, other);
  }

  @override
  int get hashCode {
    return RecipeSearchStateHolderMapper.ensureInitialized()
        .hashValue(this as RecipeSearchStateHolder);
  }
}

extension RecipeSearchStateHolderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RecipeSearchStateHolder, $Out> {
  RecipeSearchStateHolderCopyWith<$R, RecipeSearchStateHolder, $Out>
      get $asRecipeSearchStateHolder => $base.as((v, t, t2) =>
          _RecipeSearchStateHolderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipeSearchStateHolderCopyWith<
    $R,
    $In extends RecipeSearchStateHolder,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Recipe, RecipeCopyWith<$R, Recipe, Recipe>> get filtered;
  ListCopyWith<$R, Recipe, RecipeCopyWith<$R, Recipe, Recipe>> get allRecipes;
  $R call(
      {List<Recipe>? filtered,
      List<Recipe>? allRecipes,
      String? value,
      Set<String>? favorites});
  RecipeSearchStateHolderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RecipeSearchStateHolderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RecipeSearchStateHolder, $Out>
    implements
        RecipeSearchStateHolderCopyWith<$R, RecipeSearchStateHolder, $Out> {
  _RecipeSearchStateHolderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipeSearchStateHolder> $mapper =
      RecipeSearchStateHolderMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Recipe, RecipeCopyWith<$R, Recipe, Recipe>> get filtered =>
      ListCopyWith($value.filtered, (v, t) => v.copyWith.$chain(t),
          (v) => call(filtered: v));
  @override
  ListCopyWith<$R, Recipe, RecipeCopyWith<$R, Recipe, Recipe>> get allRecipes =>
      ListCopyWith($value.allRecipes, (v, t) => v.copyWith.$chain(t),
          (v) => call(allRecipes: v));
  @override
  $R call(
          {List<Recipe>? filtered,
          List<Recipe>? allRecipes,
          String? value,
          Set<String>? favorites}) =>
      $apply(FieldCopyWithData({
        if (filtered != null) #filtered: filtered,
        if (allRecipes != null) #allRecipes: allRecipes,
        if (value != null) #value: value,
        if (favorites != null) #favorites: favorites
      }));
  @override
  RecipeSearchStateHolder $make(CopyWithData data) => RecipeSearchStateHolder(
      filtered: data.get(#filtered, or: $value.filtered),
      allRecipes: data.get(#allRecipes, or: $value.allRecipes),
      value: data.get(#value, or: $value.value),
      favorites: data.get(#favorites, or: $value.favorites));

  @override
  RecipeSearchStateHolderCopyWith<$R2, RecipeSearchStateHolder, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _RecipeSearchStateHolderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
