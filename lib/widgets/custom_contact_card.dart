import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomContactCard extends StatelessWidget {
  final String? img;
  final String name;
  final String detail;
  final GestureTapCallback onTap;
  final VoidCallback onPressedFav;
  final VoidCallback? onPressedDel;
  final bool isFav;

  const CustomContactCard({
    Key? key,
    this.img,
    required this.name,
    required this.detail,
    required this.onTap,
    required this.onPressedFav,
    this.onPressedDel,
    this.isFav = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider((img != ''
                      ? img
                      : 'https://ui-avatars.com/api/?name=$name')!),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        detail,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFav ? Colors.red[600] : Colors.grey,
                ),
                onPressed: onPressedFav,
              ),
              !isFav
                  ? IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent[700]),
                      onPressed: onPressedDel,
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
