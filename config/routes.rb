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

    get    '/clientes',            to: 'customers#index'
    get    '/clientes/novo',       to: 'customers#new'
    get    '/clientes/:id/editar', to: 'customers#edit'
    post   '/clientes/create',     to: 'customers#create'
    put    '/clientes/:id/update', to: 'customers#update', as: 'update_customer'
    delete '/clientes/:id/delete', to: 'customers#delete', as: 'delete_customer'
  end
end
