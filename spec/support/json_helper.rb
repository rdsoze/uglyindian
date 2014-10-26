module JsonHelper

  def json_get(action, params = {})
    get(action, params.merge(format: :json))
    Hashie::Mash.new({ status: response.status, body: (response.body.blank?)? nil : JSON.parse(response.body) })
  end

  def json_post(action, params = {})
    post(action, params.merge(format: :json))
    Hashie::Mash.new({ status: response.status, body: (response.body.blank?)? nil : JSON.parse(response.body) })
  end

  def json_put(action, params = {})
    put(action, params.merge(format: :json))
    Hashie::Mash.new({ status: response.status, body: (response.body.blank?)? nil : JSON.parse(response.body) })
  end

  def json_delete(action, params = {})
    delete(action, params.merge(format: :json))
    Hashie::Mash.new({ status: response.status, body: (response.body.blank?)? nil : JSON.parse(response.body) })
  end
end
