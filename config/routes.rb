Rails.application.routes.draw do
  resources :posts, only: [:index, :create, :show, :destroy] do
    member do
      put '/upvote' => 'posts#upvote'
    end
    resources :comments, only: [:create, :destroy] do
      put '/upvote' => 'comments#upvote'
    end
  end
end
