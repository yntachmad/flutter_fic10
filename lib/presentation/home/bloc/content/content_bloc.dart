import 'package:bloc/bloc.dart';
import 'package:flutter_fic10/data/datasources/content_remote_datasource.dart';
import 'package:flutter_fic10/data/models/responses/content_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_event.dart';
part 'content_state.dart';
part 'content_bloc.freezed.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRemoteDatasource contentRemoteDataource;
  ContentBloc(this.contentRemoteDataource) : super(const _Initial()) {
    on<_getContentById>((event, emit) async {
      emit(const _Loading());
      final response = await contentRemoteDataource.getContentById(event.id);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => _Success(r),
      );
    });
  }
}
