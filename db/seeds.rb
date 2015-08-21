User.delete_all
Follow.delete_all

user = User.new
user.name = 'Jack'
user.email = 'jack@example.com'
user.password = 123456
user.sex = 'male'
user.age = 35
user.region = 'California'
user.status = 'Today, I found out that the motorcycle I paid cash for was an illegal import. My plates are canceled, I have to turn in the bike for it to be destroyed, and the seller has vanished off the face of the planet. FML'
user.save

user = User.new
user.name = 'Simon'
user.email = 'simon@example.com'
user.password = 123456
user.sex = 'male'
user.age= 19
user.region = 'Illinois'
user.status = 'Today, my niece started crying because she thought that someday she willll look like me. FML'
user.save

user = User.new
user.name = 'Dean'
user.email = 'Dean@example.com'
user.password = 123456
user.sex = 'male'
user.age= 19
user.region = 'Illinois'
user.status = 'Today, my son started crying because she thought that someday she willll look like me. FML'
user.save

user = User.new
user.name = 'Mary'
user.email = 'mary@example.com'
user.password = 123456
user.sex = 'female'
user.age= 25
user.region = 'California'
user.status = 'Today, my daughter started crying because she thought that someday she willll look like me. FML'
user.save

user = User.new
user.name = 'May'
user.email = 'may@example.com'
user.sex = 'female'
user.age= 25
user.password = 123456
user.region = 'New York'
user.status = 'Today, after working incredibly hard to get into college without having to take out loans, classes started. I was told we will need a $200 piece of software, and we will fail without it. There is no way I can afford it. FML'
user.save

follow = Follow.new
follow.follower_id = User.find_by_name('Jack').id
follow.followee_id = User.find_by_name('Simon').id
follow.save

follow = Follow.new
follow.follower_id = User.find_by_name('May').id
follow.followee_id = User.find_by_name('Jack').id
follow.save

message = Message.new
message.receiver_id = User.find_by_name('Jack').id
message.sender_id = User.find_by_name('May').id
message.content = 'Hello I am May. How are you doing?'
message.save

message = Message.new
message.receiver_id = User.find_by_name('Jack').id
message.sender_id = User.find_by_name('Simon').id
message.content = 'Hello I am Simon. How are you doing?'
message.save

search = Search.new
search.searcher_id = User.find_by_name('Jack').id
search.age = 25
search.sex = 'female'
search.region = 'California'
search.save
