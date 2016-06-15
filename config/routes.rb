Rails.application.routes.draw do

  mount Portal::Engine        => '/'
  mount Administrator::Engine => '/ad'
  
end
