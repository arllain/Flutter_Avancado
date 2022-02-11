import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_session_app/Sreens/Retrospective/bloc/retrospective_bloc.dart';
import 'package:sticky_session_app/constants.dart';
import 'package:sticky_session_app/models/meeting.dart';
import 'package:sticky_session_app/utils/utils.dart';
import 'package:sticky_session_app/widgets/custom_error_widget.dart';
import 'package:sticky_session_app/widgets/icon_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RetrospectiveScreen extends StatefulWidget {
  const RetrospectiveScreen({Key? key}) : super(key: key);

  @override
  State<RetrospectiveScreen> createState() => _RetrospectiveScreenState();
}

class _RetrospectiveScreenState extends State<RetrospectiveScreen> {
  @override
  Widget build(BuildContext context) {
    final meeting = ModalRoute.of(context)!.settings.arguments as Meeting;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: kRedColor,
          shadowColor: Colors.grey.shade50,
          title: Text(
            AppLocalizations.of(context)!.retrospective,
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(sessionCreateRouter);
          },
          child: const Icon(Icons.add),
        ),
        body: BlocProvider(
          create: (context) =>
              RetrospectiveBloc(meeting.id)..add(const LoadSessionsEvent()),
          child: BlocBuilder<RetrospectiveBloc, RetrospectiveState>(
              builder: (context, state) {
            if (state is RetrospectiveLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SessionsNoInternetState) {
              return
                const CustomErrorWidget(message: "No internet connection", icon: Icon(Icons.error, color: kDarkGrayColor));
            }

            if (state is RetrospectiveLoadedState) {
              if (state.sessions.isNotEmpty) {
                return SingleChildScrollView(
                  child: Container(
                    color: kGrayColor3,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListView.builder(
                            itemCount: state.sessions.length,
                            itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(notesRouter,
                                      arguments: state.sessions[index]);
                                },
                                child: Container(
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(top: 24),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 135,
                                        color: Utils.hexToColor(
                                            '#${state.sessions[index].highlight}'),
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              10,
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      state
                                                          .sessions[index].name,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  const Icon(Icons.more_vert)
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                  state.sessions[index]
                                                      .description,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    color: kGrayColor,
                                                  )),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              IconRow(
                                                  isRecent: false,
                                                  icon: Icons.message,
                                                  text:
                                                      "${state.sessions[index].answer} ${AppLocalizations.of(context)!.responses}"),
                                            ],
                                          ))
                                    ],
                                  ),
                                )),
                            shrinkWrap: true,
                          ),
                        ]),
                  ),
                );
              } else {
                return Container(
                  color: kGrayColor3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/sad_face.png',
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          AppLocalizations.of(context)!.there_is_no_sessions,
                          style: const TextStyle(color: kDarkGrayColor, fontSize: 17),
                        ),
                        Text(
                          AppLocalizations.of(context)!.create_one_by_clicking_button,
                          style:
                              const TextStyle(color: kLightGrayColor, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else {
              return CustomErrorWidget(message: AppLocalizations.of(context)!.something_went_wrong,
                  icon: const Icon(Icons.error, color: kDarkGrayColor));
            }
          }),
        ));
  }
}

