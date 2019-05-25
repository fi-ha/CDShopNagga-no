class Administrator::ResponsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user
# namespaceに入っているコントローラーは親コントローラーの名前を書かなければ使用できない
    def create
      @respon = Respon.new(respon_params)
      # htmlに返すインスタンスを複数設定する場合にrespond_toを使用する
      respond_to do |format|
        if @respon.save
          #下記記述で問い合わせフォーム専用のメールを送信出来るようにする.deliverを最後に付けることで送信
          PersonalMailer.send_when_respon_to_user(@respon).deliver
          #以下の記述でcreate.js.erbに飛ぶ
          format.js
          # htmlには以下を返す
          format.html { redirect_to @respon, notice: 'Band was successfully created.' }
          # jsonには以下を返す
          format.json { render :show, status: :created, location: @respon }
        else
          format.html { render :new }
          format.json { render json: @respon.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
      @respon = Respon.find_by(contact_id: params[:id])
    end

    private
    def respon_params
        params.require(:respon).permit(:respon_name, :subject, :body, :contact_id)
    end

    def admin_user
        redirect_to(items_path) unless current_user.admin?
    end
end
