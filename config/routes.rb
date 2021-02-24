HolidayWorkday::Engine.routes.draw do
  resources :hwdays, only: [:index] do
    post :toggle, on: :collection
  end
end
