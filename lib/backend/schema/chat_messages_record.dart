import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
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

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "seenby_ref" field.
  List<String>? _seenbyRef;
  List<String> get seenbyRef => _seenbyRef ?? const [];
  bool hasSeenbyRef() => _seenbyRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _createdbyRef = snapshotData['createdby_ref'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _seenbyRef = getDataList(snapshotData['seenby_ref']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_messages')
          : FirebaseFirestore.instance.collectionGroup('chat_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chat_messages').doc(id);

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  DateTime? date,
  DocumentReference? createdbyRef,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'createdby_ref': createdbyRef,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.createdbyRef == e2?.createdbyRef &&
        e1?.message == e2?.message &&
        listEquality.equals(e1?.seenbyRef, e2?.seenbyRef);
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality()
      .hash([e?.date, e?.createdbyRef, e?.message, e?.seenbyRef]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
