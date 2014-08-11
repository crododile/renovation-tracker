Rails.application.routes.draw do
  root 'inspections#new'
  
  resources :inspectors
  
  resources :sessions, :only => [:new, :create, :destroy]

  resources :inspections do
    get "newtoo", on: :member
  end

  resources :currentunits do
    post 'replace', :on => :collection
  end
  
  resources :manager_inspections

  resources :properties 
  
  get 'mis/:property' => 'manager_inspections#manager_dashboard'
  
  #for populating dropdown
  get 'property_units/:id' => 'properties#units'

end
