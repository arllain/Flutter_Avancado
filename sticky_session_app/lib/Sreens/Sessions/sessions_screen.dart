import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_session_app/Sreens/Sessions/bloc/sessions_bloc.dart';
import 'package:sticky_session_app/Sreens/Sessions/widget/meeting_card.dart';
import 'package:sticky_session_app/constants.dart';
import 'package:sticky_session_app/widgets/app_drawer.dart';
import 'package:sticky_session_app/widgets/custom_error_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: buildAppBar(context),
          drawer: const AppDrawer(),
          body: BlocProvider(
            create: (context) => SessionsBloc()..add(const LoadMeetingsEvent()),
            child: BlocBuilder<SessionsBloc, SessionsState>(
                builder: (context, state) {
              if (state is SessionsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SessionsLoadedState) {
                return SingleChildScrollView(
                  child: Container(
                    color: kGrayBackGroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Text(
                            AppLocalizations.of(context)!.recents,
                            style: const TextStyle(
                                color: kDarkGrayColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // MeetingCard(isRecent: true, meeting: state.meetings[0]),
                        // ListView.builder(
                        //   itemCount: 1,
                        //   itemBuilder: (context, index) => MeetingCard(
                        //       isRecent: true, meeting: state.meetings[index]),
                        //   shrinkWrap: true,
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Text(
                            AppLocalizations.of(context)!.older,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF929292)),
                          ),
                        ),
                        ListView.builder(
                          itemCount: state.meetings.length,
                          itemBuilder: (context, index) => MeetingCard(
                              isRecent: false, meeting: state.meetings[index]),
                          shrinkWrap: true,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const CustomErrorWidget(message: "Something went wrong");
              }
            }),
          )),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 1,
    backgroundColor: Colors.white,
    foregroundColor: kRedColor,
    centerTitle: true,
    title: Text(
      AppLocalizations.of(context)!.mettings,
      style: const TextStyle(
          color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.notifications,
          color: kDarkGrayColor,
        ),
        onPressed: () {
          Navigator.pushNamed(context, notificationRouter);
        },
      )
    ],
  );
}
