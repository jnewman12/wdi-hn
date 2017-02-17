Rails.application.routes.draw do
  resources :posts do
    member do
      put '/upvote' => 'posts#upvote'
    end
    resources :comments do
      put '/upvote' => 'comments#upvote'
    end
  end
end
