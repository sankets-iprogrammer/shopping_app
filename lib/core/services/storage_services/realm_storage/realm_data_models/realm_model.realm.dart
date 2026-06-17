// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class RealmDimensionModel extends _RealmDimensionModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmDimensionModel({double? width, double? height, double? depth}) {
    RealmObjectBase.set(this, 'width', width);
    RealmObjectBase.set(this, 'height', height);
    RealmObjectBase.set(this, 'depth', depth);
  }

  RealmDimensionModel._();

  @override
  double? get width => RealmObjectBase.get<double>(this, 'width') as double?;
  @override
  set width(double? value) => RealmObjectBase.set(this, 'width', value);

  @override
  double? get height => RealmObjectBase.get<double>(this, 'height') as double?;
  @override
  set height(double? value) => RealmObjectBase.set(this, 'height', value);

  @override
  double? get depth => RealmObjectBase.get<double>(this, 'depth') as double?;
  @override
  set depth(double? value) => RealmObjectBase.set(this, 'depth', value);

  @override
  Stream<RealmObjectChanges<RealmDimensionModel>> get changes =>
      RealmObjectBase.getChanges<RealmDimensionModel>(this);

  @override
  Stream<RealmObjectChanges<RealmDimensionModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<RealmDimensionModel>(this, keyPaths);

  @override
  RealmDimensionModel freeze() =>
      RealmObjectBase.freezeObject<RealmDimensionModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'width': width.toEJson(),
      'height': height.toEJson(),
      'depth': depth.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmDimensionModel value) => value.toEJson();
  static RealmDimensionModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return RealmDimensionModel(
      width: fromEJson(ejson['width']),
      height: fromEJson(ejson['height']),
      depth: fromEJson(ejson['depth']),
    );
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmDimensionModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      RealmDimensionModel,
      'RealmDimensionModel',
      [
        SchemaProperty('width', RealmPropertyType.double, optional: true),
        SchemaProperty('height', RealmPropertyType.double, optional: true),
        SchemaProperty('depth', RealmPropertyType.double, optional: true),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class RealmMeta extends _RealmMeta
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmMeta({
    String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode,
  }) {
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'barcode', barcode);
    RealmObjectBase.set(this, 'qrCode', qrCode);
  }

  RealmMeta._();

  @override
  String? get createdAt =>
      RealmObjectBase.get<String>(this, 'createdAt') as String?;
  @override
  set createdAt(String? value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  String? get updatedAt =>
      RealmObjectBase.get<String>(this, 'updatedAt') as String?;
  @override
  set updatedAt(String? value) => RealmObjectBase.set(this, 'updatedAt', value);

  @override
  String? get barcode =>
      RealmObjectBase.get<String>(this, 'barcode') as String?;
  @override
  set barcode(String? value) => RealmObjectBase.set(this, 'barcode', value);

  @override
  String? get qrCode => RealmObjectBase.get<String>(this, 'qrCode') as String?;
  @override
  set qrCode(String? value) => RealmObjectBase.set(this, 'qrCode', value);

  @override
  Stream<RealmObjectChanges<RealmMeta>> get changes =>
      RealmObjectBase.getChanges<RealmMeta>(this);

  @override
  Stream<RealmObjectChanges<RealmMeta>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<RealmMeta>(this, keyPaths);

  @override
  RealmMeta freeze() => RealmObjectBase.freezeObject<RealmMeta>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'createdAt': createdAt.toEJson(),
      'updatedAt': updatedAt.toEJson(),
      'barcode': barcode.toEJson(),
      'qrCode': qrCode.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmMeta value) => value.toEJson();
  static RealmMeta _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return RealmMeta(
      createdAt: fromEJson(ejson['createdAt']),
      updatedAt: fromEJson(ejson['updatedAt']),
      barcode: fromEJson(ejson['barcode']),
      qrCode: fromEJson(ejson['qrCode']),
    );
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmMeta._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, RealmMeta, 'RealmMeta', [
      SchemaProperty('createdAt', RealmPropertyType.string, optional: true),
      SchemaProperty('updatedAt', RealmPropertyType.string, optional: true),
      SchemaProperty('barcode', RealmPropertyType.string, optional: true),
      SchemaProperty('qrCode', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class RealmReviewModel extends _RealmReviewModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmReviewModel({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'comment', comment);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'reviewerName', reviewerName);
    RealmObjectBase.set(this, 'reviewerEmail', reviewerEmail);
  }

  RealmReviewModel._();

  @override
  int? get rating => RealmObjectBase.get<int>(this, 'rating') as int?;
  @override
  set rating(int? value) => RealmObjectBase.set(this, 'rating', value);

  @override
  String? get comment =>
      RealmObjectBase.get<String>(this, 'comment') as String?;
  @override
  set comment(String? value) => RealmObjectBase.set(this, 'comment', value);

  @override
  String? get date => RealmObjectBase.get<String>(this, 'date') as String?;
  @override
  set date(String? value) => RealmObjectBase.set(this, 'date', value);

  @override
  String? get reviewerName =>
      RealmObjectBase.get<String>(this, 'reviewerName') as String?;
  @override
  set reviewerName(String? value) =>
      RealmObjectBase.set(this, 'reviewerName', value);

  @override
  String? get reviewerEmail =>
      RealmObjectBase.get<String>(this, 'reviewerEmail') as String?;
  @override
  set reviewerEmail(String? value) =>
      RealmObjectBase.set(this, 'reviewerEmail', value);

  @override
  Stream<RealmObjectChanges<RealmReviewModel>> get changes =>
      RealmObjectBase.getChanges<RealmReviewModel>(this);

  @override
  Stream<RealmObjectChanges<RealmReviewModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<RealmReviewModel>(this, keyPaths);

  @override
  RealmReviewModel freeze() =>
      RealmObjectBase.freezeObject<RealmReviewModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'rating': rating.toEJson(),
      'comment': comment.toEJson(),
      'date': date.toEJson(),
      'reviewerName': reviewerName.toEJson(),
      'reviewerEmail': reviewerEmail.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmReviewModel value) => value.toEJson();
  static RealmReviewModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return RealmReviewModel(
      rating: fromEJson(ejson['rating']),
      comment: fromEJson(ejson['comment']),
      date: fromEJson(ejson['date']),
      reviewerName: fromEJson(ejson['reviewerName']),
      reviewerEmail: fromEJson(ejson['reviewerEmail']),
    );
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmReviewModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      RealmReviewModel,
      'RealmReviewModel',
      [
        SchemaProperty('rating', RealmPropertyType.int, optional: true),
        SchemaProperty('comment', RealmPropertyType.string, optional: true),
        SchemaProperty('date', RealmPropertyType.string, optional: true),
        SchemaProperty(
          'reviewerName',
          RealmPropertyType.string,
          optional: true,
        ),
        SchemaProperty(
          'reviewerEmail',
          RealmPropertyType.string,
          optional: true,
        ),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class RealmProductModel extends _RealmProductModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmProductModel(
    int id, {
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    Iterable<String> tags = const [],
    String? brand,
    String? sku,
    int? weight,
    RealmDimensionModel? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    Iterable<RealmReviewModel> reviews = const [],
    String? returnPolicy,
    int? minimumOrderQuantity,
    RealmMeta? meta,
    String? thumbnail,
    Iterable<String> images = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'discountPercentage', discountPercentage);
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'stock', stock);
    RealmObjectBase.set<RealmList<String>>(
      this,
      'tags',
      RealmList<String>(tags),
    );
    RealmObjectBase.set(this, 'brand', brand);
    RealmObjectBase.set(this, 'sku', sku);
    RealmObjectBase.set(this, 'weight', weight);
    RealmObjectBase.set(this, 'dimensions', dimensions);
    RealmObjectBase.set(this, 'warrantyInformation', warrantyInformation);
    RealmObjectBase.set(this, 'shippingInformation', shippingInformation);
    RealmObjectBase.set(this, 'availabilityStatus', availabilityStatus);
    RealmObjectBase.set<RealmList<RealmReviewModel>>(
      this,
      'reviews',
      RealmList<RealmReviewModel>(reviews),
    );
    RealmObjectBase.set(this, 'returnPolicy', returnPolicy);
    RealmObjectBase.set(this, 'minimumOrderQuantity', minimumOrderQuantity);
    RealmObjectBase.set(this, 'meta', meta);
    RealmObjectBase.set(this, 'thumbnail', thumbnail);
    RealmObjectBase.set<RealmList<String>>(
      this,
      'images',
      RealmList<String>(images),
    );
  }

  RealmProductModel._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get category =>
      RealmObjectBase.get<String>(this, 'category') as String?;
  @override
  set category(String? value) => RealmObjectBase.set(this, 'category', value);

  @override
  double? get price => RealmObjectBase.get<double>(this, 'price') as double?;
  @override
  set price(double? value) => RealmObjectBase.set(this, 'price', value);

  @override
  double? get discountPercentage =>
      RealmObjectBase.get<double>(this, 'discountPercentage') as double?;
  @override
  set discountPercentage(double? value) =>
      RealmObjectBase.set(this, 'discountPercentage', value);

  @override
  double? get rating => RealmObjectBase.get<double>(this, 'rating') as double?;
  @override
  set rating(double? value) => RealmObjectBase.set(this, 'rating', value);

  @override
  int? get stock => RealmObjectBase.get<int>(this, 'stock') as int?;
  @override
  set stock(int? value) => RealmObjectBase.set(this, 'stock', value);

  @override
  RealmList<String> get tags =>
      RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
  @override
  set tags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get brand => RealmObjectBase.get<String>(this, 'brand') as String?;
  @override
  set brand(String? value) => RealmObjectBase.set(this, 'brand', value);

  @override
  String? get sku => RealmObjectBase.get<String>(this, 'sku') as String?;
  @override
  set sku(String? value) => RealmObjectBase.set(this, 'sku', value);

  @override
  int? get weight => RealmObjectBase.get<int>(this, 'weight') as int?;
  @override
  set weight(int? value) => RealmObjectBase.set(this, 'weight', value);

  @override
  RealmDimensionModel? get dimensions =>
      RealmObjectBase.get<RealmDimensionModel>(this, 'dimensions')
          as RealmDimensionModel?;
  @override
  set dimensions(covariant RealmDimensionModel? value) =>
      RealmObjectBase.set(this, 'dimensions', value);

  @override
  String? get warrantyInformation =>
      RealmObjectBase.get<String>(this, 'warrantyInformation') as String?;
  @override
  set warrantyInformation(String? value) =>
      RealmObjectBase.set(this, 'warrantyInformation', value);

  @override
  String? get shippingInformation =>
      RealmObjectBase.get<String>(this, 'shippingInformation') as String?;
  @override
  set shippingInformation(String? value) =>
      RealmObjectBase.set(this, 'shippingInformation', value);

  @override
  String? get availabilityStatus =>
      RealmObjectBase.get<String>(this, 'availabilityStatus') as String?;
  @override
  set availabilityStatus(String? value) =>
      RealmObjectBase.set(this, 'availabilityStatus', value);

  @override
  RealmList<RealmReviewModel> get reviews =>
      RealmObjectBase.get<RealmReviewModel>(this, 'reviews')
          as RealmList<RealmReviewModel>;
  @override
  set reviews(covariant RealmList<RealmReviewModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get returnPolicy =>
      RealmObjectBase.get<String>(this, 'returnPolicy') as String?;
  @override
  set returnPolicy(String? value) =>
      RealmObjectBase.set(this, 'returnPolicy', value);

  @override
  int? get minimumOrderQuantity =>
      RealmObjectBase.get<int>(this, 'minimumOrderQuantity') as int?;
  @override
  set minimumOrderQuantity(int? value) =>
      RealmObjectBase.set(this, 'minimumOrderQuantity', value);

  @override
  RealmMeta? get meta =>
      RealmObjectBase.get<RealmMeta>(this, 'meta') as RealmMeta?;
  @override
  set meta(covariant RealmMeta? value) =>
      RealmObjectBase.set(this, 'meta', value);

  @override
  String? get thumbnail =>
      RealmObjectBase.get<String>(this, 'thumbnail') as String?;
  @override
  set thumbnail(String? value) => RealmObjectBase.set(this, 'thumbnail', value);

  @override
  RealmList<String> get images =>
      RealmObjectBase.get<String>(this, 'images') as RealmList<String>;
  @override
  set images(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<RealmProductModel>> get changes =>
      RealmObjectBase.getChanges<RealmProductModel>(this);

  @override
  Stream<RealmObjectChanges<RealmProductModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<RealmProductModel>(this, keyPaths);

  @override
  RealmProductModel freeze() =>
      RealmObjectBase.freezeObject<RealmProductModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'description': description.toEJson(),
      'category': category.toEJson(),
      'price': price.toEJson(),
      'discountPercentage': discountPercentage.toEJson(),
      'rating': rating.toEJson(),
      'stock': stock.toEJson(),
      'tags': tags.toEJson(),
      'brand': brand.toEJson(),
      'sku': sku.toEJson(),
      'weight': weight.toEJson(),
      'dimensions': dimensions.toEJson(),
      'warrantyInformation': warrantyInformation.toEJson(),
      'shippingInformation': shippingInformation.toEJson(),
      'availabilityStatus': availabilityStatus.toEJson(),
      'reviews': reviews.toEJson(),
      'returnPolicy': returnPolicy.toEJson(),
      'minimumOrderQuantity': minimumOrderQuantity.toEJson(),
      'meta': meta.toEJson(),
      'thumbnail': thumbnail.toEJson(),
      'images': images.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmProductModel value) => value.toEJson();
  static RealmProductModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {'id': EJsonValue id} => RealmProductModel(
        fromEJson(id),
        title: fromEJson(ejson['title']),
        description: fromEJson(ejson['description']),
        category: fromEJson(ejson['category']),
        price: fromEJson(ejson['price']),
        discountPercentage: fromEJson(ejson['discountPercentage']),
        rating: fromEJson(ejson['rating']),
        stock: fromEJson(ejson['stock']),
        tags: fromEJson(ejson['tags'], defaultValue: const []),
        brand: fromEJson(ejson['brand']),
        sku: fromEJson(ejson['sku']),
        weight: fromEJson(ejson['weight']),
        dimensions: fromEJson(ejson['dimensions']),
        warrantyInformation: fromEJson(ejson['warrantyInformation']),
        shippingInformation: fromEJson(ejson['shippingInformation']),
        availabilityStatus: fromEJson(ejson['availabilityStatus']),
        reviews: fromEJson(ejson['reviews'], defaultValue: const []),
        returnPolicy: fromEJson(ejson['returnPolicy']),
        minimumOrderQuantity: fromEJson(ejson['minimumOrderQuantity']),
        meta: fromEJson(ejson['meta']),
        thumbnail: fromEJson(ejson['thumbnail']),
        images: fromEJson(ejson['images'], defaultValue: const []),
      ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmProductModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      RealmProductModel,
      'RealmProductModel',
      [
        SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
        SchemaProperty('title', RealmPropertyType.string, optional: true),
        SchemaProperty('description', RealmPropertyType.string, optional: true),
        SchemaProperty('category', RealmPropertyType.string, optional: true),
        SchemaProperty('price', RealmPropertyType.double, optional: true),
        SchemaProperty(
          'discountPercentage',
          RealmPropertyType.double,
          optional: true,
        ),
        SchemaProperty('rating', RealmPropertyType.double, optional: true),
        SchemaProperty('stock', RealmPropertyType.int, optional: true),
        SchemaProperty(
          'tags',
          RealmPropertyType.string,
          collectionType: RealmCollectionType.list,
        ),
        SchemaProperty('brand', RealmPropertyType.string, optional: true),
        SchemaProperty('sku', RealmPropertyType.string, optional: true),
        SchemaProperty('weight', RealmPropertyType.int, optional: true),
        SchemaProperty(
          'dimensions',
          RealmPropertyType.object,
          optional: true,
          linkTarget: 'RealmDimensionModel',
        ),
        SchemaProperty(
          'warrantyInformation',
          RealmPropertyType.string,
          optional: true,
        ),
        SchemaProperty(
          'shippingInformation',
          RealmPropertyType.string,
          optional: true,
        ),
        SchemaProperty(
          'availabilityStatus',
          RealmPropertyType.string,
          optional: true,
        ),
        SchemaProperty(
          'reviews',
          RealmPropertyType.object,
          linkTarget: 'RealmReviewModel',
          collectionType: RealmCollectionType.list,
        ),
        SchemaProperty(
          'returnPolicy',
          RealmPropertyType.string,
          optional: true,
        ),
        SchemaProperty(
          'minimumOrderQuantity',
          RealmPropertyType.int,
          optional: true,
        ),
        SchemaProperty(
          'meta',
          RealmPropertyType.object,
          optional: true,
          linkTarget: 'RealmMeta',
        ),
        SchemaProperty('thumbnail', RealmPropertyType.string, optional: true),
        SchemaProperty(
          'images',
          RealmPropertyType.string,
          collectionType: RealmCollectionType.list,
        ),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class RealmAddressModel extends _RealmAddressModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmAddressModel(
    String id,
    String name,
    int number,
    String street,
    int postalCode,
    String city,
    String state,
    String country,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'number', number);
    RealmObjectBase.set(this, 'street', street);
    RealmObjectBase.set(this, 'postalCode', postalCode);
    RealmObjectBase.set(this, 'city', city);
    RealmObjectBase.set(this, 'state', state);
    RealmObjectBase.set(this, 'country', country);
  }

  RealmAddressModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get number => RealmObjectBase.get<int>(this, 'number') as int;
  @override
  set number(int value) => RealmObjectBase.set(this, 'number', value);

  @override
  String get street => RealmObjectBase.get<String>(this, 'street') as String;
  @override
  set street(String value) => RealmObjectBase.set(this, 'street', value);

  @override
  int get postalCode => RealmObjectBase.get<int>(this, 'postalCode') as int;
  @override
  set postalCode(int value) => RealmObjectBase.set(this, 'postalCode', value);

  @override
  String get city => RealmObjectBase.get<String>(this, 'city') as String;
  @override
  set city(String value) => RealmObjectBase.set(this, 'city', value);

  @override
  String get state => RealmObjectBase.get<String>(this, 'state') as String;
  @override
  set state(String value) => RealmObjectBase.set(this, 'state', value);

  @override
  String get country => RealmObjectBase.get<String>(this, 'country') as String;
  @override
  set country(String value) => RealmObjectBase.set(this, 'country', value);

  @override
  Stream<RealmObjectChanges<RealmAddressModel>> get changes =>
      RealmObjectBase.getChanges<RealmAddressModel>(this);

  @override
  Stream<RealmObjectChanges<RealmAddressModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<RealmAddressModel>(this, keyPaths);

  @override
  RealmAddressModel freeze() =>
      RealmObjectBase.freezeObject<RealmAddressModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'number': number.toEJson(),
      'street': street.toEJson(),
      'postalCode': postalCode.toEJson(),
      'city': city.toEJson(),
      'state': state.toEJson(),
      'country': country.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmAddressModel value) => value.toEJson();
  static RealmAddressModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'number': EJsonValue number,
        'street': EJsonValue street,
        'postalCode': EJsonValue postalCode,
        'city': EJsonValue city,
        'state': EJsonValue state,
        'country': EJsonValue country,
      } =>
        RealmAddressModel(
          fromEJson(id),
          fromEJson(name),
          fromEJson(number),
          fromEJson(street),
          fromEJson(postalCode),
          fromEJson(city),
          fromEJson(state),
          fromEJson(country),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmAddressModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      RealmAddressModel,
      'RealmAddressModel',
      [
        SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
        SchemaProperty('name', RealmPropertyType.string),
        SchemaProperty('number', RealmPropertyType.int),
        SchemaProperty('street', RealmPropertyType.string),
        SchemaProperty('postalCode', RealmPropertyType.int),
        SchemaProperty('city', RealmPropertyType.string),
        SchemaProperty('state', RealmPropertyType.string),
        SchemaProperty('country', RealmPropertyType.string),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class RealmPaymentMethodModel extends _RealmPaymentMethodModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmPaymentMethodModel(String id, String title, String image) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'image', image);
  }

  RealmPaymentMethodModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  Stream<RealmObjectChanges<RealmPaymentMethodModel>> get changes =>
      RealmObjectBase.getChanges<RealmPaymentMethodModel>(this);

  @override
  Stream<RealmObjectChanges<RealmPaymentMethodModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<RealmPaymentMethodModel>(this, keyPaths);

  @override
  RealmPaymentMethodModel freeze() =>
      RealmObjectBase.freezeObject<RealmPaymentMethodModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'image': image.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmPaymentMethodModel value) => value.toEJson();
  static RealmPaymentMethodModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'image': EJsonValue image,
      } =>
        RealmPaymentMethodModel(
          fromEJson(id),
          fromEJson(title),
          fromEJson(image),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmPaymentMethodModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      RealmPaymentMethodModel,
      'RealmPaymentMethodModel',
      [
        SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
        SchemaProperty('title', RealmPropertyType.string),
        SchemaProperty('image', RealmPropertyType.string),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class RealmOrderProductModel extends _RealmOrderProductModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmOrderProductModel(
    int quantity,
    double price, {
    RealmProductModel? product,
  }) {
    RealmObjectBase.set(this, 'product', product);
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set(this, 'price', price);
  }

  RealmOrderProductModel._();

  @override
  RealmProductModel? get product =>
      RealmObjectBase.get<RealmProductModel>(this, 'product')
          as RealmProductModel?;
  @override
  set product(covariant RealmProductModel? value) =>
      RealmObjectBase.set(this, 'product', value);

  @override
  int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
  @override
  set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  Stream<RealmObjectChanges<RealmOrderProductModel>> get changes =>
      RealmObjectBase.getChanges<RealmOrderProductModel>(this);

  @override
  Stream<RealmObjectChanges<RealmOrderProductModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<RealmOrderProductModel>(this, keyPaths);

  @override
  RealmOrderProductModel freeze() =>
      RealmObjectBase.freezeObject<RealmOrderProductModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'product': product.toEJson(),
      'quantity': quantity.toEJson(),
      'price': price.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmOrderProductModel value) => value.toEJson();
  static RealmOrderProductModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {'quantity': EJsonValue quantity, 'price': EJsonValue price} =>
        RealmOrderProductModel(
          fromEJson(quantity),
          fromEJson(price),
          product: fromEJson(ejson['product']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmOrderProductModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      RealmOrderProductModel,
      'RealmOrderProductModel',
      [
        SchemaProperty(
          'product',
          RealmPropertyType.object,
          optional: true,
          linkTarget: 'RealmProductModel',
        ),
        SchemaProperty('quantity', RealmPropertyType.int),
        SchemaProperty('price', RealmPropertyType.double),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class RealmOrderModel extends _RealmOrderModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmOrderModel(
    String orderId,
    DateTime placedOn,
    int orderStatusIndex,
    double productTotalPrice,
    double totalPrice,
    double shippingFee,
    double taxFee, {
    RealmPaymentMethodModel? paymentMethod,
    RealmAddressModel? address,
    Iterable<RealmOrderProductModel> products = const [],
  }) {
    RealmObjectBase.set(this, 'orderId', orderId);
    RealmObjectBase.set(this, 'placedOn', placedOn);
    RealmObjectBase.set(this, 'orderStatusIndex', orderStatusIndex);
    RealmObjectBase.set(this, 'productTotalPrice', productTotalPrice);
    RealmObjectBase.set(this, 'totalPrice', totalPrice);
    RealmObjectBase.set(this, 'shippingFee', shippingFee);
    RealmObjectBase.set(this, 'taxFee', taxFee);
    RealmObjectBase.set(this, 'paymentMethod', paymentMethod);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set<RealmList<RealmOrderProductModel>>(
      this,
      'products',
      RealmList<RealmOrderProductModel>(products),
    );
  }

  RealmOrderModel._();

  @override
  String get orderId => RealmObjectBase.get<String>(this, 'orderId') as String;
  @override
  set orderId(String value) => RealmObjectBase.set(this, 'orderId', value);

  @override
  DateTime get placedOn =>
      RealmObjectBase.get<DateTime>(this, 'placedOn') as DateTime;
  @override
  set placedOn(DateTime value) => RealmObjectBase.set(this, 'placedOn', value);

  @override
  int get orderStatusIndex =>
      RealmObjectBase.get<int>(this, 'orderStatusIndex') as int;
  @override
  set orderStatusIndex(int value) =>
      RealmObjectBase.set(this, 'orderStatusIndex', value);

  @override
  double get productTotalPrice =>
      RealmObjectBase.get<double>(this, 'productTotalPrice') as double;
  @override
  set productTotalPrice(double value) =>
      RealmObjectBase.set(this, 'productTotalPrice', value);

  @override
  double get totalPrice =>
      RealmObjectBase.get<double>(this, 'totalPrice') as double;
  @override
  set totalPrice(double value) =>
      RealmObjectBase.set(this, 'totalPrice', value);

  @override
  double get shippingFee =>
      RealmObjectBase.get<double>(this, 'shippingFee') as double;
  @override
  set shippingFee(double value) =>
      RealmObjectBase.set(this, 'shippingFee', value);

  @override
  double get taxFee => RealmObjectBase.get<double>(this, 'taxFee') as double;
  @override
  set taxFee(double value) => RealmObjectBase.set(this, 'taxFee', value);

  @override
  RealmPaymentMethodModel? get paymentMethod =>
      RealmObjectBase.get<RealmPaymentMethodModel>(this, 'paymentMethod')
          as RealmPaymentMethodModel?;
  @override
  set paymentMethod(covariant RealmPaymentMethodModel? value) =>
      RealmObjectBase.set(this, 'paymentMethod', value);

  @override
  RealmAddressModel? get address =>
      RealmObjectBase.get<RealmAddressModel>(this, 'address')
          as RealmAddressModel?;
  @override
  set address(covariant RealmAddressModel? value) =>
      RealmObjectBase.set(this, 'address', value);

  @override
  RealmList<RealmOrderProductModel> get products =>
      RealmObjectBase.get<RealmOrderProductModel>(this, 'products')
          as RealmList<RealmOrderProductModel>;
  @override
  set products(covariant RealmList<RealmOrderProductModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<RealmOrderModel>> get changes =>
      RealmObjectBase.getChanges<RealmOrderModel>(this);

  @override
  Stream<RealmObjectChanges<RealmOrderModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<RealmOrderModel>(this, keyPaths);

  @override
  RealmOrderModel freeze() =>
      RealmObjectBase.freezeObject<RealmOrderModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'orderId': orderId.toEJson(),
      'placedOn': placedOn.toEJson(),
      'orderStatusIndex': orderStatusIndex.toEJson(),
      'productTotalPrice': productTotalPrice.toEJson(),
      'totalPrice': totalPrice.toEJson(),
      'shippingFee': shippingFee.toEJson(),
      'taxFee': taxFee.toEJson(),
      'paymentMethod': paymentMethod.toEJson(),
      'address': address.toEJson(),
      'products': products.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmOrderModel value) => value.toEJson();
  static RealmOrderModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'orderId': EJsonValue orderId,
        'placedOn': EJsonValue placedOn,
        'orderStatusIndex': EJsonValue orderStatusIndex,
        'productTotalPrice': EJsonValue productTotalPrice,
        'totalPrice': EJsonValue totalPrice,
        'shippingFee': EJsonValue shippingFee,
        'taxFee': EJsonValue taxFee,
      } =>
        RealmOrderModel(
          fromEJson(orderId),
          fromEJson(placedOn),
          fromEJson(orderStatusIndex),
          fromEJson(productTotalPrice),
          fromEJson(totalPrice),
          fromEJson(shippingFee),
          fromEJson(taxFee),
          paymentMethod: fromEJson(ejson['paymentMethod']),
          address: fromEJson(ejson['address']),
          products: fromEJson(ejson['products']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmOrderModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      RealmOrderModel,
      'RealmOrderModel',
      [
        SchemaProperty('orderId', RealmPropertyType.string),
        SchemaProperty('placedOn', RealmPropertyType.timestamp),
        SchemaProperty('orderStatusIndex', RealmPropertyType.int),
        SchemaProperty('productTotalPrice', RealmPropertyType.double),
        SchemaProperty('totalPrice', RealmPropertyType.double),
        SchemaProperty('shippingFee', RealmPropertyType.double),
        SchemaProperty('taxFee', RealmPropertyType.double),
        SchemaProperty(
          'paymentMethod',
          RealmPropertyType.object,
          optional: true,
          linkTarget: 'RealmPaymentMethodModel',
        ),
        SchemaProperty(
          'address',
          RealmPropertyType.object,
          optional: true,
          linkTarget: 'RealmAddressModel',
        ),
        SchemaProperty(
          'products',
          RealmPropertyType.object,
          linkTarget: 'RealmOrderProductModel',
          collectionType: RealmCollectionType.list,
        ),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
