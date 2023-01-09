import '../res/shared/const.dart';

class QuestionModel {
  String? quest;
  String? image;
  List<String>? answers;
  String? topic;
  String? trueAnswer;

  QuestionModel({
    this.quest,
    this.image,
    this.answers,
    this.topic,
    this.trueAnswer,
  });

  static List<QuestionModel> getQuestionDummy() => [
        QuestionModel(
          quest: "Who is the current governor of Jakarta?",
          image: imgAnis,
          answers: [
            "Puan Maharani",
            "Anies Baswedan",
            "Joko Widodo",
            "Basuki Purnama"
          ],
          topic: "politics",
          trueAnswer: "Anies Baswedan",
        ),
        QuestionModel(
          quest:
              "What is the name of the human rights activist who was killed?",
          answers: [
            "Munir",
            "Gusdur",
            "Haris Azhar",
            "Rocky Gerung",
          ],
          topic: "politics",
          trueAnswer: "Munir",
        ),
        QuestionModel(
          quest: "The highest office in a country is?",
          answers: [
            "Vice President",
            "Coordinating Minister for Politics",
            "Head of political party",
            "President",
          ],
          topic: "politics",
          trueAnswer: "President",
        ),
        QuestionModel(
          quest: "Who is the first president of Indonesia?",
          image: imgSoekarno,
          answers: [
            "Ir. Soekarno",
            "Abdurrahman Wahid",
            "Luhut Binsar Panjaitan",
            "Agus Yudhoyono",
          ],
          topic: "politics",
          trueAnswer: "Ir. Soekarno",
        ),
        QuestionModel(
          quest:
              "What is the name of the organization that wants independence from Indonesia in West Papua?",
          answers: [
            "GAM",
            "PSSI",
            "OPM",
            "Pemuda Pancasila",
          ],
          topic: "politics",
          trueAnswer: "Ir. Soekarno",
        ),
        QuestionModel(
          quest: "Wich is the fastest animal on the land?",
          answers: [
            "Lion",
            "Tiger",
            "Cheeta",
            "Wolf",
          ],
          topic: "animals",
          trueAnswer: "Cheeta",
        ),
        QuestionModel(
          quest: "Animals with long noses?",
          image: imgElephant,
          answers: [
            "Elephant",
            "Tiger",
            "Horse",
            "Chicken",
          ],
          topic: "animals",
          trueAnswer: "Elephant",
        ),
        QuestionModel(
          quest: "How many legs on a chicken?",
          answers: [
            "1",
            "2",
            "3",
            "4",
          ],
          topic: "animals",
          trueAnswer: "2",
        ),
        QuestionModel(
          quest: "Why can't chickens fly?",
          answers: [
            "Because they are cared for by humans",
            "Because it is not supported by regulation by the government",
            "The fur is too thin",
            "Wings are too small and the wing muscles are too heavy",
          ],
          topic: "animals",
          trueAnswer: "Wings are too small and the wing muscles are too heavy",
        ),
        QuestionModel(
          quest: "Meat eating animals are called?",
          answers: [
            "Herbivore",
            "Carnivore",
            "Friend",
            "Cebong",
          ],
          topic: "animals",
          trueAnswer: "Carnivore",
        ),
        QuestionModel(
          quest: "The best club in the world?",
          image: imgJuventus,
          answers: [
            "Juventus",
            "Real Madrid",
            "Rans Nusantara FC",
            "Barcelona",
          ],
          topic: "sport",
          trueAnswer: "Juventus",
        ),
        QuestionModel(
          quest: "Organization that manages football in Indonesia?",
          answers: [
            "PBSI",
            "PSSI",
            "Percasi",
            "PABBSI",
          ],
          topic: "sport",
          trueAnswer: "PSSI",
        ),
        QuestionModel(
          quest: "The sport of lifting weights is called?",
          answers: [
            "Football",
            "Boxing",
            "Weight Lifting",
            "Basketball",
          ],
          topic: "sport",
          trueAnswer: "Weight Lifting",
        ),
        QuestionModel(
          quest: "Who has the most ballon d'or?",
          answers: [
            "Taufik Hidayat",
            "Cristiano Ronaldo",
            "Lionel Messi",
            "Mbida Messi",
          ],
          topic: "sport",
          trueAnswer: "Lionel Messi",
        ),
        QuestionModel(
          quest: "National sports festival in Indonesia?",
          answers: [
            "Pekan Olahraga Nasional",
            "Pekan Raya Jakarta",
            "BWF Tournament",
            "Festival Jajanan Bango",
          ],
          topic: "sport",
          trueAnswer: "Pekan Olahraga Nasional",
        ),
        QuestionModel(
          quest: "Who is the chairman of PSSI?",
          answers: [
            "Iwan Bule",
            "Shin Tae Yong",
            "Widodo CP",
            "Budi Sudarsono",
          ],
          topic: "sport",
          trueAnswer: "Iwan Bule",
        ),
      ];
}
