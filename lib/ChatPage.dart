import 'package:flutter/material.dart';
import 'package:guidini_app/WelcomePage.dart';
import 'package:guidini_app/MapPage.dart';
import 'package:guidini_app/ProfilePage.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> messages = [];

  final messageInsert = TextEditingController();

  final Map<String, String> responses = {
    "hi": "Hello!",
    "hello": "Hello!",
    "how are you?": "I'm good, thank you!",
    "what's your name?": "My name is Chatbot.",
    "capital of Tunisia": "The capital city of Tunisia is Tunis.",
    "geography of Tunisia": "Tunisia is located in North Africa and is bordered by the Mediterranean Sea to the north and the Sahara Desert to the south.",
    "official language of Tunisia": "The official language of Tunisia is Arabic.",
    "weather in Tunisia": "Tunisia has a Mediterranean climate with hot summers and mild winters.",
    "currency used in Tunisia": "The currency used in Tunisia is the Tunisian Dinar (TND).",
    "history of Tunisia": "Tunisia has a rich history, including ancient Carthage, Roman rule, Arab conquest, and French colonization.",
    "famous landmarks in Tunisia": "Some famous landmarks in Tunisia include the ruins of Carthage, the Medina of Tunis, and the Amphitheatre of El Jem.",
    "population of Tunisia": "As of the latest estimates, the population of Tunisia is around 11 million people.",
    "local cuisine in Tunisia": "Tunisian cuisine is known for its diverse flavors, including dishes like couscous, brik, and tagine.",
    "traditional Tunisian dishes": "Some traditional Tunisian dishes include couscous with lamb, brik filled with eggs and tuna, and mechoui (slow-roasted lamb).",
    "Tunisia known for music and dance": "Yes, Tunisia is known for its traditional music, including the use of instruments like the oud, and traditional dance forms like the Stambali.",
    "What are the must-visit places in Tunisia?": "Some must-visit places in Tunisia include Carthage, the Medina of Tunis, and the Amphitheatre of El Jem.",
    "Can you recommend popular beaches in Tunisia?": "Yes, some popular beaches in Tunisia are Sidi Bou Said Beach, Djerba Beach, and Hammamet Beach.",
    "What is unique about Tunisian architecture?": "Tunisian architecture is known for its mix of Arab, French, and Islamic influences, seen in structures like the Great Mosque of Kairouan and historical medinas.",
    "Are there any traditional festivals in Tunisia?": "Yes, Tunisia celebrates various festivals, including the Carthage Film Festival, International Festival of the Sahara, and the Festival of the Medina of Tunis.",
    "Tell me about the traditional music of Tunisia.": "Tunisia has a rich musical heritage, and traditional music often features instruments like the oud. The Stambali is a popular traditional dance form.",
    "What activities are available in the Sahara Desert?": "In the Sahara, you can experience camel treks, visit oasis towns like Tozeur, and explore the unique landscapes of the desert.",
    "How is the weather in Tunisia during the summer?": "Tunisia experiences hot summers with temperatures ranging from 25°C to 40°C (77°F to 104°F). It's ideal for beachgoers and outdoor activities.",
    "What are some traditional Tunisian dishes to try?": "You must try couscous with lamb, brik filled with eggs and tuna, and mechoui (slow-roasted lamb). Tunisian cuisine is diverse and flavorful.",
    "Can you recommend accommodations in Tunis?": "Popular accommodations in Tunis include Hotel La Maison Blanche, La Villa Bleue, and The Residence Tunis.",
    "How is transportation within Tunisia?": "Tunisia has a well-developed transportation system. You can use trains, buses, and taxis to travel between cities and explore the country.",
    "Tell me about the history of Carthage.": "Carthage was an ancient city-state and a major power in the Mediterranean. It played a significant role in the Punic Wars and was later destroyed by the Romans.",
    "Is Tunisia known for its handicrafts?": "Yes, Tunisia is known for its handicrafts, including ceramics, carpets, and traditional textiles. The markets in cities like Tunis and Sidi Bou Said offer a variety of crafts.",
    "What is the official language spoken in Tunisia?": "The official language of Tunisia is Arabic. French is also widely spoken, especially in urban areas and the tourism industry.",
    "How can I experience the local culture in Tunisia?": "You can immerse yourself in the local culture by exploring traditional markets (souks), attending festivals, and engaging with locals in cafes and cultural events.",
    "Are there guided tours available for historical sites?": "Yes, there are guided tours available for historical sites like Carthage, Dougga, and the Medina of Tunis. Knowledgeable guides provide insights into the rich history of these places.",
    "Tell me about the nightlife in Tunisia.": "Tunisia offers a vibrant nightlife, especially in coastal cities. You can find lively bars, nightclubs, and beach parties, providing a mix of modern and traditional entertainment.",
    "What's the best time to visit Tunisia?": "The best time to visit Tunisia is during the spring (March to May) and fall (September to November) when the weather is pleasant for outdoor activities and sightseeing.",
    "Are there any UNESCO World Heritage Sites in Tunisia?": "Yes, Tunisia has several UNESCO World Heritage Sites, including the Archaeological Site of Carthage, Medina of Tunis, and Dougga / Thugga.",
    "How is the local transportation in Djerba?": "Djerba has taxis, buses, and rental cars for local transportation. Taxis are a common and convenient way to explore the island.",
    "Tell me about traditional Tunisian clothing.": "Traditional Tunisian clothing includes the 'Jebba' for men and the 'Karftan' for women. These garments are often worn during special occasions and celebrations.",
    "What are the famous traditional beverages in Tunisia?": "Try 'Boukha,' a fig-based spirit, and 'Makhroud,' a date-filled pastry, for a taste of traditional Tunisian beverages and snacks.",
    "What are the regulations for visiting archaeological sites?": "When visiting archaeological sites, follow regulations, such as staying on designated paths, not touching artifacts, and respecting site-specific rules for preservation.",
    "Can you recommend a scenic route for a road trip in Tunisia?": "The route from Tunis to Tozeur offers a scenic road trip, passing through diverse landscapes, historical sites, and picturesque towns.",
    "Tell me about the significance of the Zitouna Mosque.": "Zitouna Mosque, located in the Medina of Tunis, is a historic mosque dating back to the 8th century, known for its architectural beauty and cultural importance.",
    "What wildlife can be found in Tunisia?": "Tunisia is home to diverse wildlife, including Barbary macaques, African elephants (in protected areas), various bird species, and marine life along the coast.",
    "Can you recommend a traditional Tunisian dessert?": "Try 'Baklava,' a sweet pastry made of layers of filo dough, filled with chopped nuts and sweetened with honey or syrup, as a delicious traditional dessert.",
    "Tell me about the famous Bardo National Museum.": "The Bardo National Museum in Tunis is renowned for its extensive collection of Roman mosaics, sculptures, and artifacts, offering a journey through Tunisia's history.",
    "Can you recommend historical sites in Kairouan?": "Kairouan, known for its rich history, has historical sites like the Kairouan Great Mosque, the Mosque of Uqba, and the Aghlabid Basins.",
    "What are the main souvenirs to buy in Tunisia?": "Popular souvenirs in Tunisia include traditional carpets, ceramics, olive oil products, and handmade crafts from local markets.",
    "Tell me about the ancient city of Dougga.": "Dougga is a UNESCO World Heritage Site with well-preserved Roman ruins, including a Capitol, theaters, and temples, providing a glimpse into ancient Carthaginian and Roman life.",
    "Are there any health precautions for travelers to Tunisia?": "Before traveling to Tunisia, it's advisable to check for any required vaccinations and stay informed about health precautions. It's also recommended to have travel insurance.",
    "Can you recommend scenic spots for photography in Tunisia?": "Capture stunning photos at locations like Sidi Bou Said with its blue-and-white architecture, the Amphitheatre of El Jem, and the Chott el Jerid salt flats.",
    "Tell me about the significance of the Ribat in Monastir.": "The Ribat in Monastir is a historic fortress with a watchtower, providing panoramic views of the city and the Mediterranean Sea. It played a role in local defense.",
    "What are the traditional art forms in Tunisia?": "Traditional art forms in Tunisia include calligraphy, pottery, and ceramic work, often showcasing intricate designs and patterns.",
    "Can you recommend natural attractions in Tunisia?": "Explore natural wonders like Ichkeul National Park, home to diverse bird species, and the Ksar Ghilane Oasis with its palm groves and desert landscapes.",
    "Tell me about the annual Sahara Festival in Douz.": "The Sahara Festival in Douz celebrates desert culture with camel races, traditional music, and cultural events, providing a unique experience in the heart of the Sahara.",
    "What is the significance of the Antonine Baths in Carthage?": "The Antonine Baths in Carthage are ancient Roman baths known for their impressive size and architectural features, reflecting the grandeur of Roman civilization.",
    "How can I experience traditional Tunisian hospitality?": "Experience Tunisian hospitality by staying in traditional guesthouses, engaging with locals in markets, and participating in cultural events and festivals.",
    "Tell me about the El Jem Archaeological Museum.": "The El Jem Archaeological Museum showcases artifacts from the Roman era, providing insights into the history of El Jem and its ancient amphitheater.",
    "What are the best routes for exploring the Medina of Tunis?": "Explore the Medina of Tunis by wandering through its narrow streets, visiting landmarks like Zitouna Mosque, and discovering hidden gems in the bustling market areas.",
    "Can you recommend adventure tours in southern Tunisia?": "Embark on adventure tours in southern Tunisia, including camel treks in the Sahara, 4x4 desert excursions, and visits to the unique landscapes of Matmata and Chenini.",
    "Tell me about the significance of the Mausoleum of Habib Bourguiba.": "The Mausoleum of Habib Bourguiba in Monastir honors Tunisia's first president. It features a white marble structure and beautiful gardens, symbolizing national identity.",
    "What are the traditional forms of storytelling in Tunisia?": "Traditional storytelling in Tunisia often involves oral traditions, folk tales, and poetic expressions, with storytellers conveying cultural narratives and historical events.",
    "Can you recommend wellness retreats in Tunisia?": "Wellness retreats in Tunisia offer opportunities for relaxation and rejuvenation. Consider locations with spa facilities and seaside resorts for a holistic experience.",
    "Tell me about the traditional fishing techniques in coastal Tunisia.": "Coastal Tunisia has a rich tradition of fishing. Traditional techniques include seine net fishing, longlining, and the use of traditional fishing boats like the 'Nasse' and 'Safgha.'",
    "What are the archaeological sites in the city of Sbeitla?": "Sbeitla, known for its Roman ruins, has archaeological sites like the Roman Forum, Triumphal Arch, and the Temple of Minerva, showcasing the city's historical importance.",
    "Can you recommend cultural events in Tunis?": "Experience cultural events in Tunis, such as the Carthage Film Festival, International Festival of Carthage, and the Tunisian National Theatre Festival, celebrating arts and creativity.",
    "Tell me about the significance of the Medina of Sousse.": "The Medina of Sousse is a UNESCO World Heritage Site, featuring well-preserved medieval architecture, including the Ribat and the Grand Mosque, reflecting Islamic urban design.",
    "What are the traditional uses of olive oil in Tunisian cuisine?": "Olive oil is a staple in Tunisian cuisine, used for cooking, dressing salads, and flavoring various dishes. It is also a key ingredient in traditional sweets and pastries.",
    "Can you recommend eco-friendly initiatives in Tunisian tourism?": "Explore eco-friendly initiatives in Tunisian tourism, including accommodations with sustainability certifications, responsible tour operators, and community-based tourism projects.",
    "Tell me about the traditional wedding ceremonies in Tunisia.": "Traditional Tunisian wedding ceremonies involve customs like the 'Henna Night,' festive music, traditional attire, and the exchange of symbolic gifts between the bride and groom.",
    "What are the unique features of traditional Tunisian doors?": "Traditional Tunisian doors, known as 'Zellij,' are characterized by intricate geometric patterns and vibrant colors. They often symbolize protection, luck, and cultural identity.",
    "Can you recommend historical sites in Mahdia?": "Visit historical sites in Mahdia, including the Great Mosque, the Fatimid Port, and the Mahdia Archaeological Museum, reflecting the city's historical significance.",
    "Tell me about the significance of the Museum of Popular Arts and Traditions.": "The Museum of Popular Arts and Traditions in Tunis showcases traditional Tunisian crafts, costumes, and artifacts, providing insights into the country's cultural heritage.",
    "What are the traditional healing practices in Tunisia?": "Traditional healing practices in Tunisia may include herbal remedies, practices influenced by Berber traditions, and visits to local healers known as 'fkihs.'",
    "Can you recommend cultural workshops in Tunis?": "Participate in cultural workshops in Tunis, offering experiences like pottery making, calligraphy, and traditional music lessons for a hands-on immersion into Tunisian culture.",
    "Tell me about the significance of the Dar Othman Museum.": "The Dar Othman Museum in Tozeur highlights traditional Tunisian architecture and local crafts, providing a glimpse into the history and heritage of Tozeur.",
    "best time to visit Tunisia": "The best time to visit Tunisia is during the spring (March to May) and fall (September to October) when the weather is pleasant.",
    "top tourist attractions in Tunisia": "Some top tourist attractions in Tunisia include the ancient ruins of Carthage, the Medina of Tunis, and the Amphitheatre of El Jem.",
    "beaches in Tunisia": "Tunisia boasts beautiful beaches along its Mediterranean coast, such as Sidi Bou Said and Hammamet.",
    "traditional Tunisian cuisine": "Taste traditional Tunisian cuisine, including dishes like couscous, brik, and delicious pastries such as baklava.",
    "Tunisian festivals": "Experience Tunisian festivals like the Carthage Film Festival and the International Festival of the Sahara, showcasing local arts and culture.",
    "safety in Tunisia": "Tunisia is generally safe for tourists, but it's advisable to stay updated on travel advisories and follow local guidelines.",
    "Tunisian handicrafts": "Explore Tunisian handicrafts, including carpets, ceramics, and traditional fabrics, at local markets and souks.",
    "Tunisian souks": "Visit vibrant souks in cities like Tunis and Sousse, offering a variety of goods, spices, and handmade crafts.",
    "desert excursions in Tunisia": "Embark on desert excursions to experience the Sahara, including camel treks and visits to desert oases.",
    "Tunisian historical sites": "Discover Tunisia's rich history by exploring historical sites like Dougga, an ancient Roman city, and the Ksar Ouled Soltane granary.",
    "Tunisian art and museums": "Explore Tunisian art and museums, such as the Bardo National Museum, showcasing a vast collection of artifacts.",
    "Tunisian traditional music": "Enjoy Tunisian traditional music, including the sounds of the oud and darbuka, often heard in local cafes and festivals.",
    "eco-tourism in Tunisia": "Experience eco-tourism in Tunisia by visiting nature reserves like Ichkeul National Park, home to diverse bird species.",
    "Tunisian architecture": "Admire the unique architecture in Tunisia, from ancient Roman structures to Islamic designs seen in mosques and palaces.",
    "shopping in Tunisia": "Indulge in shopping in Tunisia, where you can buy handmade crafts, carpets, spices, and traditional clothing.",
    "nightlife in Tunisia": "Experience vibrant nightlife in cities like Tunis and Hammamet, with lively bars, clubs, and entertainment.",
    "Tunisian traditions and customs": "Learn about Tunisian traditions and customs, such as tea-drinking ceremonies and cultural celebrations.",
    "adventure activities in Tunisia": "Engage in adventure activities, including water sports along the coast, hiking in national parks, and off-road desert tours.",
    "Tunisian archaeological sites": "Explore Tunisian archaeological sites, such as the ancient city of Bulla Regia with its well-preserved Roman ruins.",
    "Tunisian spa and wellness": "Relax in Tunisian spas and wellness centers, offering traditional treatments like hammams and massages.",
    "Tunisian traditional clothing": "Discover the beauty of Tunisian traditional clothing, like the distinctive 'fouta' and 'chechia' worn by locals.",
    "Tunisian film locations": "Explore film locations in Tunisia, including the Star Wars sets in Matmata and the Ksar Ouled Soltane granary featured in various movies.",
    "Tunisian religious sites": "Visit Tunisian religious sites, such as the Zitouna Mosque in Tunis and the Great Mosque of Kairouan, significant in Islamic history.",
    "Tunisian language": "Learn about the Tunisian language, which is primarily Arabic, with influences from French and Berber languages.",
    "Tunisian coffee culture": "Experience Tunisian coffee culture by enjoying a cup of 'qahwa' (coffee) at local cafes and engaging in lively conversations.",
    "Tunisian wildlife": "Explore Tunisia's diverse wildlife by visiting Ichkeul National Park, known for its migratory birds and unique ecosystems.",
    "Tunisian traditional dance": "Witness Tunisian traditional dance forms, such as the 'Stambali' and 'Yowla,' reflecting the country's cultural diversity.",
    "Tunisian transport options": "Understand Tunisian transport options, including trains, buses, and taxis, for convenient travel within the country.",
    "Tunisian religious festivals": "Participate in Tunisian religious festivals, like Ramadan, marked by special events and cultural celebrations.",
    "Tunisian family traditions": "Learn about Tunisian family traditions, emphasizing close-knit family ties and traditional ceremonies.",
    "Tunisian nature reserves": "Discover Tunisian nature reserves, such as Boukornine National Park, offering scenic landscapes and hiking trails.",
    "Tunisian archeological museums": "Visit Tunisian archaeological museums, like the Carthage Archaeological Museum, showcasing artifacts from different eras.",
    "Tunisian rural experiences": "Engage in Tunisian rural experiences by visiting traditional villages and experiencing local agritourism activities.",
    "Tunisian water activities": "Enjoy water activities in Tunisia, including scuba diving, snorkeling, and boat trips along the picturesque coastline.",
    "Tunisian literature and poetry": "Explore Tunisian literature and poetry, with contributions from renowned writers and poets reflecting the country's cultural richness.",
    "Tunisian LGBTQ+ scene": "Learn about the LGBTQ+ scene in Tunisia, considering the country's cultural nuances and legal considerations.",
    "Tunisian artisanal crafts": "Support Tunisian artisanal crafts by purchasing handmade items like ceramics, leather goods, and traditional instruments.",
    "Tunisian agricultural practices": "Understand Tunisian agricultural practices, such as olive cultivation, which plays a significant role in the country's economy.",
    "Tunisian folklore and storytelling": "Immerse yourself in Tunisian folklore and storytelling, often expressed through music, dance, and oral traditions.",
    "Tunisian technological advancements": "Discover Tunisian technological advancements, contributing to innovation and development in various sectors.",
    "Tunisian coastal attractions": "Discover the stunning Tunisian coastal attractions, featuring pristine beaches like Sidi Bou Said and Hammamet.",
    "Tunisian gastronomy": "Indulge in Tunisian gastronomy, savoring dishes like couscous, brik, and tajine, known for their rich flavors and unique spices.",
    "Tunisian souks and markets": "Explore Tunisian souks and markets, such as the Medina of Tunis, for a vibrant shopping experience with traditional crafts and spices.",
    "Tunisian beach resorts": "Relax in Tunisian beach resorts, offering luxurious accommodations and world-class amenities along the Mediterranean coastline.",
    "Tunisian architectural wonders": "Admire Tunisian architectural wonders, like the historic Ribat of Monastir and the impressive Great Mosque of Kairouan.",
    "Tunisian film festivals": "Participate in Tunisian film festivals, celebrating local and international cinema, with events held in various cities.",
    "Tunisian health and wellness": "Experience Tunisian health and wellness traditions, including hammams and spa treatments, for relaxation and rejuvenation.",
    "Tunisian eco-friendly initiatives": "Learn about Tunisian eco-friendly initiatives, promoting sustainable tourism practices and environmental conservation.",
    "Tunisian adventure tourism": "Embark on Tunisian adventure tourism, engaging in activities like desert safaris, quad biking, and hot air balloon rides.",
    "Tunisian cultural festivals": "Attend Tunisian cultural festivals, celebrating diverse art forms, music, dance, and literature throughout the year.",
    "Tunisian astronomy experiences": "Engage in Tunisian astronomy experiences, stargazing in the Sahara Desert or visiting observatories for celestial exploration.",
    "Tunisian festivals of lights": "Celebrate Tunisian festivals of lights, such as the Yennayer, marking the Amazigh New Year with vibrant celebrations and traditional events.",
    "Tunisian sports events": "Cheer for Tunisian sports events, including football matches and international competitions, showcasing the country's athletic prowess.",
    "Tunisian underwater archaeology": "Explore Tunisian underwater archaeology sites, discovering ancient shipwrecks and submerged historical relics.",
    "Tunisian art galleries": "Visit Tunisian art galleries, displaying contemporary and traditional artworks by local and international artists.",
    "Tunisian sustainable tourism": "Support Tunisian sustainable tourism initiatives, contributing to the preservation of natural and cultural heritage.",
    "Tunisian fashion and design": "Explore Tunisian fashion and design scenes, with local designers creating unique clothing inspired by the country's heritage.",
    "Tunisian transportation infrastructure": "Understand Tunisian transportation infrastructure, including airports, railways, and highways, facilitating travel within the country.",

  };

  double calculateSimilarity(String a, String b) {
    List<String> aList = a.toLowerCase().split('');
    List<String> bList = b.toLowerCase().split('');
    Set<String> union = Set.from([...aList, ...bList]);
    int intersectionCount = aList.toSet().intersection(bList.toSet()).length;
    return intersectionCount / union.length;
  }

  void response(query) {
    setState(() {
      String answer = "I'm not sure how to respond to that.";
      double maxSimilarity = 0;
      String mostSimilarQuestion = "";

      for (String predefinedQuestion in responses.keys) {
        double similarity = calculateSimilarity(query, predefinedQuestion);

        if (similarity > maxSimilarity) {
          maxSimilarity = similarity;
          mostSimilarQuestion = predefinedQuestion;
        }
      }

      if (maxSimilarity >= 0.8) {
        answer = responses[mostSimilarQuestion]!;
      }

      messages.insert(
        0,
        {"data": 0, "message": "$answer"},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Chat bot",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(10,56,135,1), // #7579E7
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255), // #9AB3F5
              Color.fromARGB(255, 195, 195, 195), // #A3D8F4
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Today, ${DateTime.now().hour}:${DateTime.now().minute}",
                style: TextStyle(fontSize: 20, color: Colors.black), // Set text color to black
              ),
            ),
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) => chat(
                  messages[index]["message"].toString(),
                  messages[index]["data"],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 5.0,
              color: Color(0xFF7579E7), // #7579E7
            ),
            Container(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.camera_alt, color: Color.fromRGBO(10,56,135,1), size: 35), // #7579E7
                  onPressed: () {
                    // Add the functionality here if needed
                  },
                ),
                title: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(255, 255, 255, 255), // #A3D8F4
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messageInsert,
                    decoration: InputDecoration(
                      hintText: "How can I help you?",
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    onChanged: (value) {},
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.send,
                    size: 30.0,
                    color: Color.fromRGBO(10,56,135,1), // #7579E7
                  ),
                  onPressed: () {
                    if (messageInsert.text.isEmpty) {
                      print("empty message");
                    } else {
                      setState(() {
                        messages.insert(0, {"data": 1, "message": messageInsert.text});
                      });
                      response(messageInsert.text);
                      messageInsert.clear();
                    }
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.maps_ugc_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.accessibility),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0
              ? Container(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/6134/6134346.png"),
            ),
          )
              : Container(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: 200),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: data == 0 ? Color(0xFF9AB3F5) :Color.fromRGBO(10,56,135,1), // #9AB3F5 and #7579E7
              ),
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

