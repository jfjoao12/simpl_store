ActiveAdmin.register Phone do
  menu false
  permit_params :id, :name, :brand_id, :brand_name, :colors

  collection_action :search, method: :get do
    phones = Phone.ransack(
      name_cont:   params.dig(:q, :name_cont),
      brand_id_eq: params.dig(:q, :brand_id_eq)
    ).result.order(:name).limit(200)

    if color = params.dig(:q, :colors).presence
      phones = phones.select { |p| p.colors.include?(color) }
    end

    respond_to do |format|
      format.html { super() }
      format.json do
        render json: phones.map { |p| { id: p.id, name: p.name, colors: p.colors } }
      end
    end
  end
end
