# encoding: utf-8

class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(params[:contact_form])
      @contact_form.request = request
      if @contact_form.deliver
        flash.now[:notice] = 'Ευχαριστούμε για το μήνυμά σας!'
      else
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Λυπούμαστε. Αυτό το μήνυμα θεωρείται spam και δε μπορεί να παραδοθεί.'
    end
  end
end