import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic10/core/extensions/build_context_ext.dart';

import 'package:flutter_fic10/presentation/home/bloc/content/content_bloc.dart';

import '../../../core/components/custom_scaffold.dart';

class TipsAndTricksPage extends StatefulWidget {
  const TipsAndTricksPage({super.key});

  @override
  State<TipsAndTricksPage> createState() => _TipsAndTricksPageState();
}

class _TipsAndTricksPageState extends State<TipsAndTricksPage> {
  @override
  void initState() {
    context.read<ContentBloc>().add(
          const ContentEvent.getContentById("2"),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: const Text('Tips dan Trik'),
      body: BlocBuilder<ContentBloc, ContentState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Text('Get Data Error');
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (content) {
              return ListView(
                // padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 30.0),
                children: [
                  content.data.isEmpty
                      ? const SizedBox()
                      : Image.network(
                          content.data[0].image,
                          width: context.deviceWidth,
                          height: 470.0,
                          fit: BoxFit.cover,
                        ),
                  //  Assets.images.menu.aboutUs.image(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      content.data.isEmpty
                          ? 'No data'
                          : content.data[0].content,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
