import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_Image.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.haveTitle,
    required this.haveSearchBar,
    this.title,
    this.haveAction,
    this.centerTitle,
    this.haveDrawer,
    this.backgroundColor,
  });

  final Color? backgroundColor;
  final bool haveTitle, haveSearchBar;
  final bool? haveAction, centerTitle;
  final String? title;
  final bool? haveDrawer;

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + (haveSearchBar && haveTitle ? kToolbarHeight : 0),
  );

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor:
          widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Navigator.canPop(context)
          ? GestureDetector(
        onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
              child: AppImage(image: "arrow_back.svg"),
            ),
          )
          : null,
      centerTitle: widget.centerTitle ?? true,
      title: widget.haveTitle
          ? Text(widget.title ?? "", style: theme.textTheme.titleLarge)
          : null,
      actionsPadding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      // actions: widget.haveAction ?? false
      //     ? [
      //         PopupMenuTheme(
      //           data: PopupMenuThemeData(
      //             color: theme.scaffoldBackgroundColor,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(16),
      //             ),
      //             elevation: 5,
      //             position: PopupMenuPosition.under,
      //           ),
      //           child: PopupMenuButton(
      //             splashRadius: 16,
      //
      //             itemBuilder: (BuildContext context) {
      //               return [
      //                 PopupMenuItem(
      //                   onTap: () {
      //                     showCupertinoDialog(
      //                       context: context,
      //                       builder: (context) => Material(
      //                         child: Dialog(
      //                           child: Padding(
      //                             padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
      //                             child: Column(
      //                               mainAxisSize: MainAxisSize.min,
      //                               crossAxisAlignment: CrossAxisAlignment.start,
      //                               children: [
      //                                 const Padding(
      //                                   padding: EdgeInsetsGeometry.symmetric(
      //                                     vertical: 35,
      //                                   ),
      //                                   child: AppText(
      //                                     "Edit Title",
      //                                     textAlign: TextAlign.start,
      //                                   ),
      //                                 ),
      //                                 const AppInputText(
      //                                   padding: EdgeInsetsGeometry.symmetric(
      //                                     vertical: 25,
      //                                   ),
      //                                 ),
      //                                 Row(
      //                                   children: [
      //                                     Expanded(
      //                                       child: AppButton(
      //                                         //todo add update of title if edit
      //                                         onPressed: () {
      //                                           setState(() {
      //                                             // widget.title = "koko";
      //                                           });
      //                                           Navigator.pop(context);
      //                                         },
      //                                         padding:
      //                                             const EdgeInsetsDirectional.symmetric(
      //                                               vertical: 20,
      //                                             ),
      //                                         margin:
      //                                             const EdgeInsetsDirectional.only(
      //                                               top: 20,
      //                                               bottom: 40,
      //                                             ),
      //                                         text: "Save",
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     );
      //                   },
      //                   child: const Row(
      //                     spacing: 16,
      //                     children: [
      //                       AppImage(image: "edit_title.svg"),
      //                       AppText("Edit Title"),
      //                     ],
      //                   ),
      //                 ),
      //                 PopupMenuItem(
      //                   child: Row(
      //                     spacing: 16,
      //                     children: [
      //                       const AppImage(image: "delete_chat.svg"),
      //                       AppText(
      //                         "Delete Chat",
      //                         style: TextStyle(color: theme.colorScheme.error),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ];
      //             },
      //             child: const AppImage(image: "menu.svg"),
      //           ),
      //         ),
      //       ]
      //     : null,
      // bottom: widget.haveSearchBar
      //     ? PreferredSize(
      //         preferredSize: preferredSize,
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: SearchBarTheme(
      //             data: Theme.of(context).searchBarTheme,
      //             child: SearchBar(
      //               hintText: "Search",
      //               hintStyle: WidgetStatePropertyAll(
      //                 Theme.of(context).textTheme.titleSmall,
      //               ),
      //               // trailing: const [AppImage(image: "search.svg")],
      //               // textStyle: WidgetStatePropertyAll(
      //               //   Theme.of(context).textTheme.displayMedium,
      //               // ),
      //             ),
      //           ),
      //         ),
      //       )
      //     : null,
    );
  }
}
