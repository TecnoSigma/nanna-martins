Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: "administrador/login",
      sign_out: "logout",
    }

  root to: 'home#index'

  scope module: 'admin_panel', path: 'administrador', as: 'admin_panel' do
    get '/', to: 'dashboard#index'

    get  '/clientes',        to: 'customers#index'
    get  '/clientes/novo',   to: 'customers#new'
    post '/clientes/create', to: 'customers#create'
  end
end
