# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course_death_and_taxes = Course.create({
  title: "Except Death and Taxes",
  description: "Economics. It is said that nothing is certain in life, except death and taxes.",
  flow: []
})

# content for death and taxes
content = Content.create([
  {
    title: "The Economics of Death",
    embed_url: "https://www.youtube.com/embed/AecowUb79Xk",
    est_duration: 752
  },
  {
    title: "The Economics of Taxes",
    embed_url: "https://www.youtube.com/embed/7Qtr_vA3Prw",
    est_duration: 748
  }
])

# simple Q and A content type
challenge_type = ChallengeType.create({
  name: "simple_q_and_a",
  template_data: {
    question: "Question?",
    answer: "Answer."
  }
})

# challenges for death and taxes
challenges = Challenge.create([
  {
    description: "Death question",
    challenge_type: challenge_type,
    body: {
      question: "Can you avoid death?",
      answer: "No"
    }
  },{
    description: "Taxes question",
    challenge_type: challenge_type,
    body: {
      question: "Can you avoid taxes?",
      answer: "No"
    }
  }
])

course_death_and_taxes.update(flow: [
  {
    type: "content",
    id: Content.first.id
  }, {
    type: "challenge",
    id: Challenge.first.id
  }, {
    type: "content",
    id: Content.second.id
  }, {
    type: "challenge",
    id: Challenge.second.id
  }
])
