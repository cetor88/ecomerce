import 'dart:html';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;
import 'dart:ui' as ui;

void main() async => runApp(MyApp());

final int MAX_WIDTH = 1440;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
            //child: Placeholder(),
            child: ContentWidget(
          child: Column(
            children: [
              HeaderWidget(), //seccion1
              SizedBox(height: 12),
              BraodsWidget(), //seccion2
              SizedBox(height: 12),
              PainterImage(), //seccion3
              SizedBox(height: 12),
              FeatureWidget(), //seccion4
              SizedBox(height: 12),
              ServicesWidget(), //seccion5
              SizedBox(height: 12),
              Dibujo(), //seccion6
              SizedBox(height: 12),
              FooterWidget(), //seccion7
            ],
          ),
        )),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final Widget child;
  const ContentWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screen.width < MAX_WIDTH ? screen.width : MAX_WIDTH,
          child: child,
        ),
      ],
    );
  }
}

class HideIf extends StatelessWidget {
  @required
  final double widthLessThan;
  @required
  final Widget child;

  const HideIf({Key key, this.widthLessThan, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    if (screen.width > widthLessThan) {
      return child;
    }
    return Container();
  }
}

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    var width = screen.width < MAX_WIDTH ? screen.width : MAX_WIDTH;
    return Container(
      height: width * 3 / 7.0,
      child: Row(
        children: [
          Container(
            color: Color.fromARGB(250, 29, 129, 121),
            width: width * 3 / 7.0,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: _headLine(context),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/waitting.jpg'),
                fit: BoxFit.none,
              )),
            ),
          )
        ],
      ),
    );
  }

  Widget _headLine(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    var width = screen.width < MAX_WIDTH ? screen.width : MAX_WIDTH;
    print("**" + ((width - 500) / MAX_WIDTH).toString());
    double leftPadding = lerpDouble(8, 180, (width - 500) / MAX_WIDTH);
    double otherPadding = lerpDouble(4, 40, (width - 500) / MAX_WIDTH);

    double titleFontSize = lerpDouble(12, 45, (width - 500) / MAX_WIDTH);
    double subTitleFontSize = lerpDouble(8, 16, (width - 500) / MAX_WIDTH);
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding,
          top: otherPadding,
          right: otherPadding,
          bottom: otherPadding),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Feel the Conform Usin our Products",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
              child: Text(
                  "lorem Incididunt aute incididunt cillum qui consectetur. lorem Incididunt aute incididunt cillum qui consectetur.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: subTitleFontSize,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    child: FlatButton(
                      child: Text(
                        "Shop Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      textColor: Colors.white,
                      color: Colors.orange,
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                HideIf(
                  widthLessThan: 700,
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white),
                        left: BorderSide(width: 1, color: Colors.white),
                        right: BorderSide(width: 1, color: Colors.white),
                        top: BorderSide(width: 1, color: Colors.white),
                      )),
                      child: FlatButton(
                        textColor: Colors.white,
                        child: Text("try to My Room"),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}

class BraodsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: 100, height: 100, child: Placeholder()),
        Container(width: 100, height: 100, child: Placeholder()),
        Container(width: 100, height: 100, child: Placeholder()),
        Container(width: 100, height: 100, child: Placeholder()),
      ],
    );
  }
}

class FeatureWidget extends StatefulWidget {
  @override
  _FeatureWidgetState createState() => _FeatureWidgetState();
}

class _FeatureWidgetState extends State<FeatureWidget> {
  int currentSelection = 0;
  List<String> galleryPhotos = [
    "sofa1.jpg",
    "sofa2.jpg",
    "sofa3.jpg",
    "sofa4.jpg",
    "sofa5.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Column(
        children: [
          _header(),
          Expanded(child: _content()),
        ],
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Text(
          "Our Feature Item",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            width: 2.0,
            height: 40,
            color: Colors.grey,
          ),
        ),
        Flexible(
            child: Text(
                "Qui consequat reprehenderit ad velit cupidatat incididunt ut occaecat est sit qui irure consectetur. reprehenderit ad velit cupidatat incididunt ut occaecat est sit qui irure consectetur."))
      ],
    );
  }

  Widget _content() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: [
          Positioned(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: constraints.biggest.width * 0.2),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Image.asset(
                  "assets/${galleryPhotos[currentSelection]}",
                  key: Key(galleryPhotos[currentSelection]),
                ),
              ),
            ),
          ),
          Positioned(
            right: constraints.biggest.width * 0.2 / 2.5,
            bottom: 0,
            top: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Color chiuse"),
                _choise(Colors.green, 0),
                SizedBox(
                  height: 12,
                ),
                _choise(Colors.orange, 1),
                SizedBox(
                  height: 12,
                ),
                _choise(Colors.blue, 2),
                SizedBox(
                  height: 12,
                ),
                _choise(Colors.brown, 3),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget _choise(Color color, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentSelection = index;
        });
      },
      child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: currentSelection == index
              ? Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white),
                  ),
                )
              : null),
    );
  }
}

