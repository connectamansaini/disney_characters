import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:disney_characters/src/characters/models/character.dart';
import 'package:disney_characters/src/characters/repository/characters_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc(this.repository) : super(const CharactersState()) {
    on<CharactersRequested>(_onCharactersRequested);
  }

  final CharactersRepository repository;

  Future<void> _onCharactersRequested(
    CharactersRequested event,
    Emitter<CharactersState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final characters = await repository.getCharacters();

      emit(
        state.copyWith(
          status: Status.success,
          characters: characters,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
