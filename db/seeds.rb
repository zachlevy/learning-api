# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# simple Q and A challenge type
simple_q_and_a = ChallengeType.create({
  name: "simple_q_and_a",
  template_data: {
    question: "Question?",
    answer: "Answer.",
    max_length: 140
  }
})

# youtube video challenge type
youtube_video = ChallengeType.create({
  name: "youtube_video",
  template_data: {
    youtube_id: "7Qtr_vA3Prw",
    est_duration: 748
  }
})

# wikipedia notes challenge type
wikipedia_notes = ChallengeType.create({
  name: "wikipedia_notes",
  template_data: {
    embed_url: "https://en.m.wikipedia.org/wiki/Battle_of_Stamford_Bridge",
    est_duration: 601,
    max_length: 140
  }
})

# end challenge type
suggestion_end = ChallengeType.create({
  name: "suggestion_end",
  template_data: {
    courses: [1, 2]
  }
})

# start challenge type
simple_start = ChallengeType.create({
  name: "simple_start",
  template_data: {

  }
})

# videos for economics
economics_youtube_videos = Challenge.create([
  {
    description: "The Economics of Death",
    challenge_type: youtube_video,
    body: {
      youtube_id: "AecowUb79Xk",
      est_duration: 752
    }
  },
  {
    description: "The Economics of Taxes",
    challenge_type: youtube_video,
    body: {
      youtube_id: "7Qtr_vA3Prw",
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
      answer: "No",
      max_length: 140
    }
  },{
    description: "Taxes question",
    challenge_type: simple_q_and_a,
    body: {
      question: "Can you avoid taxes?",
      answer: "No",
      max_length: 140
    }
  }
])

# challenges for computers
challenges = Challenge.create([
  {
    description: "Ram Question",
    challenge_type: simple_q_and_a,
    body: {
      question: "How many KB in a MB?",
      answer: "1024",
      max_length: 140
    }
  },{
    description: "CPU Question",
    challenge_type: simple_q_and_a,
    body: {
      question: "What are CPUs made of?",
      answer: "Semiconductors",
      max_length: 140
    }
  }
])

# computers youtube videos
computers_youtube_videos = Challenge.create([
  {
    description: "Registers and RAM",
    challenge_type: youtube_video,
    body: {
      youtube_id: "fpnE6UAfbtU",
      est_duration: 736
    }
  },{
    description: "The Central Processing Unit",
    challenge_type: youtube_video,
    body: {
      youtube_id: "FZGugFqdr60",
      est_duration: 697
    }
  },{
    description: "Battle of Stamford Bridge",
    challenge_type: wikipedia_notes,
    body: {
      embed_url: "https://en.m.wikipedia.org/wiki/Battle_of_Stamford_Bridge",
      est_duration: 301,
      max_length: 140
    }
  }
])

start_end_challenges = Challenge.create([
  {
    description: "Start of Economics course",
    challenge_type: simple_start,
    body: {

    }
  }, {
    description: "Start of Computers course",
    challenge_type: simple_start,
    body: {

    }
  }, {
    description: "End of Economics Course",
    challenge_type: suggestion_end,
    body: {
      courses: [2]
    }
  }, {
    description: "End of Computers Course",
    challenge_type: suggestion_end,
    body: {
      courses: [1]
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
      type: Challenge.find(10).challenge_type.name,
      id: Challenge.find(10).id
    }, {
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
    }, {
      type: Challenge.find(12).challenge_type.name,
      id: Challenge.find(12).id
    }
  ],
  tags: ["Economics", "Crash Course"]
})

# course on computers
computers_course = Course.create({
  title: "Compute This",
  description: "Computers have taken over the world.",
  image_url: "http://placehold.it/600x400?text=Compute%20This",
  flow: [
    {
      type: Challenge.find(11).challenge_type.name,
      id: Challenge.find(11).id
    }, {
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
    }, {
      type: Challenge.find(13).challenge_type.name,
      id: Challenge.find(13).id
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
