List<QuestionModel> questions = [
  QuestionModel(
    "What is the 'P/E Ratio' and what does it signify?",
    {
      "Profit to Expense": false,
      "Profit to Earnings": false,
      "Price to Earnings": true,
    },
  ),
  QuestionModel(
    "How is 'Earnings Per Share (EPS)' calculated?",
    {
      "Dividing the company's total revenue by its total number of outstanding shares":
          false,
      "Dividing the company's gross profit by its total number of outstanding shares":
          false,
      "Dividing the company’s profit after tax by its total number of outstanding shares.":
          true,
    },
  ),
];

class QuestionModel {
  String? question;
  Map<String, bool>? answers;

  QuestionModel(this.question, this.answers);
}
