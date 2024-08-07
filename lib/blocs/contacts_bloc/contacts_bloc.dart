import 'package:bloc/bloc.dart';
import 'package:dars_93_uy_ishi/blocs/contacts_bloc/contacts_event.dart';
import 'package:dars_93_uy_ishi/blocs/contacts_bloc/contacts_states.dart';
import 'package:dars_93_uy_ishi/models/contact_model.dart';
import 'package:dars_93_uy_ishi/services/contacts_services.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsInitialState()) {
    on<GetContactsEvent>(_onFetchContacts);
  }

  void _onFetchContacts(GetContactsEvent event, emit) async {
    emit(ContactsLoadingState());
    try {
      final contactsServices = ContactsServices();
      final contacts = await contactsServices.fetchContacts();
      emit(ContactsLoadedState(contacts: contacts));
    } catch (error) {
      emit(ContactsErrorState(error: error.toString()));
    }
  }
}
