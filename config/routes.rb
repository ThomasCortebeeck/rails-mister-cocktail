Rails.application.routes.draw do

	 resources :cocktails, only: [:index, :create, :new, :show] do
	 	resources :doses, only: [:new, :create, :destroy] 
	 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#                    Prefix Verb URI Pattern                                                                              Controller#Action
#                 cocktails GET  /cocktails(.:format)                                                                     cocktails#index
#                           POST /cocktails(.:format)                                                                     cocktails#create
#              new_cocktail GET  /cocktails/new(.:format)                                                                 cocktails#new
#                  cocktail GET  /cocktails/:id(.:format)                                                                 cocktails#show
#        rails_service_blob GET  /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET  /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET  /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT  /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create