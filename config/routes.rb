Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'generate', to: 'tickets#generate'
  get 'generate_delay', to: 'tickets#generate_delay'
  get 'generate_fail', to: 'tickets#generate_fail'
  get 'delete', to: 'tickets#delete'
end
