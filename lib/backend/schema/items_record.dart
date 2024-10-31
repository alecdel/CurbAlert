import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "pickedUp" field.
  bool? _pickedUp;
  bool get pickedUp => _pickedUp ?? false;
  bool hasPickedUp() => _pickedUp != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "listingOwner" field.
  String? _listingOwner;
  String get listingOwner => _listingOwner ?? '';
  bool hasListingOwner() => _listingOwner != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "pickedUpBy" field.
  String? _pickedUpBy;
  String get pickedUpBy => _pickedUpBy ?? '';
  bool hasPickedUpBy() => _pickedUpBy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _details = snapshotData['details'] as String?;
    _pickedUp = snapshotData['pickedUp'] as bool?;
    _image = snapshotData['image'] as String?;
    _listingOwner = snapshotData['listingOwner'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _pickedUpBy = snapshotData['pickedUpBy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('items');

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  String? name,
  String? details,
  bool? pickedUp,
  String? image,
  String? listingOwner,
  LatLng? location,
  DateTime? createdTime,
  String? pickedUpBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'details': details,
      'pickedUp': pickedUp,
      'image': image,
      'listingOwner': listingOwner,
      'location': location,
      'created_time': createdTime,
      'pickedUpBy': pickedUpBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.details == e2?.details &&
        e1?.pickedUp == e2?.pickedUp &&
        e1?.image == e2?.image &&
        e1?.listingOwner == e2?.listingOwner &&
        e1?.location == e2?.location &&
        e1?.createdTime == e2?.createdTime &&
        e1?.pickedUpBy == e2?.pickedUpBy;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.details,
        e?.pickedUp,
        e?.image,
        e?.listingOwner,
        e?.location,
        e?.createdTime,
        e?.pickedUpBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
