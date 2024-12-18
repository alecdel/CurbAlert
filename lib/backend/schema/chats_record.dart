import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "createdby_ref" field.
  DocumentReference? _createdbyRef;
  DocumentReference? get createdbyRef => _createdbyRef;
  bool hasCreatedbyRef() => _createdbyRef != null;

  // "chat_title" field.
  String? _chatTitle;
  String get chatTitle => _chatTitle ?? '';
  bool hasChatTitle() => _chatTitle != null;

  // "recent_update" field.
  DateTime? _recentUpdate;
  DateTime? get recentUpdate => _recentUpdate;
  bool hasRecentUpdate() => _recentUpdate != null;

  // "chat_photo" field.
  String? _chatPhoto;
  String get chatPhoto => _chatPhoto ?? '';
  bool hasChatPhoto() => _chatPhoto != null;

  // "recent_message_ref" field.
  DocumentReference? _recentMessageRef;
  DocumentReference? get recentMessageRef => _recentMessageRef;
  bool hasRecentMessageRef() => _recentMessageRef != null;

  // "recent_chat_message" field.
  String? _recentChatMessage;
  String get recentChatMessage => _recentChatMessage ?? '';
  bool hasRecentChatMessage() => _recentChatMessage != null;

  // "members_ref" field.
  List<String>? _membersRef;
  List<String> get membersRef => _membersRef ?? const [];
  bool hasMembersRef() => _membersRef != null;

  // "itemOwner" field.
  String? _itemOwner;
  String get itemOwner => _itemOwner ?? '';
  bool hasItemOwner() => _itemOwner != null;

  // "enabled" field.
  bool? _enabled;
  bool get enabled => _enabled ?? false;
  bool hasEnabled() => _enabled != null;

  // "item_ref" field.
  DocumentReference? _itemRef;
  DocumentReference? get itemRef => _itemRef;
  bool hasItemRef() => _itemRef != null;

  // "userDisplayName" field.
  String? _userDisplayName;
  String get userDisplayName => _userDisplayName ?? '';
  bool hasUserDisplayName() => _userDisplayName != null;

  // "ownerDisplayName" field.
  String? _ownerDisplayName;
  String get ownerDisplayName => _ownerDisplayName ?? '';
  bool hasOwnerDisplayName() => _ownerDisplayName != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _createdbyRef = snapshotData['createdby_ref'] as DocumentReference?;
    _chatTitle = snapshotData['chat_title'] as String?;
    _recentUpdate = snapshotData['recent_update'] as DateTime?;
    _chatPhoto = snapshotData['chat_photo'] as String?;
    _recentMessageRef =
        snapshotData['recent_message_ref'] as DocumentReference?;
    _recentChatMessage = snapshotData['recent_chat_message'] as String?;
    _membersRef = getDataList(snapshotData['members_ref']);
    _itemOwner = snapshotData['itemOwner'] as String?;
    _enabled = snapshotData['enabled'] as bool?;
    _itemRef = snapshotData['item_ref'] as DocumentReference?;
    _userDisplayName = snapshotData['userDisplayName'] as String?;
    _ownerDisplayName = snapshotData['ownerDisplayName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DateTime? date,
  DocumentReference? createdbyRef,
  String? chatTitle,
  DateTime? recentUpdate,
  String? chatPhoto,
  DocumentReference? recentMessageRef,
  String? recentChatMessage,
  String? itemOwner,
  bool? enabled,
  DocumentReference? itemRef,
  String? userDisplayName,
  String? ownerDisplayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'createdby_ref': createdbyRef,
      'chat_title': chatTitle,
      'recent_update': recentUpdate,
      'chat_photo': chatPhoto,
      'recent_message_ref': recentMessageRef,
      'recent_chat_message': recentChatMessage,
      'itemOwner': itemOwner,
      'enabled': enabled,
      'item_ref': itemRef,
      'userDisplayName': userDisplayName,
      'ownerDisplayName': ownerDisplayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.createdbyRef == e2?.createdbyRef &&
        e1?.chatTitle == e2?.chatTitle &&
        e1?.recentUpdate == e2?.recentUpdate &&
        e1?.chatPhoto == e2?.chatPhoto &&
        e1?.recentMessageRef == e2?.recentMessageRef &&
        e1?.recentChatMessage == e2?.recentChatMessage &&
        listEquality.equals(e1?.membersRef, e2?.membersRef) &&
        e1?.itemOwner == e2?.itemOwner &&
        e1?.enabled == e2?.enabled &&
        e1?.itemRef == e2?.itemRef &&
        e1?.userDisplayName == e2?.userDisplayName &&
        e1?.ownerDisplayName == e2?.ownerDisplayName;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.createdbyRef,
        e?.chatTitle,
        e?.recentUpdate,
        e?.chatPhoto,
        e?.recentMessageRef,
        e?.recentChatMessage,
        e?.membersRef,
        e?.itemOwner,
        e?.enabled,
        e?.itemRef,
        e?.userDisplayName,
        e?.ownerDisplayName
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
