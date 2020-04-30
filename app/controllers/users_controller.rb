class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @contacts = user.contacts.order("created_at DESC").page(params[:page]).per(5)
    #コメント欄に表示されるユーザー名をクリックすることで送られたidをparamsで取得して、そのユーザーのレコードを変数userに代入
  end
end
