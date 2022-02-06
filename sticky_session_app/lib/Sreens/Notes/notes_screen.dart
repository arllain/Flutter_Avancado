import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_session_app/constants.dart';
 import 'package:sticky_session_app/models/session.dart';
import 'package:sticky_session_app/models/sticky.dart';
//import 'package:sticky_sessions/models/column.dart' as session_column;
import 'package:sticky_session_app/widgets/triangle_painter.dart';

import 'bloc/notes_bloc.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {


  @override
  Widget build(BuildContext context) {

    final session = ModalRoute.of(context)!.settings.arguments as Session;

    return DefaultTabController(
      length: session.columns.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: kRedColor,
          shadowColor: Colors.grey.shade50,
          title: Text(
            session.name,
          ),
          bottom: TabBar(
            labelColor: const Color(0xFF57BE7F),
            labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            unselectedLabelColor: Colors.grey.shade700,
            indicatorColor: const Color(0xFF57BE7F),
            isScrollable: true,
            tabs: [
              for (var column in session.columns ?? <SessionColumn>[])
                Tab(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(column.name,
                      style: TextStyle(color: hexToColor("#${column.color}")),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: hexToColor("#${column.color}"),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: const Text(
                        // state.data?.stickyByColumnMap[column.name ?? ""]?.length.toString() ?? "0",
                        "0",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )
                  ]),
                ),
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => NotesBloc(session)..add(const LoadinNotesEvent()),
          child: BlocBuilder<NotesBloc, NotesState>(
              builder: (context, state) {
                if(state is NotesLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is NotesLoadedState) {
                  return Container(
                    color: const Color(0xFFF3F3F3),
                    child: TabBarView(
                      children: [
                        for (var column in session.columns ?? <SessionColumn>[])
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      // Navigator.of(context).pushNamed(routerSessionAddNote);
                                    },
                                    child: const Text("+ NEW NOTE")),
                                const SizedBox(
                                  height: 16,
                                ),
                                for (var sticky in state.stickyByColumnMap[column.name] ?? <Sticky>[])
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 16),
                                      child: Stack(children: [
                                        CustomPaint(
                                            painter: TrianglePainter(
                                                drawShadow: true,
                                                getPath: (double x, double y) => Path()
                                                  ..moveTo(0, y)
                                                  ..lineTo(0, 0)
                                                  ..lineTo(x, 0)
                                                  ..lineTo(x, y - 20)
                                                  ..lineTo(x - 20, y),
                                                color: hexToColor("#${column.color}"),
                                                paintingStyle: PaintingStyle.fill),
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(sticky.userName ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                                      const Icon(Icons.more_vert)
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(sticky.content ?? ""),
                                                ],
                                              ),
                                            )),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: CustomPaint(
                                                  painter: TrianglePainter(
                                                      drawShadow: false,
                                                      getPath: (double x, double y) => Path()
                                                        ..moveTo(0, 0)
                                                        ..lineTo(x, 0)
                                                        ..lineTo(0, y),
                                                      color: const Color(0xFF95B1A2),
                                                      paintingStyle: PaintingStyle.fill),
                                                )
                                            )
                                        ),
                                      ],
                                      ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                }else {
                  return const Text("Something went wrong");
                }
              },
            ),
        ),
      ),
    );
  }

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
