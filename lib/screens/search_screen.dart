import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_repos/bloc/searchrepositories_bloc.dart';
import 'package:search_repos/consts/consts.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  Widget customTextFieldWithButton(BuildContext context) {
    return Stack(
      children: <Widget>[
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grey, width: 0.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              filled: true,
              fillColor: AppColors.white),
        ),
        Positioned(
          top: 4,
          left: 239,
          child: Container(
            width: 100,
            height: 42,
            child: TextButton(
                child: Text('Найти',
                    style: TextStyle(fontSize: 12, color: AppColors.white)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: AppColors.blue)))),
                onPressed: () =>
                    BlocProvider.of<SearchrepositoriesBloc>(context).add(
                      SearchRepoEvent(textEditingController.text),
                    )),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'ПОИСК',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Divider(
            color: AppColors.grey,
          ),
          Container(
              margin: EdgeInsets.only(top: 84),
              width: 343,
              height: 50,
              child: customTextFieldWithButton(context)),
        ],
      ),
    );
  }
}
