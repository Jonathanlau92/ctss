Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :tutors
    resources :students

    root to: "users#index"
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students
  resources :tutors
  resources :feedbacks

  resources :feedback_steps do
    resources :build, controller: 'feedback_steps/build'
  end

  resources :student_steps do
    resources :build, controller: 'student_steps/build'
  end

  resources :tutor_steps do
    resources :build, controller: 'tutor_steps/build'
  end

  get 'welcome-students', to: 'students#student_welcome', as: :student_welcome
  get 'welcome-tutors', to: 'tutors#tutor_welcome', as: :tutor_welcome
  root to: 'pages#home'
end
