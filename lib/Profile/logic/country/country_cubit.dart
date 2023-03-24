import 'package:Neptune/Profile/example.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final ProfileRepo countryRepo;
  CountryCubit({required this.countryRepo}) : super(CountryInitial()) {
    getCountry();
  }
  List id = [];
  List name = [];
  Future<void> getCountry() async {
    emit(CountryLoading());
    try {
      final a = await countryRepo.getCountry();

      for (int i = 0; i < a.length; i++) {
        id.add(a[i].id);
        name.add(a[i].name);
      }

      emit(CountryLoaded(countryModel: a, id: id, name: name));
    } catch (error) {
      emit(CountryError(message: error.toString()));
    }
  }

  @override
  void onChange(Change<CountryState> change) {
    super.onChange(change);
    print(change);
  }
}
