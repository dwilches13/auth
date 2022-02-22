class UsersController < ApplicationController
  def show
    @user = User.find(params["id"])
  end

  def new
    @user = User.new
  end

#{"first_name"=>"Daniel",
# "last_name"=>"Wilches Giraldo",
# "email"=>"daniel.wilches@kellogg.northwestern.edu",
# "password"=>"tacos"},
# "commit"=>"Sign up"}


  def create
    plain_text_password = params["user"]["password"] #=> "tacos"
    @user = User.new(params["user"])
    @user.password = BCrypt::Password.create(plain_text_password)
    @user.save
    redirect_to "/users/#{@user.id}"
  end
end
