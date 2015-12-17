require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < ApplicationController
    def new
      @account = Subscribem::Account.new
      @account.build_owner
    end

    def create
      @account = Subscribem::Account.new(account_params)

      if @account.save
        env["warden"].set_user(@account.owner, :scope => :user)
        env["warden"].set_user(@account, :scope => :account)
        redirect_to subscribem.root_url, notice: "Your account has been successfully created."
      else
        render :new, notice: 'Sorry, account is not saved!!!'
      end
    end


    private

      def account_params
        params.require(:account).permit(:name,
                                        {:owner_attributes => [
                                            :email,
                                            :password,
                                            :password_confirmation ]})
      end
  end
end
