import 'package:app_flowy/workspace/application/grid/row/row_service.dart';
import 'package:flowy_sdk/protobuf/flowy-grid-data-model/grid.pb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';
import 'cell_service.dart';

part 'number_cell_bloc.freezed.dart';

class NumberCellBloc extends Bloc<NumberCellEvent, NumberCellState> {
  final CellService service;

  NumberCellBloc({
    required this.service,
    required FutureCellData cellData,
  }) : super(NumberCellState.initial()) {
    on<NumberCellEvent>(
      (event, emit) async {
        await event.map(
          initial: (_InitialCell value) async {},
        );
      },
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}

@freezed
class NumberCellEvent with _$NumberCellEvent {
  const factory NumberCellEvent.initial() = _InitialCell;
}

@freezed
class NumberCellState with _$NumberCellState {
  const factory NumberCellState({
    Cell? cell,
  }) = _NumberCellState;

  factory NumberCellState.initial() => const NumberCellState();
}