/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the ParkingRegistration type in your schema. */
class ParkingRegistration extends amplify_core.Model {
  static const classType = const _ParkingRegistrationModelType();
  final String id;
  final String? _carParkId;
  final String? _userId;
  final amplify_core.TemporalDateTime? _leaveTime;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ParkingRegistrationModelIdentifier get modelIdentifier {
      return ParkingRegistrationModelIdentifier(
        id: id
      );
  }
  
  String get carParkId {
    try {
      return _carParkId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime get leaveTime {
    try {
      return _leaveTime!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ParkingRegistration._internal({required this.id, required carParkId, required userId, required leaveTime, createdAt, updatedAt}): _carParkId = carParkId, _userId = userId, _leaveTime = leaveTime, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ParkingRegistration({String? id, required String carParkId, required String userId, required amplify_core.TemporalDateTime leaveTime, amplify_core.TemporalDateTime? createdAt}) {
    return ParkingRegistration._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      carParkId: carParkId,
      userId: userId,
      leaveTime: leaveTime,
      createdAt: createdAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParkingRegistration &&
      id == other.id &&
      _carParkId == other._carParkId &&
      _userId == other._userId &&
      _leaveTime == other._leaveTime &&
      _createdAt == other._createdAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ParkingRegistration {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("carParkId=" + "$_carParkId" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("leaveTime=" + (_leaveTime != null ? _leaveTime!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ParkingRegistration copyWith({String? carParkId, String? userId, amplify_core.TemporalDateTime? leaveTime, amplify_core.TemporalDateTime? createdAt}) {
    return ParkingRegistration._internal(
      id: id,
      carParkId: carParkId ?? this.carParkId,
      userId: userId ?? this.userId,
      leaveTime: leaveTime ?? this.leaveTime,
      createdAt: createdAt ?? this.createdAt);
  }
  
  ParkingRegistration copyWithModelFieldValues({
    ModelFieldValue<String>? carParkId,
    ModelFieldValue<String>? userId,
    ModelFieldValue<amplify_core.TemporalDateTime>? leaveTime,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt
  }) {
    return ParkingRegistration._internal(
      id: id,
      carParkId: carParkId == null ? this.carParkId : carParkId.value,
      userId: userId == null ? this.userId : userId.value,
      leaveTime: leaveTime == null ? this.leaveTime : leaveTime.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value
    );
  }
  
  ParkingRegistration.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _carParkId = json['carParkId'],
      _userId = json['userId'],
      _leaveTime = json['leaveTime'] != null ? amplify_core.TemporalDateTime.fromString(json['leaveTime']) : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'carParkId': _carParkId, 'userId': _userId, 'leaveTime': _leaveTime?.format(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'carParkId': _carParkId,
    'userId': _userId,
    'leaveTime': _leaveTime,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ParkingRegistrationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ParkingRegistrationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CARPARKID = amplify_core.QueryField(fieldName: "carParkId");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static final LEAVETIME = amplify_core.QueryField(fieldName: "leaveTime");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ParkingRegistration";
    modelSchemaDefinition.pluralName = "ParkingRegistrations";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ParkingRegistration.CARPARKID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ParkingRegistration.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ParkingRegistration.LEAVETIME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ParkingRegistration.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ParkingRegistrationModelType extends amplify_core.ModelType<ParkingRegistration> {
  const _ParkingRegistrationModelType();
  
  @override
  ParkingRegistration fromJson(Map<String, dynamic> jsonData) {
    return ParkingRegistration.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ParkingRegistration';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ParkingRegistration] in your schema.
 */
class ParkingRegistrationModelIdentifier implements amplify_core.ModelIdentifier<ParkingRegistration> {
  final String id;

  /** Create an instance of ParkingRegistrationModelIdentifier using [id] the primary key. */
  const ParkingRegistrationModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ParkingRegistrationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ParkingRegistrationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}