require 'grape'

class CategoryApi < Grape::API
  desc 'Allow retrieval of a single category'
  get '/category/:id' do
    # Auth

    category = Category.find(params[:id])
    present category, with: Entities::CategoryEntity
  end

  desc 'Allow creation of a category'
  params do
    requires :name, type: String, desc: 'Category name'
    requires :description, type: String, desc: 'The description of the category'
  end
  post '/category' do
    category_parameters = ActionController::Parameters.new(params)
      .permit(
        :name,
        :description
      )

    # Auth...

    created_category = Category.create!(category_parameters)

    present created_category, with: Entities::CategoryEntity
  end

  desc 'Allow updating of a categories'
  params do
    optional :name, type: String, desc: 'The category name'
    optional :description, type: String, desc: 'The description of the category'
  end
  put '/category/:id' do
    category_parameters = ActionController::Parameters.new(params)
      .permit(
        :name,
        :description
      )

    # Auth

    update_category = Category.find(params[:id])
    update_category.update! category_parameters

    present update_category, with: Entities::CategoryEntity
  end

  desc 'Delete the category with the indicated id'
  params do
    requires :id, type: Integer, desc: 'The id of the category to delete'
  end
  delete '/category/:id' do
    Category.find(params[:id]).destroy!
    return true
  end

  desc 'Get all the categories'
  get '/category' do
    categories = Category.all

    present categories, with: Entities::CategoryEntity
  end
end