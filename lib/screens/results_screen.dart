import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_repos/bloc/searchrepositories_bloc.dart';
import 'package:search_repos/consts/consts.dart';
import 'package:search_repos/services/data_parse_service.dart';
import 'package:search_repos/widgets/badge_widget.dart';

class ResultsScreen extends StatelessWidget {
  DataParseService dataParseService = DataParseService();

  Widget cardWidget(
      {String repoName,
      String starsCount,
      String avatar,
      String login,
      String updatedAt}) {
    return Container(
      height: 132,
      width: 343,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: AppColors.grey,
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 16),
                child: Text(
                  repoName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 16),
                child: BadgeWidget(
                  number: starsCount,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4.0),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(avatar))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    login,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 311,
            child: Divider(
              color: AppColors.grey,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 16, left: 16),
              child: Row(
                children: [
                  Text(
                    'Обновлено: ',
                  ),
                  Text(updatedAt),
                ],
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'РЕЗУЛЬТАТ ПОИСКА',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocBuilder<SearchrepositoriesBloc, SearchRepositoriesState>(
          builder: (context, state) {
        return Column(
          children: [
            Divider(
              color: AppColors.grey,
            ),
            SizedBox(
              height: 19,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ПО ЗАПРОСУ: ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppColors.lighterGrey),
                    ),
                    Text(
                      '"$keyword"',
                      style: TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Text(
                  'НАЙДЕНО: ${repositories.totalCount.toString()}',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.lighterGrey),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: repositories.totalCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(16),
                    child: cardWidget(
                      repoName: repositories.items[index].name,
                      starsCount:
                          repositories.items[index].stargazersCount.toString(),
                      avatar: repositories.items[index].owner.avatarUrl,
                      login: repositories.items[index].owner.login,
                      updatedAt: dataParseService
                          .parseDate(repositories.items[index].updatedAt),
                    ),
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
