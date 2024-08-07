import 'package:flutter/material.dart';

import '../../../../componenets/custom_scaffold.dart';
import '../../../../core/device/routes/routes_manager.dart';
import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/helpers/helpers.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    // context.read<HomeBloc>().add(PostFetchingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useFloatingActionButton: true,
      onFloatingActionButtonPressed: () {
        Helpers.navigateToPage(RoutesManager.postCreateRoute);
      },
      appBar: AppBar(
        title: const Text('Tramatch Post'),
        centerTitle: true,
        foregroundColor: ColorConstants.white,
        backgroundColor: ColorConstants.primary,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Post View'),
      ),

      // body: BlocConsumer<HomeBloc, HomeState>(
      //   bloc: context.read<HomeBloc>(),
      //   listener: (context, state) {},
      //   builder: (context, state) {
      //     switch (state.runtimeType) {
      //       case const (PostFetchingLoadingState):
      //         return const PostTileShimmer();
      //       case const (PostFetchingErrorState):
      //         final postErrorState = state as PostFetchingErrorState;
      //         return Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               const Icon(
      //                 Icons.sentiment_dissatisfied_rounded,
      //                 color: ColorConstants.primary,
      //                 size: 50,
      //               ),
      //               const Gap(10),
      //               Text(postErrorState.error),
      //               const Gap(20),
      //               CustomButton(
      //                   width: 200,
      //                   text: 'Refresh',
      //                   textColor: ColorConstants.white,
      //                   backgroundColor: ColorConstants.primary,
      //                   onPressed: () {
      //                     context.read<HomeBloc>().add(PostFetchingEvent());
      //                   }),
      //             ],
      //           ),
      //         );
      //       case const (PostFetchingLoadedState):
      //         final postLoadedState = state as PostFetchingLoadedState;
      //         return CustomRefreshIndicator(
      //           onRefresh: () async {
      //             context.read<HomeBloc>().add(PostFetchingEvent());
      //           },
      //           child: SingleChildScrollView(
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Column(
      //                 children: [
      //                   ListView.separated(
      //                     itemCount: postLoadedState.posts.length,
      //                     physics: const NeverScrollableScrollPhysics(),
      //                     shrinkWrap: true,
      //                     separatorBuilder: (context, index) => const Gap(10),
      //                     itemBuilder: (context, index) {
      //                       var post = postLoadedState.posts[index];
      //                       final title = post.title;
      //                       final body = post.body;
      //                       final userId = post.userId.toString();
      //                       final id = post.id.toString();
      //                       return PostTile(
      //                           title: title!,
      //                           body: body!,
      //                           onPostTileTap: () {
      //                             Helpers.navigateToPage(
      //                               RoutesManager.postDetailRoute,
      //                               arguments: {
      //                                 'title': title,
      //                                 'body': body,
      //                                 'userId': userId,
      //                                 'id': id,
      //                               },
      //                             );
      //                           },
      //                           onEditTap: () {
      //                             Helpers.navigateToPage(
      //                               RoutesManager.postEditRoute,
      //                               arguments: {
      //                                 'title': title,
      //                                 'body': body,
      //                                 'userId': post.userId,
      //                                 'id': post.id,
      //                               },
      //                             );
      //                           },
      //                           onDeleteTap: () {
      //                             ConfirmDeleteBottomSheet.show(context,
      //                                 id: post.id!);
      //                           });
      //                     },
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //         );
      //       default:
      //         return const SizedBox();
      //     }
      //   },
      // ),
    );
  }
}
