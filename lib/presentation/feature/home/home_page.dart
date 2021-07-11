import 'package:flutter/material.dart';
import 'package:skillbox_load_file/domain/utils/configure_asset_path.dart';
import 'package:skillbox_load_file/domain/utils/fetch_file_from_asset.dart';
import 'package:skillbox_load_file/presentation/core/style/app_padding.dart';
import 'package:skillbox_load_file/presentation/core/style/ui_helper.dart';
import 'package:skillbox_load_file/presentation/widgets/text_button.dart';
import 'package:skillbox_load_file/presentation/widgets/text_field.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _assetPath = 'assets/data.txt';
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Padding(
        padding: AppPadding.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _textController,
                    ),
                  ),
                  CustomTextButton(
                    title: 'Найти',
                    onPressed: () {
                      _assetPath = configureAssetPath(
                        _textController.value.text,
                      );
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            UIHelper.verticalPadding,
            FutureBuilder(
              future: fetchFileFromAsset(_assetPath),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text('файл не найден');

                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          snapshot.data.toString(),
                        ),
                      ),
                    );
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    return Text('');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
