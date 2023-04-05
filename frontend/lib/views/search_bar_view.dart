import 'package:danim/view_models/app_view_model.dart';
import 'package:danim/view_models/search_bar_view_model.dart';
import 'package:danim/view_models/search_result_view_model.dart';
import 'package:danim/view_models/user_timeline_list_view_model.dart';
import 'package:danim/views/search_result_page.dart';
import 'package:danim/views/user_timeline_list_view.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

var logger = Logger();

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, _) {
        return Consumer<SearchBarViewModel>(
          builder: (context, viewModel, _) {
            return Stack(
              children: [
                SizedBox(
                  height: viewModel.searchedResults.isEmpty
                      ? (viewModel.searchedResults.length + 1) * 105
                      : viewModel.searchedResults.length == 1
                          ? (viewModel.searchedResults.length + 1) * 79
                          : (viewModel.searchedResults.length + 1) * 75,
                  child: Column(
                    children: [
                      // 키워드가 없을 때엔 검색 결과창이 뜨지 않는다.
                      viewModel.searchKeyWord != ""
                          ? Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 30),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Colors.transparent, width: 2),
                                      left: BorderSide(
                                          color: Colors.black54, width: 2),
                                      right: BorderSide(
                                          color: Colors.black54, width: 2),
                                      bottom: BorderSide(
                                          color: Colors.black54, width: 2),
                                    )),
                                child: Container(
                                  margin: const EdgeInsets.only(top: 14),
                                  child: SizedBox(
                                    height:
                                        (viewModel.searchedResults.length + 1) *
                                            75,
                                    child: ListView.builder(
                                      itemCount:
                                          viewModel.searchedResults.length + 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (index == 0) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangeNotifierProvider<
                                                          SearchResultViewModel>(
                                                    create: (_) =>
                                                        SearchResultViewModel(
                                                            context,
                                                            viewModel
                                                                .searchKeyWord!,
                                                            userUid: viewModel
                                                                .userUid),
                                                    child: SearchResultView(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: ListTile(
                                              leading: const Icon(Icons.search),
                                              title: Text(
                                                  "${viewModel.searchKeyWord}(으)로 검색..."),
                                            ),
                                          );
                                        } else {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangeNotifierProvider<
                                                          UserTimelineListViewModel>(
                                                    create: (_) =>
                                                        UserTimelineListViewModel(
                                                            context: context,
                                                            myInfo: appViewModel
                                                                .userInfo,
                                                            userInfo: viewModel
                                                                    .searchedResults[
                                                                index - 1]),
                                                    child:
                                                        UserTimeLineListView(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                const Divider(
                                                  height: 1,
                                                  thickness: 1,
                                                ),
                                                ListTile(
                                                  leading: SizedBox(
                                                    width: 45,
                                                    height: 45,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      child:
                                                          ExtendedImage.network(
                                                        viewModel
                                                            .searchedResults[
                                                                index - 1]
                                                            .profileImageUrl,
                                                        fit: BoxFit.cover,
                                                        cache: true,
                                                      ),
                                                    ),
                                                  ),
                                                  title: Text(viewModel
                                                      .searchedResults[
                                                          index - 1]
                                                      .nickname),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                // 검색창을 위에 띄우기 위해 children 내에서 뒤에 위치시킨다.
                Container(
                  color: Colors.white,
                  height: 45,
                  child: TextFormField(
                    onTap: () {
                      logger.d(viewModel.myfocus.hasFocus);
                    },
                    focusNode: viewModel.myfocus,
                    keyboardType: TextInputType.text,
                    onChanged: (String? keyword) async {
                      viewModel.searchUser(context, keyword);
                      viewModel.searchKeyWord = keyword;
                    },
                    // 포커스 일 때 스타일 바꾸기
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(color: Colors.black54, width: 2)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black54, width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 3),
                      ),
                      suffixIcon: Icon(Icons.search, color: Colors.blueAccent),
                      hintText: "검색...",
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}