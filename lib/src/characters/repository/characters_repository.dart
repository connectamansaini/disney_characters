import 'dart:convert';

import 'package:disney_characters/src/characters/models/character.dart';
import 'package:http/http.dart' as http;

class CharactersRepository {
  Future<List<Character>> getCharacters() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.disneyapi.dev/characters'),
      );
      final decoded = json.decode(response.body) as Map;
      final data = decoded['data'] as List;
      final characters = data.map((e) => Character.fromJson(e)).toList();
      return characters;
    } catch (e) {
      rethrow;
    }
  }
}
