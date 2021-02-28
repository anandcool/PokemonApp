import 'package:flutter/material.dart';
import 'package:pokemonapp/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail(this.pokemon);

  BodyWidget(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height / 1.8,
          width: MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text("Height ${pokemon.height}"),
                Text("Weight ${pokemon.weight}"),
                Text("Types"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((e) => FilterChip(
                            label: Text(e),
                            backgroundColor: Colors.amber,
                            onSelected: (b) {},
                          ))
                      .toList(),
                ),
                Text("Weakness"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses
                      .map((e) => FilterChip(
                            label: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red,
                            onSelected: (b) {},
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(pokemon.img), fit: BoxFit.cover)),
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(pokemon.name),
      ),
      body: BodyWidget(context),
    );
  }
}
