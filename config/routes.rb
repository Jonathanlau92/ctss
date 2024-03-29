Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :tutors
    resources :students
    resources :matches
    resources :feedbacks

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
  get 'student-thank_you', to: 'pages#student_ending_page', as: :student_ending
  get 'tutor-thank_you', to: 'pages#tutor_ending_page', as: :tutor_ending
  get 'student-notice-extension', to: 'pages#student_extension_notice', as: :student_extension_notice
  get 'tutor-notice-extension', to: 'pages#tutor_extension_notice', as: :tutor_extension_notice
  get 'welcome-feedback', to: 'feedbacks#welcome' , as: :feedback_welcome
  get 'match-search', to: 'pages#match_search', as: :match_search
  root to: 'pages#home'
end
