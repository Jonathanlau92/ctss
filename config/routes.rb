Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students
  resources :tutors

  resources :student_steps do
    resources :build, controller: 'student_steps/build'
  end
  root to: 'pages#home'
end
