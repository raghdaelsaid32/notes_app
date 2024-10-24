import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/core/constants.dart';
import 'package:notes_app/cubits/add_cubit/add_note_cubitt.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_textField.dart';

import 'add_note_form.dart';
import 'custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubitCubit(),
      child: BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteCubitSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();

            Navigator.pop(context);
          }
          if (state is AddNoteCubitFailure) {}
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteCubitLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
 // l single child mynf3sh ykon fo2 modal progress hud
 // byt3ml rebuild lma aft7 l keyboard l2no by-trigger an feh haga fl ui