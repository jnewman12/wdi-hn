# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Post.destroy_all
Comment.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('posts')
ActiveRecord::Base.connection.reset_pk_sequence!('comments')


20.times do
  Post.create(
    title: Faker::Company.bs,
    link: Faker::Internet.url,
    upvotes: rand(1..100)
  )
end

100.times do |i|
  Comment.create(
    body: i % 2 == 0 ? Faker::Company.bs : Faker::Hipster.sentence,
    post_id: rand(1..20),
    upvotes: rand(1..20)
  )
end