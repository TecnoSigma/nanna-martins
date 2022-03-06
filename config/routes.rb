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
    get    '/clientes/:id/editar', to: 'customers#edit', as: 'edit_customer'
    post   '/clientes/create',     to: 'customers#create'
    put    '/clientes/:id/update', to: 'customers#update', as: 'update_customer'
    delete '/clientes/:id/delete', to: 'customers#delete', as: 'delete_customer'

    get    '/fornecedores',            to: 'providers#index'
    get    '/fornecedores/novo',       to: 'providers#new'
    get    '/fornecedores/:id/editar', to: 'providers#edit', as: 'edit_provider'
    post   '/fornecedores/create',     to: 'providers#create'
    put    '/fornecedores/:id/update', to: 'providers#update', as: 'update_provider'
    delete '/fornecedores/:id/delete', to: 'providers#delete', as: 'delete_provider'
  end
end