class ServicesWidget extends StatefulWidget {
  @override
  _ServicesWidgetState createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  void initState() {
    final IFrameElement _iframeElement = IFrameElement();
    _iframeElement.height = '400';
    _iframeElement.width = '300';
    _iframeElement.src = _documentPath;
    _iframeElement.style.border = 'none';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _iframeWidget;
    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );

    return Container(
      height: 400,
      child: _iframeWidget,
    );
  }
}

const String _documentPath = 'assets/demo.pdf';

class Dibujo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          );
        }));
    final bytes = pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');
    return Container(
        height: 600,
        color: Colors.grey,
        child: CustomPaint(
            painter: MyPainter(),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      RaisedButton(
                        child: Text("Open"),
                        onPressed: () {
                          final url = html.Url.createObjectUrlFromBlob(blob);
                          html.window.open(url, "_blank");
                          html.Url.revokeObjectUrl(url);
                        },
                      ),
                      RaisedButton(
                        child: Text("Download"),
                        onPressed: () {
                          final url = html.Url.createObjectUrlFromBlob(blob);
                          final anchor = html.document.createElement('a')
                              as html.AnchorElement
                            ..href = url
                            ..style.display = 'none'
                            ..download = 'some_name.pdf';
                          html.document.body.children.add(anchor);
                          anchor.click();
                          html.document.body.children.remove(anchor);
                          html.Url.revokeObjectUrl(url);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // _iframeWidget
                    ],
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) async {
    var redPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    var bluePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    var rect = Rect.fromLTWH(50, size.height - 100, size.width - 100, 100);
    canvas.drawCircle(Offset(100, 100), 50.0, redPaint);
    canvas.drawLine(Offset.zero, Offset(100, 100), bluePaint);
    canvas.drawOval(Rect.fromLTWH(size.width / 2, 0, 100, 150), redPaint);
    canvas.drawRect(rect, redPaint);
    canvas.drawArc(rect, 0, math.pi, true, redPaint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}

class PainterImage extends StatefulWidget {
  @override
  _PainterImageState createState() => _PainterImageState();
}

class _PainterImageState extends State<PainterImage> {
  ui.Image _image;
  Size size;
  List<String> labels;
  @override
  void initState() {
    super.initState();
    _loadImage();
    labels= new List<String>();
    labels.add("Nombre");
    labels.add("importe");
    labels.add("total");
  }

  _loadImage() async {
    ByteData bd = await rootBundle.load("assets/sofa2.jpg");
    final Uint8List bytes = Uint8List.view(bd.buffer);
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.Image image = (await codec.getNextFrame()).image;
    setState(() => _image = image);
  }

  @override
  Widget build(BuildContext context) {
    setState(() => size = MediaQuery.of(context).size);
    return Row(
      children: [
        Container(
          height: 600,
          width: size.width * .5,
          color: Colors.greenAccent,
          child: Column(
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: constraints.biggest.width * 0.2),
                          child: CustomPaint(
                            painter: SecondPainter(),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
         Container(
          height: 600,
          width: size.width * .5,
          color: Colors.orangeAccent,
          child: Column( 
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: constraints.biggest.width * 0.2),
                          child: CustomPaint(
                            painter: TherdPainter(_image),
                            child: Container(
                              height: size.height * .50,
                              //color: Colors.red,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text("Nombre", style: TextStyle(color: Colors.red),),
                                    Text("Apellido Paterno", style: TextStyle(color: Colors.red),),
                                    Text("Apellido Materno", style: TextStyle(color: Colors.red),),
                                    Text("Edad", style: TextStyle(color: Colors.red),),
                                    Text("Sexo", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          )
         ),
      ],
    );
  }
}

class SecondPainter extends CustomPainter {
  SecondPainter() : super();

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = ui.TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    final paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText('Hello, world.');
    final constraints = ui.ParagraphConstraints(width: 300);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    final offset = Offset(50, 100);
    canvas.drawParagraph(paragraph, offset);
  }

  @override
  bool shouldRepaint(SecondPainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRebuildSemantics(SecondPainter oldDelegate) => false;
}

class TherdPainter extends CustomPainter {
  ui.Image image;
  TherdPainter(this.image) : super();

  @override
  void paint(Canvas canvas, Size size) {
    if (image != null) {
      canvas.drawImage(image, Offset(0.0, 0.0), Paint());
      //canvas.drawImageRect(image, src, dst, paint)
    }
  }

  @override
  bool shouldRepaint(TherdPainter oldDelegate) {
    return image != (oldDelegate as TherdPainter).image;
  }

  @override
  bool shouldRebuildSemantics(TherdPainter oldDelegate) => false;
}

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text("textto " * 3)],
    );
  }
}
