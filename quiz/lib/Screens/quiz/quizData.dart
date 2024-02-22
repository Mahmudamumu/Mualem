import 'QuizQuestion.dart';

final List<List<QuizQuestion>> quizDataQue = [
  //set1  //alphabet
  [
    //1
    QuizQuestion(
      questionText: "Alif",
      options: [
        "assets/alphabet/alpha1.jpg",
        "assets/alphabet/alpha4.jpg",
        "assets/alphabet/alpha3.jpg",
        "assets/alphabet/alpha7.jpg"
      ],
      correctAnswerIndex: 0,
      soundPath: "assets/alphabet/sound1.mp3",
    ),
    //2
    QuizQuestion(
      questionText: "Haa",
      options: [
        "assets/alphabet/alpha11.jpg",
        "assets/alphabet/alpha1.jpg",
        "assets/alphabet/alpha6.jpg",
        "assets/alphabet/alpha14.jpg"
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/alphabet/sound6.mp3",
    ),
    //3
    QuizQuestion(
      questionText: "Dhall",
      options: [
        "assets/alphabet/alpha4.jpg",
        "assets/alphabet/alpha8.jpg",
        "assets/alphabet/alpha3.jpg",
        "assets/alphabet/alpha9.jpg"
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/alphabet/sound9.mp3",
    ),
    //4
    QuizQuestion(
      questionText: "Shiin",
      options: [
        "assets/alphabet/alpha11.jpg",
        "assets/alphabet/alpha19.jpg",
        "assets/alphabet/alpha13.jpg",
        "assets/alphabet/alpha14.jpg"
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/alphabet/sound19.mp3",
    ),
    //5
    QuizQuestion(
      questionText: "Qaaf",
      options: [
        "assets/alphabet/alpha7.jpg",
        "assets/alphabet/alpha3.jpg",
        "assets/alphabet/alpha20.jpg",
        "assets/alphabet/alpha21.jpg"
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/alphabet/sound21.mp3",
    ),
    // add more questions here
  ],

//set 2 // number
  [
    QuizQuestion(
      questionText: "Thalatha",
      options: [
        "assets/numbers/Number2.jpg",
        "assets/numbers/Number7.jpg",
        "assets/numbers/Number3.jpg",
        "assets/numbers/Number1.jpg",
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/numbers/sound_number_1 (1).mp3",
    ),
    //2
    QuizQuestion(
      questionText: "Khamsha",
      options: [
        "assets/numbers/Number2.jpg",
        "assets/numbers/Number8.jpg",
        "assets/numbers/Number3.jpg",
        "assets/numbers/Number5.jpg",
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/numbers/sound_number_1 (5).mp3",
    ),
    //3
    QuizQuestion(
      questionText: "Sabaah",
      options: [
        "assets/numbers/Number7.jpg",
        "assets/numbers/Number2.jpg",
        "assets/numbers/Number1.jpg",
        "assets/numbers/Number4.jpg",
      ],
      correctAnswerIndex: 0,
      soundPath: "assets/numbers/sound_number_1 (7).mp3",
    ),
    //4
    QuizQuestion(
      questionText: "Tesaah",
      options: [
        "assets/numbers/Number7.jpg",
        "assets/numbers/Number2.jpg",
        "assets/numbers/Number9.jpg",
        "assets/numbers/Number4.jpg",
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/numbers/sound_number_1 (9).mp3",
    ),
    //5
    QuizQuestion(
      questionText: "Arbaah",
      options: [
        "assets/numbers/Number1.jpg",
        "assets/numbers/Number7.jpg",
        "assets/numbers/Number4.jpg",
        "assets/numbers/Number2.jpg",
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/numbers/sound_number_1 (4).mp3",
    ),
    // add more questions here
  ],

//set3   day
  [
    QuizQuestion(
      questionText: "Al Jumuah",
      options: [
        "assets/days/day4.png",
        "assets/days/day5.png",
        "assets/days/day1.png",
        "assets/days/day6.png",
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/days/soundDay6.mp3",
    ),
    //2
    QuizQuestion(
      questionText: "al ahad",
      options: [
        "assets/days/day1.png",
        "assets/days/day6.png",
        "assets/days/day4.png",
        "assets/days/day3.png",
      ],
      correctAnswerIndex: 0,
      soundPath: "assets/days/soundDay1.mp3",
    ),
    //3
    QuizQuestion(
      questionText: "althulatha",
      options: [
        "assets/days/day5.png",
        "assets/days/day4.png",
        "assets/days/day3.png",
        "assets/days/day1.png",
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/days/soundDay3.mp3",
    ),
    //4
    QuizQuestion(
      questionText: "al khamis",
      options: [
        "assets/days/day1.png",
        "assets/days/day5.png",
        "assets/days/day4.png",
        "assets/days/day7.png",
      ],
      correctAnswerIndex: 1,
      soundPath: "assets/days/soundDay5.mp3",
    ),
    //5
    QuizQuestion(
      questionText: "al sabt",
      options: [
        "assets/days/day3.png",
        "assets/days/day7.png",
        "assets/days/day5.png",
        "assets/days/day1.png",
      ],
      correctAnswerIndex: 1,
      soundPath: "assets/days/soundDay7.mp3",
    ),
  ],

//set4   month
  [
    //1
    QuizQuestion(
      questionText: "abril",
      options: [
        "assets/months/Month1.jpg",
        "assets/months/Month1.jpg",
        "assets/months/Month4.jpg",
        "assets/months/Month1.jpg",
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/months/soundMonth4.mp3",
    ),
    //2
    QuizQuestion(
      questionText: "Yuniyu",
      options: [
        "assets/months/Month6.jpg",
        "assets/months/Month1.jpg",
        "assets/months/Month5.jpg",
        "assets/months/Month9.jpg",
      ],
      correctAnswerIndex: 0,
      soundPath: "assets/months/soundMonth6.mp3",
    ),
    //3
    QuizQuestion(
      questionText: "Uktubar",
      options: [
        "assets/months/Month10.jpg",
        "assets/months/Month11.jpg",
        "assets/months/Month8.jpg",
        "assets/months/Month9.jpg",
      ],
      correctAnswerIndex: 0,
      soundPath: "assets/months/soundMonth10.mp3",
    ),
    //4
    QuizQuestion(
      questionText: "Disambar",
      options: [
        "assets/months/Month9.jpg",
        "assets/months/Month10.jpg",
        "assets/months/Month11.jpg",
        "assets/months/Month12.jpg",
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/months/soundMonth12.mp3",
    ),
    //5
    QuizQuestion(
      questionText: "Mayu",
      options: [
        "assets/months/Month12.jpg",
        "assets/months/Month5.jpg",
        "assets/months/Month8.jpg",
        "assets/months/Month7.jpg",
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/months/soundMonth5.mp3",
    ),
  ],

//set5   colour
  [
    QuizQuestion(
      questionText: "Al ahmar",
      options: [
        "assets/colour/Colour3.jpg",
        "assets/colour/Colour5.jpg",
        "assets/colour/Colour1.jpg",
        "assets/colour/Colour2.jpg",
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/colour/soundcolour1.mp3",
    ),
//2

    QuizQuestion(
      questionText: "Al Arjuwani",
      options: [
        "assets/colour/Colour1.jpg",
        "assets/colour/Colour3.jpg",
        "assets/colour/Colour4.jpg",
        "assets/colour/Colour2.jpg",
      ],
      correctAnswerIndex: 1,
      soundPath: "assets/colour/soundcolour3.mp3",
    ),
//3

    QuizQuestion(
      questionText: "Al Azraq",
      options: [
        "assets/colour/Colour6.jpg",
        "assets/colour/Colour5.jpg",
        "assets/colour/Colour2.jpg",
        "assets/colour/Colour4.jpg",
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/colour/soundcolour4.mp3",
    ),

//4

    QuizQuestion(
      questionText: "Al Aswad",
      options: [
        "assets/colour/Colour6.jpg",
        "assets/colour/Colour5.jpg",
        "assets/colour/Colour8.jpg",
        "assets/colour/Colour7.jpg",
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/colour/soundcolour8.mp3",
    ),
//5

    QuizQuestion(
      questionText: "Al Burtuqali",
      options: [
        "assets/colour/Colour2.jpg",
        "assets/colour/Colour7.jpg",
        "assets/colour/Colour6.jpg",
        "assets/colour/Colour8.jpg",
      ],
      correctAnswerIndex: 1,
      soundPath: "assets/colour/soundcolour7.mp3",
    ),
  ],

//set6   animal

  [
    QuizQuestion(
      questionText: "Asadun",
      options: [
        "assets/animal/Animal1.jpg",
        "assets/animal/Animal2.jpg",
        "assets/animal/Animal3.jpg",
        "assets/animal/Animal4.jpg"
      ],
      correctAnswerIndex: 0,
      soundPath: "assets/animal/soundAnimal1.mp3",
    ),
    QuizQuestion(
      questionText: "Jamal",
      options: [
        "assets/animal/Animal4.jpg",
        "assets/animal/Animal3.jpg",
        "assets/animal/Animal5.jpg",
        "assets/animal/Animal7.jpg"
      ],
      correctAnswerIndex: 1,
      soundPath: "assets/animal/soundAnimal3.mp3",
    ),
    // add more questions here
    //3
    QuizQuestion(
      questionText: "Namir",
      options: [
        "assets/animal/Animal9.jpg",
        "assets/animal/Animal2.jpg",
        "assets/animal/Animal5.jpg",
        "assets/animal/Animal4.jpg"
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/animal/soundAnimal4.mp3",
    ),
    //4
    QuizQuestion(
      questionText: "Qit",
      options: [
        "assets/animal/Animal2.jpg",
        "assets/animal/Animal8.jpg",
        "assets/animal/Animal6.jpg",
        "assets/animal/Animal7.jpg"
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/animal/soundAnimal6.mp3",
    ),
    //5
    QuizQuestion(
      questionText: "Qubb Qutbi",
      options: [
        "assets/animal/Animal1.jpg",
        "assets/animal/Animal2.jpg",
        "assets/animal/Animal9.jpg",
        "assets/animal/Animal10.jpg"
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/animal/soundAnimal10.mp3",
    ),
  ],

  //set7 fruits
  [
    QuizQuestion(
      questionText: "TafaHha",
      options: [
        "assets/fruit/Fruit1.jpg",
        "assets/fruit/Fruit2.jpg",
        "assets/fruit/Fruit3.jpg",
        "assets/fruit/Fruit4.jpg"
      ],
      correctAnswerIndex: 0,
      soundPath: "assets/fruit/soundFruit1.mp3",
    ),
    QuizQuestion(
      questionText: "Burtuqaal",
      options: [
        "assets/fruit/Fruit7.jpg",
        "assets/fruit/Fruit1.jpg",
        "assets/fruit/Fruit4.jpg",
        "assets/fruit/Fruit3.jpg"
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/fruit/soundFruit4.mp3",
    ),
//3
    QuizQuestion(
      questionText: "Feawla",
      options: [
        "assets/fruit/Fruit3.jpg",
        "assets/fruit/Fruit9.jpg",
        "assets/fruit/Fruit1.jpg",
        "assets/fruit/Fruit6.jpg"
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/fruit/soundFruit6.mp3",
    ),
    //4
    QuizQuestion(
      questionText: "Mango",
      options: [
        "assets/fruit/Fruit6.jpg",
        "assets/fruit/Fruit2.jpg",
        "assets/fruit/Fruit10.jpg",
        "assets/fruit/Fruit1.jpg"
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/fruit/soundFruit10.mp3",
    ),
    //5
    QuizQuestion(
      questionText: "Mawz",
      options: [
        "assets/fruit/Fruit4.jpg",
        "assets/fruit/Fruit8.jpg",
        "assets/fruit/Fruit7.jpg",
        "assets/fruit/Fruit10.jpg"
      ],
      correctAnswerIndex: 1,
      soundPath: "assets/fruit/soundFruit8.mp3",
    ),
  ],

//set 8 // veg

  [
    QuizQuestion(
      questionText: "Fatar",
      options: [
        "assets/veg/Veg4.jpg",
        "assets/veg/Veg5.jpg",
        "assets/veg/Veg3.jpg",
        "assets/veg/Veg1.jpg"
      ],
      correctAnswerIndex: 0,
      soundPath: "assets/veg/soundveg8.mp3",
    ),
    //2
    QuizQuestion(
      questionText: "Basal",
      options: [
        "assets/veg/Veg1.jpg",
        "assets/veg/Veg3.jpg",
        "assets/veg/Veg7.jpg",
        "assets/veg/Veg8.jpg"
      ],
      correctAnswerIndex: 2,
      soundPath: "assets/veg/soundveg7.mp3",
    ),
    //3
    QuizQuestion(
      questionText: "Brokoli",
      options: [
        "assets/veg/Veg8.jpg",
        "assets/veg/Veg4.jpg",
        "assets/veg/Veg6.jpg",
        "assets/veg/Veg5.jpg"
      ],
      correctAnswerIndex: 3,
      soundPath: "assets/veg/soundveg5.mp3",
    ),
    //4
    QuizQuestion(
      questionText: "Jazar",
      options: [
        "assets/veg/Veg6.jpg",
        "assets/veg/Veg3.jpg",
        "assets/veg/Veg4.jpg",
        "assets/veg/Veg5.jpg"
      ],
      correctAnswerIndex: 1,
      soundPath: "assets/veg/soundveg3.mp3",
    ),
    //5
    QuizQuestion(
      questionText: "Batatas",
      options: [
        "assets/veg/Veg2.jpg",
        "assets/veg/Veg8.jpg",
        "assets/veg/Veg6.jpg",
        "assets/veg/Veg3.jpg"
      ],
      correctAnswerIndex: 0,
      soundPath: "assets/veg/soundveg2.mp3",
    ),
  ]
];
