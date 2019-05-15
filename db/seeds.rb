# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  {title: 'C++'},
  {title: 'HTML/CSS'}
  ])

users = User.create!([
  {first_name: 'Sonya', last_name: 'Bitno', email: 'x@gmail.com'},
  {first_name: 'Grigory', last_name: 'Bitno', email: 'y@gmail.com'},
  {first_name: 'Creater', last_name: 'Bitno', email: 'z@gmail.com'}
  ])

 tests = Test.create!([
  {title: "Структуры", level: 2, category: categories[0], author: users[2]},
  {title: 'Циклы', level: 1, category: categories[0], author: users[2]},
  {title: 'Теги HTML', level: 1, category: categories[1], author: users[2]},
  {title: 'Позиционирование', level: 1, category: categories[1], author: users[2]}
  ])

questions = Question.create!([
  {body: 'Укажите типы доступа возможные для элементов структур:', test: tests[0]},
  {body: 'Обязательный атрибут тега <img>:', test: tests[2]}
  ])

answers = Answer.create!([
  {body: 'Любые', question: questions[0]},
  {body: 'Только закрытые', question: questions[0]},
  {body: 'Только открытые', correct: true, question: questions[0]},
  {body: 'Только защищены', question: questions[0]},

  {body: 'src', correct: true, question: questions[1]},
  {body: 'alt', question: questions[1]},
  {body: 'title', question: questions[1]}
  ])

passed_tests = PassedTest.create!([
  {test: tests[0], user: users.first},
  {test: tests[1], user: users.first},
  {test: tests[2], user: users.last},
  {test: tests[3], user: users.last}
  ])
