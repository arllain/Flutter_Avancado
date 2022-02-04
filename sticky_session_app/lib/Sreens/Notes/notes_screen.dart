import 'package:flutter/material.dart';
import 'package:sticky_session_app/constants.dart';
import 'package:sticky_session_app/widgets/triangle_painter.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: kRedColor,
              shadowColor: Colors.grey.shade50,
              centerTitle: true,
              title: const Text(
                'Starfish',
              ),
              bottom: TabBar(
                labelColor: kGreen,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                unselectedLabelColor: Colors.grey.shade700,
                indicatorColor: kLightGreen,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("START"),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: kGreen,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: const Text(
                            "32",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              color: Colors.white,
              child: TabBarView(children: [
                Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(notesCreateRouter);
                            },
                            child: const Text("+ NEW NOTE")),
                        const SizedBox(
                          height: 16,
                        ),
                        Stack(children: [
                          CustomPaint(
                            painter: TrianglePainter(
                                drawShadow: true,
                                getPath: (double x, double y) => Path()
                                  ..moveTo(0, y)
                                  ..lineTo(0, 0)
                                  ..lineTo(x, 0)
                                  ..lineTo(x, y - 20)
                                  ..lineTo(x - 20, y),
                                color: kLightGreen,
                                paintingStyle: PaintingStyle.fill),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Username",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Icon(Icons.more_vert)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque consequat ut lorem quis consectetur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque consequat ut lorem quis consectetur.",
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                                  ))),
                        ])
                      ],
                    )),
              ]),
            )));
  }
}
