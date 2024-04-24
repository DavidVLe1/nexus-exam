Rails.application.routes.draw do
  get "charts/index"
  get "/practice/:id", to: "exams#practice", as: "practice"
  post "/exam_submission", to: "practice_exams#submit_practice", as: "exam_submission"

  resources :practice_exams, except: [:destroy] do
    member do
      post "start_practice"
      post "submit_practice"
    end
  end
  get "/charts", to: "charts#index"
  get '/landing', to: 'landing#index', as: 'landing'
  root "landing#index"
  resources :exams, except: [:destroy] do
    post "start_practice", on: :member
  end
  devise_for :users
end
