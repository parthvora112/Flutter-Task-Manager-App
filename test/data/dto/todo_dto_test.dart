import 'package:task_manager_app/data/dto/todo_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
    group('TodoDto', () {
      late Map<String, dynamic> referenceJson;
      late TodoDto referenceDto;

      referenceDto = TodoDto(
        id: 1,
        title: 'Hello',
        description: 'Hello How are you?',
      );

      referenceJson = referenceDto.toJson();

      test('should create TodoDto instance to/from Json', () {
        final createdDto = TodoDto.fromJson(referenceJson);
        final createdJson = createdDto.toJson();
        expect(createdDto, referenceDto);
        expect(createdJson, referenceJson);
      });
    });
}