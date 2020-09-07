Rails.application.routes.draw do
  
  root to: "products#index"

  resources :products do
  	collection do
    	get :assign_categories
    	post :assign_product_to_category
	  end
  end	
  
  resources :categories do
  	collection do
	    get :assign_sub_category
	    post :assign_category_to_sub_category
      get :sub_categories
    end
  end 	
end
