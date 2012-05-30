class PagesController < ApplicationController
  layout 'test_case', :except => [:index]
  def simple_test
  end
  def custom_class_test
    end

  def index
  end
end
