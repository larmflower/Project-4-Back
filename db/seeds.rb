[User, Post, Comment].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

#users

lauren = User.create!(username: 'lauren', first_name: 'Lauren', last_name: 'Armbrüst', email: 'l@l.com', password: 'password', password_confirmation: 'password', remote_image_url: 'https://scontent-lht6-1.xx.fbcdn.net/v/t1.0-9/18892945_10210015707974582_5706180472066943476_n.jpg?oh=bc35db39a46cb126c092e895127363a2&oe=5A01AB7F')
alex = User.create!(username: 'alex', first_name: 'Alex', last_name: 'Okamoto', email: 'a@a.com', password: 'password', password_confirmation: 'password', remote_image_url: 'https://scontent-lht6-1.xx.fbcdn.net/v/t1.0-9/17457615_1885830305039121_3356355336804262810_n.jpg?oh=49907f6735899539b9e1c2523d4f1e2e&oe=59FA1318')
jack = User.create!(username: 'jack', first_name: 'Jack', last_name: 'Ass', email: 'j@j.com', password: 'password', password_confirmation: 'password', remote_image_url: 'https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters/p-away-we-go-john-krasinski.jpg')
wolf = User.create!(username: 'wolf', first_name: 'Wolf', last_name: 'Blitzer', email: 'w@w.com', password: 'password', password_confirmation: 'password', remote_image_url: 'https://pbs.twimg.com/profile_images/378800000173019318/8db7be984cfb21b5c6701dd9b6a1bb62_400x400.jpeg')
mark =  User.create!(username: 'mark', first_name: 'Mark', last_name: 'Zuckerberg', email: 'm@m.com', password: 'password', password_confirmation: 'password', remote_image_url: 'http://blogs.timesofindia.indiatimes.com/wp-content/uploads/2015/12/mark-zuckerberg.jpg')
jane =  User.create!(username: 'jane', first_name: 'Jane', last_name: 'Fonda', email: 'ja@ja.com', password: 'password', password_confirmation: 'password', remote_image_url: 'http://queerty-prodweb.s3.amazonaws.com/wp/docs/2013/11/6933_Jane-Fonda-d_copy_2.jpg')
anderson =  User.create!(username: 'anderson', first_name: 'Anderson', last_name: 'Cooper', email: 'an@an.com', password: 'password', password_confirmation: 'password', remote_image_url: 'http://i.huffpost.com/gen/1169791/images/o-ANDERSON-COOPER-BIRTHDAY-facebook.jpg')
abraham =  User.create!(username: 'abraham', first_name: 'Abraham', last_name: 'Lincoln', email: 'ab@ab.com', password: 'password', password_confirmation: 'password', remote_image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Abraham_Lincoln_O-77_matte_collodion_print.jpg/220px-Abraham_Lincoln_O-77_matte_collodion_print.jpg')

#friendships

alex.friend_request(lauren)
lauren.accept_request(alex)

jack.friend_request(lauren)
lauren.accept_request(jack)

jack.friend_request(alex)
alex.accept_request(jack)

abraham.friend_request(mark)
mark.accept_request(abraham)

wolf.friend_request(lauren)
lauren.accept_request(wolf)

alex.friend_request(anderson)
anderson.accept_request(alex)

jack.friend_request(jane)
jane.accept_request(jack)

jack.friend_request(anderson)
anderson.decline_request(jack)

lauren.friend_request(wolf)

abraham.friend_request(lauren)

abraham.friend_request(alex)

#posts

posts = Post.create!([
  {headline: 'AAAAAAA', src: 'bbc-news', categories: 'Politics', description: 'This is bomb.', user: lauren, remote_image_url: 'http://i.imgur.com/lnoEfGy.jpg'},
  {headline: 'Woot Woot', src: 'buzzfeed', categories: 'Pop Culture', description: 'I can\'t believe it.', user: alex, remote_image_url: 'http://i.imgur.com/lnoEfGy.jpg'},
  {headline: 'Cash me out', src: 'daily-mail', categories: 'Pop Culture', description: 'Damn.', user: jack, remote_image_url: 'http://i.imgur.com/lnoEfGy.jpg'}
  ])

#comments

Comment.create!([
  {user: alex, post: posts[0], body: 'what\'s dis'},
  {user: lauren, post: posts[2], body: 'cool'},
  {user: jack, post: posts[1], body: 'hello'}
  ])
