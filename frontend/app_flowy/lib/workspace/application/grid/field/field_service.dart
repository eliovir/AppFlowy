import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flowy_sdk/dispatch/dispatch.dart';
import 'package:flowy_sdk/protobuf/flowy-error/errors.pb.dart';
import 'package:flowy_sdk/protobuf/flowy-grid-data-model/grid.pb.dart';
import 'package:flowy_sdk/protobuf/flowy-grid-data-model/meta.pb.dart';
import 'package:flowy_sdk/protobuf/flowy-grid/protobuf.dart';

class FieldService {
  final String gridId;

  FieldService({required this.gridId});

  Future<Either<EditFieldContext, FlowyError>> getEditFieldContext(FieldType fieldType) {
    final payload = CreateEditFieldContextParams.create()
      ..gridId = gridId
      ..fieldType = fieldType;

    return GridEventCreateEditFieldContext(payload).send();
  }

  Future<Either<Unit, FlowyError>> createField({
    required Field field,
    List<int>? typeOptionData,
    String? startFieldId,
  }) {
    var payload = CreateFieldPayload.create()
      ..gridId = gridId
      ..field_2 = field
      ..typeOptionData = typeOptionData ?? [];

    if (startFieldId != null) {
      payload.startFieldId = startFieldId;
    }

    return GridEventCreateField(payload).send();
  }
}

class GridFieldData extends Equatable {
  final String gridId;
  final Field field;

  const GridFieldData({
    required this.gridId,
    required this.field,
  });

  @override
  List<Object> get props => [field.id];
}