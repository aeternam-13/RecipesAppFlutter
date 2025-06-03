// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipes_state_holder.dart';

class RecipesStateHolderMapper extends ClassMapperBase<RecipesStateHolder> {
  RecipesStateHolderMapper._();

  static RecipesStateHolderMapper? _instance;
  static RecipesStateHolderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesStateHolderMapper._());
      RecipeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesStateHolder';

  static Set<String> _$favorites(RecipesStateHolder v) => v.favorites;
  static const Field<RecipesStateHolder, Set<String>> _f$favorites =
      Field('favorites', _$favorites);
  static List<Recipe> _$recipes(RecipesStateHolder v) => v.recipes;
  static const Field<RecipesStateHolder, List<Recipe>> _f$recipes =
      Field('recipes', _$recipes);

  @override
  final MappableFields<RecipesStateHolder> fields = const {
    #favorites: _f$favorites,
    #recipes: _f$recipes,
  };

  static RecipesStateHolder _instantiate(DecodingData data) {
    return RecipesStateHolder(
        favorites: data.dec(_f$favorites), recipes: data.dec(_f$recipes));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesStateHolder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesStateHolder>(map);
  }

  static RecipesStateHolder fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesStateHolder>(json);
  }
}

mixin RecipesStateHolderMappable {
  String toJson() {
    return RecipesStateHolderMapper.ensureInitialized()
        .encodeJson<RecipesStateHolder>(this as RecipesStateHolder);
  }

  Map<String, dynamic> toMap() {
    return RecipesStateHolderMapper.ensureInitialized()
        .encodeMap<RecipesStateHolder>(this as RecipesStateHolder);
  }

  RecipesStateHolderCopyWith<RecipesStateHolder, RecipesStateHolder,
          RecipesStateHolder>
      get copyWith => _RecipesStateHolderCopyWithImpl<RecipesStateHolder,
          RecipesStateHolder>(this as RecipesStateHolder, $identity, $identity);
  @override
  String toString() {
    return RecipesStateHolderMapper.ensureInitialized()
        .stringifyValue(this as RecipesStateHolder);
  }

  @override
  bool operator ==(Object other) {
    return RecipesStateHolderMapper.ensureInitialized()
        .equalsValue(this as RecipesStateHolder, other);
  }

  @override
  int get hashCode {
    return RecipesStateHolderMapper.ensureInitialized()
        .hashValue(this as RecipesStateHolder);
  }
}

extension RecipesStateHolderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RecipesStateHolder, $Out> {
  RecipesStateHolderCopyWith<$R, RecipesStateHolder, $Out>
      get $asRecipesStateHolder => $base.as(
          (v, t, t2) => _RecipesStateHolderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesStateHolderCopyWith<$R, $In extends RecipesStateHolder,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Recipe, RecipeCopyWith<$R, Recipe, Recipe>> get recipes;
  $R call({Set<String>? favorites, List<Recipe>? recipes});
  RecipesStateHolderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RecipesStateHolderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RecipesStateHolder, $Out>
    implements RecipesStateHolderCopyWith<$R, RecipesStateHolder, $Out> {
  _RecipesStateHolderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesStateHolder> $mapper =
      RecipesStateHolderMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Recipe, RecipeCopyWith<$R, Recipe, Recipe>> get recipes =>
      ListCopyWith($value.recipes, (v, t) => v.copyWith.$chain(t),
          (v) => call(recipes: v));
  @override
  $R call({Set<String>? favorites, List<Recipe>? recipes}) =>
      $apply(FieldCopyWithData({
        if (favorites != null) #favorites: favorites,
        if (recipes != null) #recipes: recipes
      }));
  @override
  RecipesStateHolder $make(CopyWithData data) => RecipesStateHolder(
      favorites: data.get(#favorites, or: $value.favorites),
      recipes: data.get(#recipes, or: $value.recipes));

  @override
  RecipesStateHolderCopyWith<$R2, RecipesStateHolder, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RecipesStateHolderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
