import 'package:flutter/material.dart';
import 'package:tryhello/Login_Page/login_signup.dart';
import 'dart:math' as math; // Added for 3D animation math
import 'ShortlistPage.dart';
import 'animated_backgroundpage.dart';
import 'help.dart';
import 'propertydescriptions/villa_detail_page.dart';
import 'settings_home.dart';
import 'package:tryhello/Search_Bar/SearchRentalsPage.dart';
import 'package:tryhello/YouPage/YouPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '𝓡𝓮𝓷𝓽 & 𝓡𝓮𝓼𝓽',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: const LogoAnimationPage(),
    );
  }
}

class LogoAnimationPage extends StatefulWidget {
  const LogoAnimationPage({super.key});

  @override
  _LogoAnimationPageState createState() => _LogoAnimationPageState();
}

class _LogoAnimationPageState extends State<LogoAnimationPage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => _opacity = 1.0);
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Image.asset(
            'assets/images/appicon2.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<int> favoriteProperties = [];

  final List<Map<String, String>> allProperties = [
    {
      'image': 'assets/images/villa.jpg'
      ,
      'price': '₹ 85,00,000',
      'type': 'Villa',
      'bedrooms': '4 Rooms(in Ground floor)',
      'location': 'Agra',
      'description': '''Experience luxury living in this stunning villa located in the heart of Agra. 
Priced at ₹ 85,00,000, this property offers exceptional value for a spacious family home. 
The villa features 4 generously sized rooms, all conveniently situated on the ground floor for easy access. 
Enjoy a modern architectural design with elegant interiors and high-quality finishes throughout. 
Large windows ensure natural light fills every room, creating a warm and inviting atmosphere. 
The villa boasts a beautifully landscaped garden, perfect for outdoor gatherings and relaxation. 
A contemporary kitchen and stylish bathrooms add to the comfort and convenience of this home. 
Located in a peaceful and secure neighborhood, you’ll have privacy and tranquility. 
Proximity to Agra’s top schools, shopping centers, and major attractions makes daily life convenient. 
This villa is an ideal choice for families seeking comfort, style, and a prestigious address in Agra. '''
    },
    {
      'image': 'assets/images/house.jpg',
      'price': '₹ 90,00,000',
      'type': 'house',
      'bedrooms': '5 Rooms(in Ground floor)',
      'location': 'Delhi',
      'description': '''Discover your dream home in the vibrant city of Delhi with this magnificent house. 
Priced at ₹ 90,00,000, this property offers exceptional value for families seeking comfort and style. 
The house features 5 spacious rooms, all conveniently located on the ground floor for easy accessibility. 
Modern design elements blend seamlessly with classic architecture, creating a welcoming ambiance throughout. 
Large windows and open spaces allow natural light to flood every corner, enhancing the sense of warmth and space. 
A beautifully maintained garden provides the perfect setting for relaxation and family gatherings. 
The kitchen is equipped with contemporary appliances and ample storage, ideal for home chefs. 
Each bedroom is thoughtfully designed to offer privacy and tranquility after a busy day. 
Situated in a prime Delhi neighborhood, you’ll enjoy proximity to top schools, shopping centers, and transport links. 
This house is a rare opportunity for those who desire luxury, convenience, and a prestigious address in Delhi.''',

    },
    {
      'image': 'assets/images/houses2.jpg',
      'price': '₹ 36,00,000',
      'type': 'House',
      'bedrooms': 'For Sale',
      'location': 'Mumbai',
      'description': '''Presenting an excellent opportunity to own a beautiful house in the bustling city of Mumbai.
Priced attractively at ₹ 36,00,000, this property is perfect for first-time buyers or investors.
The house is currently available for sale and offers a flexible layout to suit your needs.
Enjoy a bright and airy living space, thoughtfully designed for comfort and convenience.
Large windows bring in abundant natural light, creating a cheerful and welcoming atmosphere.
The property features modern finishes and quality materials throughout the living areas.
A compact yet functional kitchen makes daily cooking a delightful experience.
Located in a sought-after Mumbai neighborhood, you’ll have easy access to markets, schools, and transport.
The house is ideal for families looking for a peaceful retreat amid the city’s vibrant lifestyle.
Don’t miss this chance to own a home in Mumbai—schedule a visit and make it yours today!''',

    },
    {
      'image': 'assets/images/3 BHK room.jpg',
      'price': '₹ 23,000/Month',
      'type': 'Apartment rooms',
      'bedrooms': '2 BHK',
      'location': 'Bangalore',
      'description': '''Modern apartment located in the heart of Bangalore.
      Priced at ₹ 23,000 per month, offering excellent value.
      Spacious 2 BHK layout, ideal for small families or professionals.
      Bright living room with large windows and natural light.
      Well-equipped kitchen with ample storage space.
      Comfortable bedrooms designed for relaxation.
      Contemporary bathrooms with quality fittings.
      Secure building with 24/7 security and amenities.
      Close to tech parks, shopping centers, and schools.
      A perfect choice for those seeking comfort and convenience in Bangalore.'''
    },
    {
      'image': 'assets/images/room in delhi.jpg',
      'price': '₹ 32,000/month',
      'type': 'Apartment rooms',
      'bedrooms': '2 BHk',
      'location': 'Delhi',
      'description': '''
Modern 2 BHK apartment available for rent in a prime Delhi location.
Priced at ₹ 32,000 per month, offering great value for city living.
Spacious layout with two comfortable bedrooms, ideal for families or professionals.
Bright living area with large windows and ample natural light.
Well-designed kitchen equipped for convenient daily cooking.
Contemporary bathrooms with quality fittings and fixtures.
Secure building with 24/7 security and essential amenities.
Located close to metro stations, markets, and educational institutions.
Enjoy easy access to shopping, dining, and entertainment options.
A perfect blend of comfort, convenience, and urban lifestyle in Delhi.
''',

    },
    {
      'image': 'assets/images/house in agra.jpg',
      'price': '₹ 25,00,000',
      'type': 'House',
      'bedrooms': 'For Sale',
      'location': 'Agra',
      'description': '''
Charming house for sale in a peaceful neighborhood of Agra.
Attractive price of ₹ 25,00,000, making it a great investment.
Spacious layout suitable for families of all sizes.
Bright and airy living spaces with plenty of natural light.
Functional kitchen designed for everyday convenience.
Well-maintained interiors with quality finishes throughout.
Ideal for first-time buyers or those looking to upgrade.
Close to schools, markets, and essential amenities.
Secure locality offering a safe environment for residents.
An excellent opportunity to own a home in the historic city of Agra.
''',

    },
    {
      'image': 'assets/images/rooms in agra.jpg',
      'price': '₹ 19,000/month',
      'type': 'Apartment rooms',
      'bedrooms': '2 BHK',
      'location': 'Agra',
      'description': '''Affordable 2 BHK apartment available for rent in Agra.
    Priced at ₹ 19,000 per month, ideal for families or professionals.
    Spacious bedrooms designed for comfort and relaxation.
    Bright living area with ample natural light and ventilation.
    Modern kitchen equipped for convenient daily cooking.
    Well-maintained bathrooms with quality fittings.
    Secure building with 24/7 security and essential amenities.
    Located close to schools, markets, and public transport.
    Peaceful neighborhood offering a pleasant living environment.
    A perfect choice for those seeking comfort and convenience in Agra.'''
    },
    {
      'image': 'assets/images/rooms in bangalore.jpg',
      'price': '₹ 25,000/month',
      'type': 'Apartment rooms',
      'bedrooms': '3 BHK',
      'location': 'Bangalore',
      'description': '''
Spacious 3 BHK apartment available for rent in Bangalore.
Priced at ₹ 25,000 per month, offering excellent value in a prime location.
Ideal for families or professionals seeking comfort and convenience.
Bright living spaces with large windows and plenty of natural light.
Modern kitchen equipped for everyday cooking and storage needs.
Three well-appointed bedrooms designed for relaxation and privacy.
Contemporary bathrooms with quality fixtures and fittings.
Secure building with 24/7 security and essential amenities.
Close to tech parks, schools, shopping centers, and public transport.
A perfect blend of affordability, comfort, and urban lifestyle in Bangalore.
''',
    },
    {
      'image': 'assets/images/villas in agra.jpg',
      'price': '₹ 50,00,000',
      'type': 'Villa',
      'bedrooms': '4 rooms(GroundFloor)',
      'location': 'Agra',
      'description': '''
Elegant villa for sale in Agra, offering a perfect blend of luxury and comfort.
Priced at ₹ 50,00,000, this villa is an excellent investment in a prime location.
Spacious layout with 4 well-designed rooms, all situated on the ground floor.
Modern architecture with high-quality finishes and stylish interiors.
Large windows provide abundant natural light and a refreshing atmosphere.
Beautifully landscaped garden, ideal for relaxation and outdoor gatherings.
Contemporary kitchen equipped with premium fittings for convenient cooking.
Secure and peaceful neighborhood, perfect for families seeking tranquility.
Close proximity to schools, shopping centers, and Agra’s renowned attractions.
A rare opportunity to own a prestigious villa in the historic city of Agra.
''',

    },
    {
      'image': 'assets/images/villas in bangalore.jpg',
      'price': '₹ 1,00,00,000',
      'type': 'Villa',
      'bedrooms': '6 rooms(GroundFloor)',
      'location': 'Bangalore',
      'description': '''
Luxurious villa for sale in Bangalore, designed for spacious and elegant living.
Priced at ₹ 1,00,00,000, offering excellent value in a prime city location.
Expansive layout with 6 well-appointed rooms, all situated on the ground floor.
Modern architecture with premium finishes and stylish interiors throughout.
Large windows and open spaces ensure abundant natural light and ventilation.
Beautiful landscaped garden, ideal for family gatherings and outdoor relaxation.
Contemporary kitchen equipped with high-end fittings for a superior cooking experience.
Secure neighborhood with 24/7 security and essential amenities for peace of mind.
Close proximity to renowned schools, shopping centers, and major city attractions.
An exceptional opportunity to own a prestigious villa in the vibrant city of Bangalore.
''',

    },
    {
      'image': 'assets/images/villas in delhi.jpg',
      'price': '₹ 90,00,000',
      'type': 'Villa',
      'bedrooms': '5 rooms(GroundFloor)',
      'location': 'Delhi',
      'description': '''
Stunning villa for sale in Delhi, offering luxury and comfort in every corner.
Priced at ₹ 90,00,000, this property is a remarkable investment in a prime area.
Spacious layout with 5 beautifully designed rooms, all on the ground floor for convenience.
Modern architecture featuring elegant interiors and premium finishes throughout.
Large windows provide ample natural light and a refreshing ambiance.
Beautifully landscaped garden, perfect for outdoor entertaining and relaxation.
Contemporary kitchen equipped with top-quality fittings and appliances.
Located in a secure and peaceful neighborhood, ideal for families.
Close to leading schools, shopping centers, and major city attractions.
An exclusive opportunity to own a prestigious villa in the heart of Delhi.
''',

    },
    {
      'image': 'assets/images/villas in mumbai.jpg',
      'price': '₹ 1,00,00,000',
      'type': 'Villa',
      'bedrooms': '7 rooms(GroundFloor)',
      'location': 'Mumbai',
      'description': '''
Magnificent villa for sale in Mumbai, offering unmatched luxury and space.
Priced at ₹ 1,00,00,000, this property is a premium investment in a top location.
Expansive layout with 7 spacious rooms, all conveniently on the ground floor.
Modern design with elegant interiors and high-end finishes throughout.
Large windows ensure every room is filled with natural light and fresh air.
Beautifully landscaped garden, perfect for family gatherings and relaxation.
Gourmet kitchen equipped with premium appliances for a superior cooking experience.
Located in a secure and tranquil neighborhood, ideal for upscale living.
Close to renowned schools, shopping centers, and major city attractions.
A rare opportunity to own an exclusive villa in the heart of Mumbai.
''',

    },
    {
      'image': 'assets/images/agra hotel room.jpg',
      'price': '₹ 9,000/day',
      'type': 'Hotel rooms',
      'location': 'Agra',
      'description': '''
Premium hotel room available in Agra, designed for comfort and relaxation.
Priced at ₹ 9,000 per day, offering a luxurious stay near the city’s top attractions.
Spacious and well-furnished room with modern amenities for a memorable experience.
Elegant interiors and high-quality bedding ensure restful nights.
Large windows provide natural light and beautiful city views.
En-suite bathroom equipped with premium fittings and toiletries.
Enjoy 24/7 room service, complimentary Wi-Fi, and daily housekeeping.
Located close to the Taj Mahal, Agra Fort, and popular shopping areas.
Secure property with professional staff and excellent hospitality.
Perfect choice for travelers seeking convenience, comfort, and a touch of luxury in Agra.
''',

    },
    {'image': 'assets/images/agra hotel.jpg',
      'price': '₹ 10,000/day',
      'type': 'Hotel rooms',
      'location': 'Agra',
      'description': '''
Experience ultimate luxury in this exclusive hotel room in Agra.
Priced at ₹ 10,000 per day, ideal for guests seeking a premium stay.
Spacious, elegantly designed room with high-end furnishings and décor.
Panoramic city or monument views from large, soundproof windows.
Luxurious bedding and a plush, king-size bed for restful nights.
Modern en-suite bathroom with premium toiletries and a rain shower.
Enjoy complimentary high-speed Wi-Fi, smart TV, and 24/7 room service.
Access to hotel amenities including pool, spa, gym, and fine dining.
Located near the Taj Mahal, Agra Fort, and major attractions for convenience.
Perfect for travelers who desire comfort, privacy, and world-class hospitality in Agra.
''',

    },
    {'image': 'assets/images/hotel room in delhi.jpg',
      'price': '₹ 9,800/day',
      'type': 'Hotel rooms',
      'location': 'Delhi',
      'description': '''
Luxurious hotel room available in the heart of Delhi for ₹ 9,800 per day.
Spacious and elegantly furnished to provide maximum comfort and relaxation.
Modern amenities including high-speed Wi-Fi, smart TV, and air conditioning.
Large windows offer stunning city views and plenty of natural light.
Premium bedding and plush mattresses ensure a restful night's sleep.
En-suite bathroom with quality toiletries, rain shower, and modern fittings.
24/7 room service, daily housekeeping, and attentive hotel staff for your convenience.
Access to exclusive hotel facilities such as swimming pool, spa, and fitness center.
Located close to major attractions, business hubs, and shopping districts.
Ideal for business travelers and tourists seeking a premium stay experience in Delhi.
''',

    },
    {'image': 'assets/images/hotel room delhi.jpg',
      'price': '₹ 10,200/day',
      'type': 'Hotel rooms',
      'location': 'Delhi',
      'description': '''
Experience unparalleled comfort in this luxury hotel room in Delhi, priced at ₹ 10,200 per day.
Spacious, elegantly furnished room with contemporary décor and premium finishes.
Enjoy stunning city views through large windows that fill the space with natural light.
Relax in a plush king-size bed with high-quality linens for a restful night.
Modern en-suite bathroom equipped with luxury toiletries and a rain shower.
Complimentary high-speed Wi-Fi, smart TV, minibar, and 24/7 room service included.
Access to exclusive hotel amenities such as swimming pool, spa, and fitness center.
Daily housekeeping and attentive staff ensure a seamless and pleasant stay.
Located close to major attractions, shopping districts, and business centers in Delhi.
Ideal for business and leisure travelers seeking a world-class hospitality experience in the capital.
''',

    },
    {'image': 'assets/images/bangalore hotel.jpg',
      'price': '₹ 10,800/day',
      'type': 'Hotel rooms',
      'location': 'Bangalore',
      'description': '''
Indulge in luxury with this premium hotel room in Bangalore, priced at ₹ 10,800 per day.
Spacious and tastefully designed room with elegant furnishings and modern décor.
Large windows provide stunning city views and abundant natural light.
Enjoy a plush king-size bed with high-quality linens for ultimate comfort.
En-suite bathroom equipped with luxury toiletries, rain shower, and soaking tub.
Complimentary high-speed Wi-Fi, smart TV, minibar, and 24/7 room service.
Access to exclusive hotel amenities including pool, spa, fitness center, and fine dining.
Daily housekeeping and attentive staff ensure a seamless and relaxing stay.
Located in the heart of Bangalore, close to business hubs and major attractions.
Perfect for discerning travelers seeking a world-class hospitality experience in the city.
''',

    },
    {'image': 'assets/images/bangalore hotel room.jpg',
      'price': '₹ 11,500/day',
      'type': 'Hotel rooms',
      'location': 'Bangalore',
      'description': '''
Experience world-class luxury in this premium hotel room in Bangalore, priced at ₹ 11,500 per day.
Spacious, elegantly furnished room featuring contemporary décor and high-end finishes.
Enjoy panoramic city views through large windows that fill the space with natural light.
Relax in a plush king-size bed with premium linens for ultimate comfort.
Modern en-suite bathroom equipped with luxury toiletries, rain shower, and soaking tub.
Complimentary high-speed Wi-Fi, smart TV, minibar, and 24/7 room service for your convenience.
Access to exclusive hotel amenities including swimming pool, spa, fitness center, and fine dining restaurants.
Daily housekeeping and attentive staff ensure a seamless and memorable stay.
Located in the heart of Bangalore, close to business districts, shopping, and major attractions.
Ideal for both business and leisure travelers seeking a sophisticated hospitality experience in Bangalore.
''',

    },
    {'image': 'assets/images/mumbai hotel.jpg',
      'price': '₹ 11,000/day',
      'type': 'Hotel rooms',
      'location': 'Mumbai',
      'description': '''
Enjoy a luxurious stay in Mumbai with this premium hotel room at ₹ 11,000 per day.
Spacious, elegantly furnished room designed for maximum comfort and relaxation.
Large windows offer beautiful city or sea views and plenty of natural light.
Plush king-size bed with high-quality linens ensures restful sleep.
Modern en-suite bathroom with luxury toiletries, rain shower, and soaking tub.
Complimentary high-speed Wi-Fi, smart TV, minibar, and 24/7 room service.
Access to exclusive hotel amenities including swimming pool, spa, and fitness center.
Daily housekeeping and attentive staff provide a seamless hospitality experience.
Located in a prime area, close to business hubs, shopping, and major attractions.
Ideal for business and leisure travelers seeking world-class accommodation in Mumbai.
''',

    },
    {'image': 'assets/images/mumbai hotel1.jpg',
      'price': '₹ 12,000/day',
      'type': 'Hotel rooms',
      'location': 'Mumbai',
      'description': '''
Experience refined luxury in this premium hotel room in Mumbai, priced at ₹ 12,000 per day.
Spacious and elegantly appointed room with contemporary décor and high-end finishes.
Large windows offer stunning city or sea views and plenty of natural light.
Relax in a plush king-size bed with premium linens for ultimate comfort.
Modern en-suite bathroom equipped with luxury toiletries, rain shower, and soaking tub.
Enjoy complimentary high-speed Wi-Fi, smart TV, minibar, and 24/7 room service.
Access to exclusive hotel amenities including swimming pool, spa, fitness center, and fine dining.
Daily housekeeping and attentive staff ensure a seamless and memorable stay.
Located in a prime area, close to business districts, shopping, and major Mumbai attractions.
Ideal for both business and leisure travelers seeking world-class accommodation in Mumbai.
''',

    },
    {'image': 'assets/images/delhi villas.jpg',
      'price': '₹ 93,00,000',
      'type': 'Villa',
      'bedrooms': '5 Rooms(in Ground floor)',
      'location': 'Delhi',
      'description': '''
Elegant villa for sale in Delhi, offering a perfect blend of luxury and comfort.
Priced at ₹ 93,00,000, this property is an excellent investment in a sought-after location.
Spacious layout with 5 well-designed rooms, all conveniently situated on the ground floor.
Modern architecture featuring stylish interiors and premium finishes throughout.
Large windows fill the home with natural light and create a bright, welcoming atmosphere.
Beautifully landscaped garden, ideal for outdoor gatherings and relaxation.
Contemporary kitchen equipped with high-quality fittings and ample storage.
Located in a secure and peaceful neighborhood, perfect for families.
Close to top schools, shopping centers, and major city attractions.
A rare opportunity to own a prestigious villa in the heart of Delhi.
''',

    },
    {'image': 'assets/images/villa bangalore.jpg',
      'price': '₹ 95,00,000',
      'type': 'Villa',
      'bedrooms': '6 Rooms(in Ground floor)',
      'location': 'Bangalore',
      'description': '''
Spacious villa for sale in Bangalore, featuring 6 rooms all on the ground floor.
Priced attractively at ₹ 95,00,000, offering excellent value for a large family home.
Modern layout designed for comfort, convenience, and easy accessibility.
Bright interiors with large windows provide abundant natural light.
Contemporary kitchen equipped with quality fittings and ample storage.
Well-maintained bathrooms with modern fixtures.
Private garden space, ideal for outdoor relaxation and gatherings.
Located in a peaceful neighborhood with good connectivity to city amenities.
Secure environment, suitable for families seeking privacy and tranquility.
A rare opportunity to own a sizable villa in Bangalore at an affordable price.
''',

    },
    {'image': 'assets/images/mumabi villa.jpg',
      'price': '₹ 90,00,000',
      'type': 'Villa',
      'bedrooms': '6 Rooms(in Ground floor)',
      'location': 'Mumbai',
      'description': '''
Attractive villa for sale in Mumbai, offering spacious living at an exceptional price.
Priced at ₹ 90,00,000, this property is a rare opportunity in the Mumbai real estate market.
Expansive layout with 6 well-designed rooms, all conveniently located on the ground floor.
Modern architecture featuring stylish interiors and quality finishes throughout.
Large windows fill the home with natural light, creating a bright and inviting atmosphere.
Private garden space, perfect for outdoor gatherings and family relaxation.
Contemporary kitchen equipped with premium fittings and ample storage.
Situated in a secure and peaceful neighborhood, ideal for families.
Close to schools, shopping centers, and major city attractions for added convenience.
An excellent choice for those seeking a spacious villa in Mumbai at an affordable price.
''',

    },
    {'image': 'assets/images/delhi apartment1.png',
      'price': '₹ 20,000/Month',
      'type': 'Apartment rooms',
      'bedrooms': '2 BHK',
      'location': 'Delhi',
      'description': '''
Affordable 2 BHK apartment available for rent in Delhi at ₹ 20,000 per month.
Spacious layout designed for comfortable family living.
Bright living area with ample natural light and ventilation.
Two well-sized bedrooms ideal for rest and privacy.
Modern kitchen equipped for convenient daily cooking.
Well-maintained bathrooms with quality fittings.
Located in a safe and secure neighborhood.
Close to schools, markets, and public transport for daily convenience.
Ideal for professionals, small families, or students seeking value.
A great opportunity to rent a comfortable home in Delhi at a competitive price.
''',

    },
    {'image': 'assets/images/mumbai apartment.jpg',
      'price': '₹ 23,000/Month',
      'type': 'Apartment rooms',
      'bedrooms': '3 BHK',
      'location': 'Mumbai',
      'description': '''
Spacious 3 BHK apartment available for rent in Mumbai at just ₹ 23,000 per month.
Exceptional value for a family-sized home in the city.
Well-designed layout with three comfortable bedrooms and ample living space.
Bright interiors with large windows for natural light and ventilation.
Modern kitchen equipped for convenient daily cooking.
Well-maintained bathrooms with quality fittings.
Located in a safe and accessible neighborhood.
Close to schools, markets, and public transport for daily convenience.
Ideal for families or professionals seeking an affordable home in Mumbai.
A rare opportunity to rent a 3 BHK apartment in Mumbai at this price.
''',

    },
    {'image': 'assets/images/mumbai apartment2.jpg',
      'price': '₹ 20,000/Month',
      'type': 'Apartment rooms',
      'bedrooms': '2 BHK',
      'location': 'Mumbai',
      'description': '''
Affordable 2 BHK apartment available for rent in Mumbai at just ₹ 20,000 per month.
Spacious layout with two comfortable bedrooms and a bright living area.
Modern kitchen equipped for convenient daily cooking.
Well-maintained bathrooms with quality fittings.
Large windows provide ample natural light and ventilation.
Located in a safe and accessible neighborhood.
Close to schools, markets, and public transport for daily convenience.
Ideal for small families, professionals, or students seeking value in Mumbai.
A rare opportunity to rent a 2 BHK apartment at this price in the city.
Excellent choice for those looking for comfort and affordability in Mumbai.
''',

    },
    {'image': 'assets/images/agra apartment1.jpg',
      'price': '₹ 25,000/Month',
      'type': 'Apartment rooms',
      'bedrooms': '3 BHK',
      'location': 'Agra',
      'description': '''
Premium 3 BHK apartment available for rent in Agra at ₹ 25,000 per month.
Spacious and well-designed layout, ideal for comfortable family living.
Bright living area with large windows for natural light and ventilation.
Three generously sized bedrooms ensure privacy and relaxation.
Modern kitchen equipped with quality fittings for convenient cooking.
Well-maintained bathrooms with contemporary fixtures.
Located in a safe and sought-after neighborhood of Agra.
Close to schools, markets, and public transport for daily convenience.
Perfect for families or professionals seeking a quality home in Agra.
A great opportunity to rent a premium 3 BHK apartment at a competitive price.
''',

    },
    {'image': 'assets/images/delhi house2.jpg',
      'price': '₹ 95,00,000',
      'type': 'house',
      'bedrooms': '4 Rooms(in Ground floor)',
      'location': 'Delhi',
      'description': '''
Well-maintained 4-room house available for sale in Delhi at ₹ 95,00,000.
Spacious ground floor layout designed for comfortable family living.
Bright interiors with large windows for natural light and ventilation.
Modern kitchen equipped with quality fittings for daily convenience.
Well-appointed bathrooms with contemporary fixtures.
Private outdoor space or garden area for relaxation.
Located in a safe and accessible neighborhood.
Close to schools, markets, and public transport for everyday ease.
Ideal for families or investors seeking value in Delhi’s property market.
A rare opportunity to own a ground floor house in Delhi at this price.
''',

    },
    {'image': 'assets/images/agra house2.jpg',
      'price': '₹ 80,00,000',
      'type': 'house',
      'bedrooms': '5 Rooms(in Ground floor)',
      'location': 'Agra',
      'description': '''
Spacious 5-room independent house available for sale in Agra at ₹ 80,00,000.
Ground floor layout designed for comfortable and accessible family living.
Bright interiors with ample windows for natural light and ventilation.
Modern kitchen equipped with quality fittings for daily convenience.
Well-maintained bathrooms with contemporary fixtures.
Private garden or outdoor space ideal for relaxation and gatherings.
Located in a safe and sought-after neighborhood of Agra.
Close to schools, markets, and public transport for easy daily living.
Perfect for large families or buyers seeking extra space and comfort.
A rare opportunity to own a premium house in Agra at this price point.
''',

    },
    {'image': 'assets/images/mumbai house2.jpeg',
      'price': '₹ 99,00,000',
      'type': 'house',
      'bedrooms': '6 Rooms(in Ground floor)',
      'location': 'Mumbai',
      'description': '''
Exceptionally spacious 6-room house available for sale in Mumbai at just ₹ 99,00,000.
Ground floor layout designed for comfortable and accessible family living.
Bright interiors with ample windows for natural light and ventilation.
Modern kitchen equipped with quality fittings for daily convenience.
Well-maintained bathrooms with contemporary fixtures.
Private outdoor or garden space ideal for relaxation and gatherings.
Located in a secure and accessible neighborhood.
Close to schools, markets, and public transport for daily convenience.
Ideal for large families or buyers seeking rare value in Mumbai’s property market.
A truly unique opportunity to own a 6-room house in Mumbai at this price point.
''',

    },
    {'image': 'assets/images/bangalore house1.jpg',
      'price': '₹ 91,00,000',
      'type': 'house',
      'bedrooms': '5 Rooms(in Ground floor)',
      'location': 'Bangalore',
      'description': '''
Spacious 5-room house available for sale in Bangalore at ₹ 91,00,000.
Ground floor layout designed for comfortable and accessible family living.
Bright interiors with ample windows for natural light and ventilation.
Modern kitchen equipped with quality fittings for daily convenience.
Well-maintained bathrooms with contemporary fixtures.
Private outdoor or garden space ideal for relaxation and gatherings.
Located in a secure and developing neighborhood.
Close to schools, markets, and public transport for daily convenience.
Ideal for large families or buyers seeking value in Bangalore’s property market.
A rare opportunity to own a 5-room house in Bangalore at this price point.
''',

    },
    {'image': 'assets/images/bangalore house2.jpg',
      'price': '₹ 98,00,000',
      'type': 'house',
      'bedrooms': '6 Rooms(in Ground floor)',
      'location': 'Bangalore',
      'description': '''
Spacious 6-room house available for sale in Bangalore at ₹ 98,00,000.
Ground floor layout designed for comfortable and accessible family living.
Bright interiors with ample windows for natural light and ventilation.
Modern kitchen equipped with quality fittings for daily convenience.
Well-maintained bathrooms with contemporary fixtures.
Private outdoor or garden space ideal for relaxation and gatherings.
Located in a secure and developing neighborhood.
Close to schools, markets, and public transport for daily convenience.
Ideal for large families or buyers seeking rare value in Bangalore’s property market.
A unique opportunity to own a 6-room house in Bangalore at this price point.
''',

    },
  ];

  List<Map<String, String>> displayedProperties = [];
  String? selectedLocation;
  String? selectedType;
  final double _minPrice = 9000;
  final double _maxPrice = 10000000;
  RangeValues _currentRangeValues = const RangeValues(9000, 10000000);

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    displayedProperties = List.from(allProperties);
  }

  List<Map<String, String>> getFavoriteProperties() {
    return favoriteProperties.map((index) => allProperties[index]).toList();
  }

  void _toggleFavorite(int originalIndex) {
    setState(() {
      if (favoriteProperties.contains(originalIndex)) {
        favoriteProperties.remove(originalIndex);
      } else {
        favoriteProperties.add(originalIndex);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void applyFilters() {
    setState(() {
      displayedProperties = allProperties.where((property) {
        int numericPrice = int.tryParse(
            property['price']!.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
        final inRange = numericPrice >= _currentRangeValues.start &&
            numericPrice <= _currentRangeValues.end;
        final matchesLocation = selectedLocation == null ||
            property['location'] == selectedLocation;
        final matchesType = selectedType == null ||
            property['type']?.toLowerCase() == selectedType!.toLowerCase();
        return inRange && matchesLocation && matchesType;
      }).toList();
    });
  }

  void clearFilters() {
    setState(() {
      selectedLocation = null;
      selectedType = null;
      _currentRangeValues = RangeValues(_minPrice, _maxPrice);
      displayedProperties = List.from(allProperties);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      buildHomeContent(),
      ShortlistPage(favoriteProperties: getFavoriteProperties()),
      const Center(
          child: Text("Bookings Page", style: TextStyle(fontSize: 24))),
      const YouPage(),
    ];

    return Scaffold(
      appBar: _selectedIndex == 0 ? AppBar(
        title: const Text('𝓡𝓮𝓷𝓽 & 𝓡𝓮𝓼𝓽',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SearchRentalsPage(allProperties: allProperties),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // handle notification
            },
          ),
        ],
      ) : null,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hillvilla.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 27),
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (_) => const LoginSignup()));
                    },
                    child: const Text(
                      'Login/SignUp',
                      style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(leading: const Icon(Icons.category_outlined),
                title: const Text('Category')),
            ListTile(leading: const Icon(Icons.local_activity),
                title: const Text('Activity')),
            ListTile(leading: const Icon(Icons.wallet_outlined),
                title: const Text('Wallet')),
            ListTile(leading: const Icon(Icons.language),
                title: const Text('Change language')),
            ListTile(leading: const Icon(Icons.help_outline),
                title: const Text('Help'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => HelpCenterPage()));
              },


            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Are you a property owner ?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            const ListTile(leading: Icon(Icons.apartment_sharp),
                title: Text('List your property')),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SettingsHome()));
              },
            ),
            const ListTile(leading: Icon(Icons.logout_outlined),
                title: const Text('Logout')),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Shortlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'You',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  // This method builds the main home screen content
  Widget buildHomeContent() {
    return Stack(
        children: [

        // Animated background (full screen)
        AnimatedBackgroundpage(showPropertyCards: false),
    CustomScrollView(
      physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Filter UI
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Price Range: ₹${_currentRangeValues.start.toInt()} - ₹${_currentRangeValues.end.toInt()}'),
                                RangeSlider(
                                  values: _currentRangeValues,
                                  min: _minPrice,
                                  max: _maxPrice,
                                  divisions: 100,
                                  labels: RangeLabels(
                                    '₹${_currentRangeValues.start.toInt()}',
                                    '₹${_currentRangeValues.end.toInt()}',
                                  ),
                                  onChanged: (values) {
                                    setState(() => _currentRangeValues = values);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: "Location",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              value: selectedLocation,
                              items: ['Agra', 'Delhi', 'Mumbai', 'Bangalore']
                                  .map((loc) => DropdownMenuItem(
                                value: loc,
                                child: Text(loc),
                              ))
                                  .toList(),
                              onChanged: (value) => setState(() => selectedLocation = value),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Type",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        value: selectedType,
                        items: ['Villa', 'House', 'Apartment rooms', 'Hotel rooms']
                            .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                            .toList(),
                        onChanged: (value) => setState(() => selectedType = value),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                              onPressed: applyFilters,
                              child: const Text('Apply Filters', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                              onPressed: clearFilters,
                              child: const Text('Clear Filters', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    "Best offer for you",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/offer2.jpg', height: 180, width: double.infinity, fit: BoxFit.cover),
                        const Positioned(
                          top: 20,
                          right: 20,
                          child: Text('First book 30% off', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                        const Positioned(
                          bottom: 20,
                          right: 20,
                          child: Text('Book Now', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/offer1.jpg', height: 180, width: double.infinity, fit: BoxFit.cover),
                        const Positioned(
                          bottom: 20,
                          left: 20,
                          child: Text('Book Now', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        const Positioned(
                          top: 20,
                          left: 20,
                          child: Text('First book 50% off', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Sliver 2: The animated list of properties
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final property = displayedProperties[index];
                final originalIndex = allProperties.indexOf(property);

                // **ADDED**: The new 3D "fly-in" animation wrapper
                return FlyInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VillaDetailPage(property: property),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Hero(
                                  tag: property['image']!,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                    child: Image.asset(
                                      property['image']!,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () => _toggleFavorite(originalIndex),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black.withOpacity(0.4),
                                      child: Icon(
                                        favoriteProperties.contains(originalIndex)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: favoriteProperties.contains(originalIndex)
                                            ? Colors.red
                                            : Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price: ${property['price']}',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Type: ${property['type']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                if ((property['bedrooms'] ?? '').isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      property['bedrooms']!,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                const SizedBox(height: 4),
                                const Text(
                                  'More Details...',
                                  style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: displayedProperties.length,
            ),
          ),
        ],
      ),
    ],
    );
  }
}

// =========================================================================
// NEW WIDGET FOR THE 3D FLY-IN ANIMATION
// =========================================================================
class FlyInAnimation extends StatefulWidget {
  final Widget child;

  const FlyInAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _FlyInAnimationState createState() => _FlyInAnimationState();
}

class _FlyInAnimationState extends State<FlyInAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _rotateAnimation = Tween<double>(begin: math.pi / 4, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: widget.child,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Apply perspective
            ..rotateX(_rotateAnimation.value), // Apply rotation
          alignment: Alignment.center,
          child: Transform.scale(
            scale: _scaleAnimation.value, // Apply scaling
            child: child,
          ),
        );
      },
    );
  }
}