part of 'characters_bloc.dart';

abstract class CharactersEvent {
  const CharactersEvent();
}

class CharactersRequested extends CharactersEvent {}
