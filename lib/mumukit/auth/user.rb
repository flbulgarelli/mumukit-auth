require 'auth0'

class Mumukit::Auth::User

  attr_accessor :social_id, :user, :metadata

  def initialize(social_id)
    @social_id = social_id
    @user = client.user @social_id
    @metadata = get_metadata || {}
  end

  def update_permissions(key, permission)
    add_permission!(key, permission)
    client.update_user_metadata social_id, @metadata
  end

  def get_metadata
    apps.select { |app| @user[app].present? }.map { |app| { "#{app}" => @user[app] } }.reduce({}, :merge)
  end

  def add_permission!(key, permission)
    if @metadata[key].present?
      @metadata[key]['permissions'] += ":#{permission}"
    else
      @metadata.merge!("#{key}" => { 'permissions' => permission })
    end
    @metadata
  end

  def apps
    ['bibliotheca', 'classroom', 'admin', 'atheneum']
  end

  def client
    Auth0Client.new(
        :client_id => ENV['MUMUKI_AUTH0_CLIENT_ID'],
        :client_secret => ENV['MUMUKI_AUTH0_CLIENT_SECRET'],
        :domain => "mumuki.auth0.com"
    )
  end

end