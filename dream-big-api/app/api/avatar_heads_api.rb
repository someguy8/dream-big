require 'grape'

class AvatarHeadsApi < Grape::API
  desc 'Allow retrieval of a users avatar-heads'
  get '/avatar-heads/:id' do
    # Auth

    result = AvatarHead.find(params[:id])
    present result, with: Entities::AvatarHeadsEntity
  end

  desc 'Allow creation of an Avatar Heads'
  params do
    requires :imgpath, type: String, desc: 'Link to Accesory image for avatar-Heads'
  end
  post '/avatar-heads' do
    avatar_heads_parameters = ActionController::Parameters.new(params)
      .permit(
        :imgpath
      )

    # Auth...

    result = AvatarHead.create!(avatar_heads_parameters)

    present result, with: Entities::AvatarHeadsEntity
  end

  desc 'Allow updating of a Avatar Heads'
  params do
    optional :imgpath, type: String, desc: 'Link to Accesory image for avatar-Heads'
  end

  put '/avatar-heads/:id' do
    avatar_heads_parameters = ActionController::Parameters.new(params)
      .permit(
        :imgpath
      )

    # Auth

    result = AvatarHead.find(params[:id])
    result.update! avatar_heads_parameters

    present result, with: Entities::AvatarHeadsEntity
  end

  desc 'Delete the Avatar Heads with the indicated id'
  params do
    requires :id, type: Integer, desc: 'The id of the avatar-Heads to delete'
  end
  delete '/avatar-heads/:id' do
    AvatarHead.find(params[:id]).destroy!

    return true
  end

  desc 'Get all the avatar heads'
  get '/avatar-heads' do
    result = AvatarHead.all

    present result, with: Entities::AvatarHeadsEntity
  end
end
