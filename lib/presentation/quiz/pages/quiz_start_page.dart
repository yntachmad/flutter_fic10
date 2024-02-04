import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic10/core/extensions/build_context_ext.dart';
import 'package:flutter_fic10/presentation/quiz/bloc/ujian_by_kategori/ujian_by_kategori_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/custom_scaffold.dart';
import '../../../core/constants/colors.dart';
import '../models/quiz_model.dart';
import '../widgets/countdown_timer.dart';
import '../widgets/quiz_multiple_choice.dart';
import 'quiz_finish_page.dart';

class QuizStartPage extends StatefulWidget {
  final QuizModel data;

  const QuizStartPage({
    super.key,
    required this.data,
  });

  @override
  State<QuizStartPage> createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  @override
  void initState() {
    // context
    //     .read<UjianByKategoriBloc>()
    //     .add(UjianByKategoriEvent.getUjianByKategori(widget.data.kategori));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int quizNumber = 0;

    return CustomScaffold(
      appBarTitle: Text(widget.data.name),
      actions: [
        Assets.icons.clock.image(width: 24.0),
        const SizedBox(width: 8.0),
        CountdownTimer(
          duration: widget.data.duration,
          onTimerCompletion: (timeRemaining) {
            context.pushReplacement(QuizFinishPage(
              data: widget.data,
              timeRemaining: timeRemaining,
            ));
          },
        ),
        IconButton(
            onPressed: () {
              context.pushReplacement(QuizFinishPage(
                data: widget.data,
                timeRemaining: 0,
              ));
            },
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            )),
        const SizedBox(width: 24.0),
      ],
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const Text(
            'Pertanyaan',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: LinearProgressIndicator(
                  value: quizNumber / 25,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                '$quizNumber/25',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const QuizMultipleChoice(),
        ],
      ),
    );
  }
}
