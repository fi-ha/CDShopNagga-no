class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)
      # emailが一致するユーザーを検索
      user = User.find_by(email: @contact.email)
        if user
          # 一致するユーザーが入ればユーザーidを入れる
          @contact.user_id = user.id
        end
      # htmlに返すインスタンスを複数設定する場合にrespond_toを使用する
      respond_to do |format|
        if @contact.save
          #下記記述で問い合わせフォーム専用のメールを送信出来るようにする.deliverを最後に付けることで送信
          PersonalMailer.send_when_contact_to_user(@contact).deliver
          #以下の記述でcreate.js.erbに飛ぶ
          format.js
          # htmlには以下を返す
          format.html { redirect_to @contact, notice: 'Band was successfully created.' }
          # jsonには以下を返す
          format.json { render :show, status: :created, location: @contact }
        else
          format.html { render :new }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end

    def index
    end

    def show
    end

    def update
    end

    private
    def contact_params
        params.require(:contact).permit(:last_name, :first_name, :email, :subject, :body)
    end
end
