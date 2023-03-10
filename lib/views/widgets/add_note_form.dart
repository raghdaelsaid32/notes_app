import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_cubit/add_note_cubitt.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:intl/intl.dart';

import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_textField.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

final GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

String? title, subTitle;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
         ColorsListView(),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: BlocBuilder<AddNoteCubitCubit, AddNoteCubitState>(
              builder: (context, state) {
                return CustomButtton(
                  isLoading: state is AddNoteCubitLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      var currentDate = DateTime.now();
                      var formattedCurrentDate =
                          DateFormat.yMd().format(currentDate);

                      formKey.currentState!.save();
                      var noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          color: Colors.blue
                              .value, // l value de btrg3ly integer bta3 l color
                          date: formattedCurrentDate);
                      BlocProvider.of<AddNoteCubitCubit>(context)
                          .addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

