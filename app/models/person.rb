class Person < ActiveRecord::Base

  extend Enumerize

  attr_accessor :step_validation

  validates_presence_of :name, :surname, if: :should_validate_personal_info?
  validates_presence_of :photo, if: :should_validate_photo?

  enumerize :sex, in: [:male, :female], default: :male

  mount_uploader :photo, PhotoUploader


  def step_validation=(value)
    @step_validation = [:personal_info, :photo].include?(value) ? value : nil
  end

  private

  def should_validate_photo?
    [nil, :photo].include?(@step_validation)
  end

  def should_validate_personal_info?
    [nil, :personal_info].include?(@step_validation)
  end


end
