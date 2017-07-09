# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # content for death and taxes
# content = Content.create([
#   {
#     title: "The Economics of Death",
#     embed_url: "https://www.youtube.com/embed/AecowUb79Xk",
#     est_duration: 752
#   },
#   {
#     title: "The Economics of Taxes",
#     embed_url: "https://www.youtube.com/embed/7Qtr_vA3Prw",
#     est_duration: 748
#   }
# ])

# simple Q and A challenge type
simple_q_and_a = ChallengeType.create({
  name: "simple_q_and_a",
  template_data: {
    question: "Question?",
    answer: "Answer."
  }
})

# youtube video challenge type
youtube_video = ChallengeType.create({
  name: "youtube_video",
  template_data: {
    title: "The Economics of Taxes",
    embed_url: "https://www.youtube.com/embed/7Qtr_vA3Prw",
    est_duration: 748
  }
})

# wikipedia notes challenge type
wikipedia_notes = ChallengeType.create({
  name: "wikipedia_notes",
  template_data: {
    title: "Battle of Stamford Bridge",
    embed_url: "https://en.m.wikipedia.org/wiki/Battle_of_Stamford_Bridge",
    est_duration: 601
  }
})

# videos for economics
economics_youtube_videos = Challenge.create([
  {
    description: "The Economics of Death",
    challenge_type: youtube_video,
    body: {
      embed_url: "https://www.youtube.com/embed/AecowUb79Xk",
      est_duration: 752
    }
  },
  {
    description: "The Economics of Taxes",
    challenge_type: youtube_video,
    body: {
      embed_url: "https://www.youtube.com/embed/7Qtr_vA3Prw",
      est_duration: 748
    }
  }
])

# challenges for death and taxes
challenges = Challenge.create([
  {
    description: "Death question",
    challenge_type: simple_q_and_a,
    body: {
      question: "Can you avoid death?",
      answer: "No"
    }
  },{
    description: "Taxes question",
    challenge_type: simple_q_and_a,
    body: {
      question: "Can you avoid taxes?",
      answer: "No"
    }
  }
])

# course on death and taxes
course_death_and_taxes = Course.create({
  title: "Except Death and Taxes",
  description: "Economics. It is said that nothing is certain in life, except death and taxes.",
  image_url: "http://placehold.it/600x400?text=Death%20Taxes",
  flow: [
    {
      type: Challenge.first.challenge_type.name,
      id: Challenge.first.id
    }, {
      type: Challenge.second.challenge_type.name,
      id: Challenge.second.id
    }, {
      type: Challenge.fourth.challenge_type.name,
      id: Challenge.fourth.id
    }, {
      type: Challenge.third.challenge_type.name,
      id: Challenge.third.id
    }
  ],
  tags: ["Economics", "Crash Course"]
})


# challenges for computers
challenges = Challenge.create([
  {
    description: "Ram Question",
    challenge_type: simple_q_and_a,
    body: {
      question: "How many KB in a MB?",
      answer: "1024"
    }
  },{
    description: "CPU Question",
    challenge_type: simple_q_and_a,
    body: {
      question: "What are CPUs made of?",
      answer: "Semiconductors"
    }
  }
])


# computers youtube videos
computers_youtube_videos = Challenge.create([
  {
    description: "Registers and RAM",
    challenge_type: youtube_video,
    body: {
      embed_url: "https://www.youtube.com/embed/fpnE6UAfbtU",
      est_duration: 736
    }
  },{
    description: "The Central Processing Unit",
    challenge_type: youtube_video,
    body: {
      embed_url: "https://www.youtube.com/embed/FZGugFqdr60",
      est_duration: 697
    }
  },{
    description: "Battle of Stamford Bridge",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "https://en.m.wikipedia.org/wiki/Battle_of_Stamford_Bridge",
      est_duration: 301
    }
  }
])

# course on computers
computers_course = Course.create({
  title: "Compute This",
  description: "Computers have taken over the world.",
  image_url: "http://placehold.it/600x400?text=Compute%20This",
  flow: [
    {
      type: Challenge.fifth.challenge_type.name,
      id: Challenge.fifth.id
    }, {
      type: Challenge.find(6).challenge_type.name,
      id: Challenge.find(6).id
    }, {
      type: Challenge.find(8).challenge_type.name,
      id: Challenge.find(8).id
    }, {
      type: Challenge.find(7).challenge_type.name,
      id: Challenge.find(7).id
    }, {
      type: Challenge.find(9).challenge_type.name,
      id: Challenge.find(9).id
    }
  ],
  tags: ["Tech", "Crash Course"]
})

user1 = User.create({
  email: "z@z.com",
  password: "password123",
  password_confirmation: "password123",
  confirmed_at: DateTime.now
})
