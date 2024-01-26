import 'package:flutter/material.dart';
import 'dart:html' as html;

void main() {
  runApp(MyApp());
}

class Anime {
  final String title;
  final String imageUrl;
  final String description;
  final String externalLink1;
  final String externalLink2;

  Anime({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.externalLink1,
    required this.externalLink2,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Archives',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.dark().copyWith(
          primary: Colors.deepPurple,
          secondary: Colors.deepPurpleAccent,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
        duration: 5,
        navigateAfterDuration: LoginPage(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  final int duration;
  final Widget navigateAfterDuration;

  SplashScreen({
    required this.duration,
    required this.navigateAfterDuration,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => navigateAfterDuration),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Anime Archives',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://t4.ftcdn.net/jpg/03/43/13/85/360_F_343138558_MAPBYXN96T52uDMyGxw67vLPgeYUx6v9.jpg',
              height: 200,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimeListScreen(),
                  ),
                );
              },
              child: Text('Log in'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ),
                );
              },
              child: Text('Forgot Password?'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccountPage(),
                  ),
                );
              },
              child: Text('Create an Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement logic to handle password reset
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
              ),
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement logic to handle account creation
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
              ),
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimeListScreen extends StatelessWidget {
  final List<Anime> animeList = [
    Anime(
      title: 'Attack on Titan',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg',
      description: 'After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction',
      externalLink1: 'https://myanimelist.net/anime/16498/Shingeki_no_Kyojin',
      externalLink2: 'https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki',
    ),
    Anime(
      title: 'My Hero Academia',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/10/78745.jpg',
      description: 'A superhero-admiring boy without any powers enrolls in a prestigious hero academy and learns what it really means to be a hero.',
      externalLink1: 'https://myanimelist.net/anime/31964/Boku_no_Hero_Academia',
      externalLink2: 'https://myheroacademia.fandom.com/wiki/My_Hero_Academia_Wiki',
    ),
    Anime(
      title: 'One Piece',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/1244/138851.jpg',
      description: 'Monkey D. Luffy sets off on an adventure with his pirate crew in hopes of finding the greatest treasure ever, known as the "One Piece."',
      externalLink1: 'https://myanimelist.net/anime/21/One_Piece',
      externalLink2: 'https://onepiece.fandom.com/wiki/One_Piece_Wiki',
    ),
    Anime(
      title: 'Demon Slayer',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BYTIxNjk3YjItYmYzMC00ZTdmLTk0NGUtZmNlZTA0NWFkZDMwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg',
      description: 'A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.',
      externalLink1: 'https://myanimelist.net/anime/38000/Kimetsu_no_Yaiba',
      externalLink2: 'https://kimetsu-no-yaiba.fandom.com/wiki/Kimetsu_no_Yaiba_Wiki',
    ),
    Anime(
      title: 'JoJos Bizzare Adventure',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/3/40409.jpg',
      description: 'The story of the Joestar family, who are possessed with intense psychic strength, and the adventures each member encounters throughout their lives.',
      externalLink1: 'https://myanimelist.net/anime/14719/JoJo_no_Kimyou_na_Bouken_TV',
      externalLink2: 'https://jojo.fandom.com/wiki/Main_Page',
    ),
    Anime(
      title: 'Bunny Girl Senpai',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/1301/93586.jpg',
      description: 'The seemingly normal life of Sakuta Azusagawa, a high school student changes drastically when he meets a wild bunny girl that seems to be invisible to others.',
      externalLink1: 'https://myanimelist.net/anime/37450/Seishun_Buta_Yarou_wa_Bunny_Girl_Senpai_no_Yume_wo_Minai',
      externalLink2: 'https://aobuta.fandom.com/wiki/Seishun_Buta_Yarou_wa_Bunny_Girl_Senpai_no_Yume_wo_Minai_Wiki',
    ),
    Anime(
      title: 'Naruto',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/13/17405.jpg',
      description: 'Naruto Uzumaki, a mischievous adolescent ninja, struggles as he searches for recognition and dreams of becoming the Hokage, the village leader and strongest ninja.',
      externalLink1: 'https://myanimelist.net/anime/20/Naruto',
      externalLink2: 'https://naruto.fandom.com/wiki/Narutopedia',
    ),
    Anime(
      title: 'Death Note',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/1079/138100.jpg',
      description: 'An intelligent high school student goes on a secret crusade to eliminate criminals from the world after discovering a notebook capable of killing anyone whose name is written into it.',
      externalLink1: 'https://myanimelist.net/anime/1535/Death_Note',
      externalLink2: 'https://deathnote.fandom.com/wiki/Death_Note_Wiki',
    ),
    Anime(
      title: 'KonoSuba',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/8/77831.jpg',
      description: 'It was a happy day for Kazuma - right up to the moment he died. A goddess intervenes and offers him a second chance in a magical land.',
      externalLink1: 'https://myanimelist.net/anime/30831/Kono_Subarashii_Sekai_ni_Shukufuku_wo',
      externalLink2: 'https://konosuba.fandom.com/wiki/Kono_Subarashii_Sekai_ni_Shukufuku_wo!_Wiki',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Archives'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeDetailScreen(anime: animeList[index]),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        animeList[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        animeList[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimeDetailScreen extends StatelessWidget {
  final Anime anime;

  AnimeDetailScreen({required this.anime});

  void _launchURL(String url) async {
    await html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(anime.imageUrl),
              SizedBox(height: 16),
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                anime.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Find out more on:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  _launchURL(anime.externalLink1);
                },
                child: Text(
                  'MyAnimeList',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  _launchURL(anime.externalLink2);
                },
                child: Text(
                  'Fandom Wiki',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}