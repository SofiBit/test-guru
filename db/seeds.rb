# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  {title: 'С++'},
  {title: 'HTML/CSS'}
  ])

tests = Test.create!([
  {title: "Структуры", level: 2, category_id: 1},
  {title: 'Циклы', levlel: 1, category_id: 1},
  {title: 'Теги HTML', level: 1, category_id: 2},
  {title: 'Позиционирование', levlel: 1, category_id: 2}
  ])

questions = Question.create([
  {body: 'Укажите типы доступа возможные для элементов структур:', test_id: 1},
  {body: 'Обязательный атрибут тега <img>:', test_id: 3}
  ])

answers = Answer.create([
  {body: 'Любые', question_id: 1},
  {body: 'Только закрытые', question_id: 1},
  {body: 'Только открытые', correct: true, question_id: 1},
  {body: 'Только защищены', question_id: 1},

  {body: 'src', correct: true, question_id: 2},
  {body: 'alt', question_id: 2},
  {body: 'title', question_id: 2}
  ])

users = User.create([
  {first_name: 'Sonya', last_name: 'Bitno', email: 'sofiabitno@gmail.com'},
  {first_name: 'Grigory', last_name: 'Bitno', email: 'grigory@gmail.com'}
  ])

passed_tests = PassedTest.create([
  {user_id: 1, test_id: 1},
  {user_id: 1, test_id: 2},
  {user_id: 2, test_id: 1}
  ])
