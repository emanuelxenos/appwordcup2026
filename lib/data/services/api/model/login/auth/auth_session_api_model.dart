
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_session_api_model.g.dart';

@JsonSerializable()
class const AuthSessionApiModel ({required final String token, required final AuthSesssionApiModelResponse user}) extends Equatable{

  factory AuthSessionApiModel.fromJson(Map<String, dynamic> json) => _$AuthSessionApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSessionApiModelToJson(this);

  @override
  List<Object?> get props => [token, user];
  
}

@JsonSerializable()
class const AuthSesssionApiModelResponse({
  required final String name,
  required final String email,
})extends Equatable{

  factory AuthSesssionApiModelResponse.fromJson(Map<String, dynamic> json) => _$AuthSesssionApiModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSesssionApiModelResponseToJson(this);

  @override
  List<Object?> get props => [name, email];
}