import 'dart:async';
// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdatePage extends StatefulWidget {
  // const UpdatePage({super.key});
  const UpdatePage(this.v1, this.v2, this.v3, this.v4, this.v5, {super.key});
  final v1, v2, v3, v4, v5;
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var _v1, _v2, _v3, _v4, _v5;
  TextEditingController collect_title = TextEditingController();
  TextEditingController collect_sub_title = TextEditingController();
  TextEditingController collect_image_url = TextEditingController();
  TextEditingController collect_detail = TextEditingController();

  @override
  void initState() {
    // collect: implement initState

    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
    _v5 = widget.v5;
    collect_title.text = _v2;
    collect_sub_title.text = _v3;
    collect_image_url.text = _v4;
    collect_detail.text = _v5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Edit Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: collect_title,
                decoration: InputDecoration(
                    labelText: 'ชื่อ title', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: collect_sub_title,
                decoration: InputDecoration(
                    labelText: 'ชื่อ sub_title', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: collect_image_url,
                decoration: InputDecoration(
                    labelText: 'ชื่อ image_url', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                minLines: 4,
                maxLines: 8,
                controller: collect_detail,
                decoration: InputDecoration(
                    labelText: 'รายละเอียด', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    print('-----------');
                    print('title: ${collect_title.text}');
                    print('sub_title: ${collect_sub_title.text}');
                    print('image_url: ${collect_image_url.text}');
                    print('detail: ${collect_detail.text}');
                    updateCollection();
                    final snackBar = SnackBar(
                      content: const Text('update success completed'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                  },
                  child: Text("แก้ไขรายการ"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigoAccent[100]),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(50, 20, 50, 20)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 30)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future updateCollection() async {
    var url = Uri.http('dekdee2.informatics.buu.ac.th:9090', '/api/api/update-collection/$_v1');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"title":"${collect_title.text}", "sub_title":"${collect_sub_title.text}", "image_url":"${collect_image_url.text}", "detail":"${collect_detail.text}"}';
    var response = await http.put(url, headers: header, body: jsondata);
    print('------result-------');
    print(response.statusCode);
  }
}
