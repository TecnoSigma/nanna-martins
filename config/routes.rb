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
    get    '/clientes/:id/editar', to: 'customers#edit',   as: 'edit_customer'
    post   '/clientes/create',     to: 'customers#create'
    put    '/clientes/:id/update', to: 'customers#update', as: 'update_customer'
    put    '/clientes/:id/status', to: 'customers#status', as: 'change_customer_status'
    delete '/clientes/:id/delete', to: 'customers#delete', as: 'delete_customer'

    get    '/fornecedores',              to: 'providers#index'
    get    '/fornecedores/:id/detalhes', to: 'providers#details', as: 'details_provider'
    get    '/fornecedores/novo',         to: 'providers#new'
    get    '/fornecedores/:id/editar',   to: 'providers#edit',    as: 'edit_provider'
    post   '/fornecedores/create',       to: 'providers#create'
    put    '/fornecedores/:id/update',   to: 'providers#update',  as: 'update_provider'
    put    '/fornecedores/:id/status',   to: 'providers#status',  as: 'change_provider_status'
    delete '/fornecedores/:id/delete',   to: 'providers#delete',  as: 'delete_provider'

    get    '/estoques',            to: 'stocks#index'
    get    '/estoques/novo',       to: 'stocks#new'
    get    '/estoques/:id/editar', to: 'stocks#edit',   as: 'edit_stock'
    post   '/estoques/create',     to: 'stocks#create'
    put    '/estoques/:id/update', to: 'stocks#update', as: 'update_stock'
    put    '/estoques/:id/status', to: 'stocks#status', as: 'change_stock_status'
    delete '/estoques/:id/delete', to: 'stocks#delete', as: 'delete_stock'

    get '/inspiracoes', to: 'inspirations#index'
  end
end
