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

 tests = Test.create!([
  {title: "Структуры", level: 2, category_id: categories[0].id },
  {title: 'Циклы', level: 1, category_id: categories[0].id},
  {title: 'Теги HTML', level: 1, category_id: categories[1].id},
  {title: 'Позиционирование', level: 1, category_id: categories[1].id}
  ])

questions = Question.create!([
  {body: 'Укажите типы доступа возможные для элементов структур:', test_id: tests[0].id},
  {body: 'Обязательный атрибут тега <img>:', test_id: tests[2].id}
  ])

answers = Answer.create!([
  {body: 'Любые', question_id: questions[0].id},
  {body: 'Только закрытые', question_id: questions[0].id},
  {body: 'Только открытые', correct: true, question_id: questions[0].id},
  {body: 'Только защищены', question_id: questions[0].id},

  {body: 'src', correct: true, question_id: questions[1].id},
  {body: 'alt', question_id: questions[1].id},
  {body: 'title', question_id: questions[1].id}
  ])

users = User.create!([
  {first_name: 'Sonya', last_name: 'Bitno', email: 'x@gmail.com'},
  {first_name: 'Grigory', last_name: 'Bitno', email: 'y@gmail.com'}
  ])
