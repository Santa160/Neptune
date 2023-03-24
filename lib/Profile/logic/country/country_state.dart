// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'country_cubit.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<CountryModel>? countryModel;
  final List? id;
  final List? name;

  CountryLoaded({
    this.id,
    this.name,
    this.countryModel,
  });
}

class CountryError extends CountryState {
  final String message;

  CountryError({required this.message});
}
