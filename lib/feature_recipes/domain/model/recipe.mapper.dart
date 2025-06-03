// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipe.dart';

class RecipeMapper extends ClassMapperBase<Recipe> {
  RecipeMapper._();

  static RecipeMapper? _instance;
  static RecipeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipeMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Recipe';

  static String _$id(Recipe v) => v.id;
  static const Field<Recipe, String> _f$id = Field('id', _$id);
  static String _$name(Recipe v) => v.name;
  static const Field<Recipe, String> _f$name = Field('name', _$name);
  static String _$tumb(Recipe v) => v.tumb;
  static const Field<Recipe, String> _f$tumb = Field('tumb', _$tumb);
  static String _$tags(Recipe v) => v.tags;
  static const Field<Recipe, String> _f$tags = Field('tags', _$tags);
  static String _$videoLink(Recipe v) => v.videoLink;
  static const Field<Recipe, String> _f$videoLink =
      Field('videoLink', _$videoLink);
  static String _$category(Recipe v) => v.category;
  static const Field<Recipe, String> _f$category =
      Field('category', _$category);
  static String _$area(Recipe v) => v.area;
  static const Field<Recipe, String> _f$area = Field('area', _$area);
  static String _$mealAlternate(Recipe v) => v.mealAlternate;
  static const Field<Recipe, String> _f$mealAlternate =
      Field('mealAlternate', _$mealAlternate);
  static String _$instructions(Recipe v) => v.instructions;
  static const Field<Recipe, String> _f$instructions =
      Field('instructions', _$instructions);
  static List<String> _$ingredients(Recipe v) => v.ingredients;
  static const Field<Recipe, List<String>> _f$ingredients =
      Field('ingredients', _$ingredients);
  static List<String> _$measures(Recipe v) => v.measures;
  static const Field<Recipe, List<String>> _f$measures =
      Field('measures', _$measures);

  @override
  final MappableFields<Recipe> fields = const {
    #id: _f$id,
    #name: _f$name,
    #tumb: _f$tumb,
    #tags: _f$tags,
    #videoLink: _f$videoLink,
    #category: _f$category,
    #area: _f$area,
    #mealAlternate: _f$mealAlternate,
    #instructions: _f$instructions,
    #ingredients: _f$ingredients,
    #measures: _f$measures,
  };

  static Recipe _instantiate(DecodingData data) {
    return Recipe(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        tumb: data.dec(_f$tumb),
        tags: data.dec(_f$tags),
        videoLink: data.dec(_f$videoLink),
        category: data.dec(_f$category),
        area: data.dec(_f$area),
        mealAlternate: data.dec(_f$mealAlternate),
        instructions: data.dec(_f$instructions),
        ingredients: data.dec(_f$ingredients),
        measures: data.dec(_f$measures));
  }

  @override
  final Function instantiate = _instantiate;

  static Recipe fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Recipe>(map);
  }

  static Recipe fromJson(String json) {
    return ensureInitialized().decodeJson<Recipe>(json);
  }
}

mixin RecipeMappable {
  String toJson() {
    return RecipeMapper.ensureInitialized().encodeJson<Recipe>(this as Recipe);
  }

  Map<String, dynamic> toMap() {
    return RecipeMapper.ensureInitialized().encodeMap<Recipe>(this as Recipe);
  }

  RecipeCopyWith<Recipe, Recipe, Recipe> get copyWith =>
      _RecipeCopyWithImpl<Recipe, Recipe>(this as Recipe, $identity, $identity);
  @override
  String toString() {
    return RecipeMapper.ensureInitialized().stringifyValue(this as Recipe);
  }

  @override
  bool operator ==(Object other) {
    return RecipeMapper.ensureInitialized().equalsValue(this as Recipe, other);
  }

  @override
  int get hashCode {
    return RecipeMapper.ensureInitialized().hashValue(this as Recipe);
  }
}

extension RecipeValueCopy<$R, $Out> on ObjectCopyWith<$R, Recipe, $Out> {
  RecipeCopyWith<$R, Recipe, $Out> get $asRecipe =>
      $base.as((v, t, t2) => _RecipeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipeCopyWith<$R, $In extends Recipe, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get ingredients;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get measures;
  $R call(
      {String? id,
      String? name,
      String? tumb,
      String? tags,
      String? videoLink,
      String? category,
      String? area,
      String? mealAlternate,
      String? instructions,
      List<String>? ingredients,
      List<String>? measures});
  RecipeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipeCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Recipe, $Out>
    implements RecipeCopyWith<$R, Recipe, $Out> {
  _RecipeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Recipe> $mapper = RecipeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get ingredients => ListCopyWith(
          $value.ingredients,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(ingredients: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get measures =>
      ListCopyWith($value.measures, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(measures: v));
  @override
  $R call(
          {String? id,
          String? name,
          String? tumb,
          String? tags,
          String? videoLink,
          String? category,
          String? area,
          String? mealAlternate,
          String? instructions,
          List<String>? ingredients,
          List<String>? measures}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (tumb != null) #tumb: tumb,
        if (tags != null) #tags: tags,
        if (videoLink != null) #videoLink: videoLink,
        if (category != null) #category: category,
        if (area != null) #area: area,
        if (mealAlternate != null) #mealAlternate: mealAlternate,
        if (instructions != null) #instructions: instructions,
        if (ingredients != null) #ingredients: ingredients,
        if (measures != null) #measures: measures
      }));
  @override
  Recipe $make(CopyWithData data) => Recipe(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      tumb: data.get(#tumb, or: $value.tumb),
      tags: data.get(#tags, or: $value.tags),
      videoLink: data.get(#videoLink, or: $value.videoLink),
      category: data.get(#category, or: $value.category),
      area: data.get(#area, or: $value.area),
      mealAlternate: data.get(#mealAlternate, or: $value.mealAlternate),
      instructions: data.get(#instructions, or: $value.instructions),
      ingredients: data.get(#ingredients, or: $value.ingredients),
      measures: data.get(#measures, or: $value.measures));

  @override
  RecipeCopyWith<$R2, Recipe, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
