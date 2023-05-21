import 'package:flutter/material.dart';
import 'package:tugas_akhir/Music/HttpDependencies/ApiDataSource.dart';
import 'package:tugas_akhir/Music/Models/track.dart';
import 'package:tugas_akhir/Music/musicDetail.dart';

class MusicLyrics extends StatefulWidget {
  const MusicLyrics({super.key});

  @override
  State<MusicLyrics> createState() => _MusicLyricsState();
}

class _MusicLyricsState extends State<MusicLyrics> {
  TextEditingController searchController = TextEditingController();
  String search = "";
  String terms = "";
  List<bool> _selections = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 7 / 8,
            alignment: Alignment.center,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffix: ElevatedButton(
                  child: Text("Search"),
                  onPressed: () {
                    setState(() {
                      search = searchController.text;
                    });
                  },
                ),
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ToggleButtons(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Track',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Artist'),
                ),
              ],
              isSelected: _selections,
              onPressed: (index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _selections.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _selections[buttonIndex] = true;
                    } else {
                      _selections[buttonIndex] = false;
                    }
                  }
                });
              }),
          SizedBox(
            height: 5,
          ),
          Flexible(
            child: FutureBuilder(
              future: (_selections[0] == true)
                  ? ApiDataSource.instance.trackSearchBySong(search)
                  : ApiDataSource.instance.trackSearchByArtist(search),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return _buildErrorSection();
                }
                if (snapshot.hasData) {
                  TrackModel model = TrackModel.fromJson(snapshot.data);

                  // print(model.message!.body!.trackList![0].trackDetail);

                  return _buildSuccessSection(model);
                }
                return _buildLoadingSection();
              },
            ),
          )
        ],
      )),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(TrackModel model) {
    List<Track> list = model.message!.body!.trackList;

    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailLyric(track: list[index].trackDetail),
                )),
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Image.network(
                        'https://w7.pngwing.com/pngs/250/419/png-transparent-musical-note-song-rectangle-logo-number-thumbnail.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].trackDetail.trackName,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(list[index].trackDetail.artistName),
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
