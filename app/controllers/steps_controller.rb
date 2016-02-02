class StepsController < ApplicationController

  include Wicked::Wizard

  before_action :set_person

  steps :personal_info, :photo

  def show
    render_wizard
  end

  def update
    @person.step_validation = step
    @person.attributes = person_params
    if @person.save
      update_session
      respond_to do |format|
        format.html { redirect_to next_wizard_path }
        format.json { render json: {result: :success, location: next_wizard_path} }
      end
    else
      respond_to do |format|
        format.html { render_wizard }
        format.json { render json: {result: :error} }
      end
    end
  end

  def finish_wizard_path
    person_path(@person)
  end

  private

  def person_params
    params.require(:person).permit(:name, :surname, :photo, :sex)
  end

  def set_person
    @person = Person.find_by(id: session[:person_id]) if session[:person_id]
    @person ||= Person.new
    update_session
  end

  def update_session
    session[:person_id] = @person.try(:persisted?) ? @person.id : nil
  end

end