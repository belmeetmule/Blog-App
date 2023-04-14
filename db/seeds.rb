users=User.create([
  { name: 'User1', photo: 'https://example.com/user1.jpg', bio: 'Bio1' },
  { name: 'User2', photo: 'https://example.com/user2.jpg', bio: 'Bio2' },
  { name: 'User3', photo: 'https://example.com/user3.jpg', bio: 'Bio3' },
  { name: 'User4', photo: 'https://example.com/user4.jpg', bio: 'Bio4' },
  { name: 'User5', photo: 'https://example.com/user5.jpg', bio: 'Bio5' }
])

users = User.all

posts = []
5.times do |i|
  posts << Post.create(
    title: "Post #{i+1}", 
    text: "Text #{i+1}", 
    author: users[i % 5]
  )
end

comments = []
5.times do |i|
  comments << Comment.create(
    text: "Comment #{i+1}", 
    author: users[i % 5],
    post: posts[i % 5]
  )
end

9.times do |i|
  Like.create(
    author: users[i % 5],
    post: posts[i % 5]
  )
end