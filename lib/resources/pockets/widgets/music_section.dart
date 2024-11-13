import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'actions/single_music_action.dart';
import '../floating_music.dart';

class MusicSection extends StatelessWidget {
  final String title;
  final List<dynamic> songs;
  final VoidCallback onToggle;
  final GlobalKey<FloatingMusicState> floatingMusicKey;

  const MusicSection({
    Key? key,
    required this.title,
    required this.songs,
    required this.onToggle,
    required this.floatingMusicKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  child: Text(
                    title,
                    style: GoogleFonts.notoSans(
                      textStyle: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w800)
                    )
                  )
                ),
                Positioned(
                  right: 20,
                  top: 2,
                  bottom: 2,
                  child: InkWell(
                    onTap: () {},
                    child: Text('View all >',
                      style: TextStyle(color: Colors.white38, fontSize: 10.0)
                    )
                  )
                )
              ],
            ),
          )
        ),
        Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 10),
                child: single_music_action(
                  onToggle: onToggle,
                  musicTitle: song.musicTitle,
                  musicWriter: song.musicWriter,
                  audioUrl: song.audioUrl,
                  thumbnail: song.thumnail,
                  floatingMusicKey: floatingMusicKey,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}