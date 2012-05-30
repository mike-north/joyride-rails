Rails.application.routes.draw do


  get "pages/simple_test", :to => "pages#simple_test", :as => :simple_test
  get "pages/custom_class_test", :to => "pages#custom_class_test", :as => :custom_class_test

  #mount Joyride::Engine => "/joyride"
  root :to => "pages#index"
end
