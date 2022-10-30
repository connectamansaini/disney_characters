// ignore_for_file: false
part of 'characters_bloc.dart';

enum Status { initial, loading, failure, success }

class CharactersState {
  const CharactersState({
    this.status = Status.initial,
    this.characters = const [],
  });

  final Status status;
  final List<Character> characters;

  CharactersState copyWith({
    Status? status,
    List<Character>? characters,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
    );
  }
}
