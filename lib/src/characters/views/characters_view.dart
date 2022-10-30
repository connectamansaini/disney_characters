import 'package:disney_characters/src/characters/bloc/characters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state.status == Status.failure) {
          return const Center(
            child: Text('Failure'),
          );
        } else if (state.status == Status.success) {
          return ListView.builder(
            itemCount: state.characters.length,
            itemBuilder: (context, index) {
              final character = state.characters[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(character.imageUrl)),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
