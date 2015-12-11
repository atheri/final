a = User.create! :email => 'a@a.com', :password => 'a', :password_confirmation => 'a'
b = User.create! :email => 'b@b.com', :password => 'b', :password_confirmation => 'b'
c = User.create! :email => 'c@c.com', :password => 'c', :password_confirmation => 'c'

b1 = Board.create(name: 'Default', user_id: a.id) 

p1 = Post.create(title: 'B - First Post', p_type: 'text', data: 'B is Posting to the default board or something', board_id: b1.id, user_id: b.id)

c1 = Comment.create(data: 'C is commenting on B\'s post to the board', post_id: p1.id, user_id: c.id)
