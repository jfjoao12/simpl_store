ActiveAdmin.register Phone do
  menu false
  permit_params :external_id, :name, :brand_id, :brand_name

  collection_action :index, method: :get do
    phones = Phone.ransack(
      name_cont:   params.dig(:q, :name_cont),
      brand_id_eq: params.dig(:q, :brand_id_eq)
    ).result.order(:name).limit(200)

    respond_to do |format|
      format.html { super() }
      format.json { render json: phones.map { |p| { id: p.id, name: p.name } } }
    end
  end
end
