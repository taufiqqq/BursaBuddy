class DataModel {
  final String title;
  final String imageName;
  final String price;
  DataModel(
    this.title,
    this.imageName,
    this.price,
  );
}

List<DataModel> dataList = [
  DataModel(
      "What does an investment scam look like?",
      "assets/images/scam1.png",
      "Investment scams can take various forms, including offers to broker deals on your behalf, investment software for you to track your portfolio, or a website. All aim to trick you into giving the scammer your money and getting nothing in return.Investment scammers may initially contact you via email, social media message, social media advertising, or even text message."),
  DataModel(
      "What are some of the more common forms?",
      "assets/images/scam2.png",
      "Contacting you via email with a special opportunity to get a fast return \n\nUsing fake celebrity endorsements to make a scam seem legitimate \n\nConvincing you to access your superannuation early or in a lump sum\n\nPonzi schemes, where early investors are paid off with the money from later investors until the money runs out\n\nInvestment seminars (often via online video, Zoom, or similar) that charge high attendance fees."),
  DataModel(
      "What do all investment scams have in common?",
      "assets/images/scam3.png",
      "No matter the form of the investment scam, the basic idea is always the same: The investment scam claims to offer very high returns, with very low risk. In other words, they are get-rich-quick schemes."),
  DataModel("eSafety tip", "assets/images/scam4.png",
      "Investment scams work by promising something that seems too good to be true. Always keep in mind that if something seems too good to be true, it always is."),
  DataModel("How superannuation scams \nwork", "assets/images/scam5.png",
      "One kind of investment scam is the superannuation scam. Super scammers ask you to agree to a story to trick your superannuation provider into letting you get early or extra access to your super., You then invest this money in fake schemes with the scammer and the money is stolen from you."),
  DataModel("How investment seminar scams work", "assets/images/scam6.png",
      "An investment seminar scam offers you special insight or hot tips which will be shared via an internet video seminar. These seminars charge a very high attendance fee (hundreds or thousands of dollars), require you to buy lots of materials such as books or software, and then provide very little useful investment advice."),
  DataModel("How stock tip investment scams work", "assets/images/scam7.png",
      "Some investment scams involve offering supposedly hot stock tips. The scammers ask hundreds or thousands of victims to purchase stock to quickly boost the price of certain shares. The scammers then sell their own shares at the inflated price and disappear. This is also called a ‘pump and dump’ scheme because the scammers pump up the price and then dump their shares."),
];
