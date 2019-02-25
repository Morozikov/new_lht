import 'package:flutter/material.dart';

import 'package:share/share.dart';
import 'package:flutter_lht_news/model/news.dart';
import 'package:intl/intl.dart';




class CustomCard extends StatelessWidget {
  final News news;
  final bool enabled;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;
  final bool selected;

  const CustomCard({
    Key key,
    this.news,
    this.enabled: true,
    this.onTap,
    this.onLongPress,
    this.selected: false,
  })  : assert(news != null),
        super(key: key);



//  CustomCard(this.data, {Key key}) : super(key: key);

  Widget _getImage() {
    if (news.urlToImage == null) {
      return new Container(
          constraints: new BoxConstraints.expand(
            height: 200.0,
          ),
          alignment: Alignment.bottomLeft,
          decoration: new BoxDecoration(

            image: new DecorationImage(

              image: new AssetImage('images/news_cover.png'),
              fit: BoxFit.cover,

            ),
          ),
          child: new Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
            decoration: BoxDecoration(color: Colors.black87),
            child:
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 5.0),
              child: Text(

                news.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          )
      );
    }



    return new Container(
      constraints: new BoxConstraints.expand(
        height: 200.0,
      ),
      alignment: Alignment.bottomLeft,
      decoration: new BoxDecoration(

        image: new DecorationImage(

          image: new NetworkImage(news.urlToImage),
          fit: BoxFit.cover,


        ),
      ),
      child: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
        decoration: BoxDecoration(color: Colors.black87),
        child:
        Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 5.0),
          child: Text(

            news.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,


            ),
          ),
        ),
      )
    );




  }

  @override
  Widget build(BuildContext context) {
    return Column(


      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

          Stack(children: <Widget>[
              _getImage(),
          new Positioned.fill(
          child: new Material(
          color: Colors.transparent,
          child: _getInkWell()
          ))
          ]),






        ButtonTheme.bar(
          child: new Container(
            decoration: BoxDecoration(color: Colors.black38),
            child:
            ListTile(

                title: Text(
                    '-${news.source.name}, ${DateFormat('d.MM.y').format(DateTime.parse(news.publishedAt))}',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13.0,
                      fontStyle: FontStyle.italic

                    ),
                    overflow: TextOverflow.ellipsis),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child:  IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
//                          Share.share('${news.title} ${news.url}');
                        },
                        color: Theme.of(context).buttonColor,
                      ),
                    ),
                    Container(
                      child:  IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          Share.share('${news.title} ${news.url}');
                        },
                        color: Theme.of(context).buttonColor,
                      ),
                    )
                  ],
                )

            ),
          )

        ),
      ],
    );


  }

  Widget _getInkWell() {


    return new InkWell(
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      child: Semantics(
          selected: selected,
          enabled: enabled,
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 200.0, maxHeight: 200.0),
              child: CustomMultiChildLayout(
                delegate: ItemLayoutDelegate(),
//                children: children,
              ))),
    );


  }




}

enum _Block {
  bg,
  text,
}

class ItemLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild(_Block.bg)) {
      layoutChild(_Block.bg, new BoxConstraints.tight(size));
      positionChild(_Block.bg, Offset.zero);
    }

    if (hasChild(_Block.text)) {
      layoutChild(_Block.text,
          new BoxConstraints.tight(Size(size.width, size.height * 0.4)));
      positionChild(
          _Block.text, new Offset(0.0, size.height - size.height * 0.4));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}

