require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < ApplicationController
    def new
      @account = Subscribem::Account.new
    end

    def create
      @account = Subscribem::Account.new(account_params)

      if @account.save
        redirect_to subscribem.root_url, notice: "Your account has been successfully created."
      else
        render :new, notice: 'Sorry, account is not saved!!!'
      end
    end


    private

      def account_params
        params.require(:account).permit(:name)
      end
  end
end
