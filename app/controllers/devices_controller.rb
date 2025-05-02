class DevicesController < ApplicationController
  def show
    @device = Device.includes(:phone, :type, :category).find(params[:id])
  end

  def index
    if params[:page].blank?
      return redirect_to devices_path(
        page: 1,
        query: params[:query],
        category_id: params[:category_id],
        brand_id: params[:brand_id]
      )
    end

    @page        = params[:page].to_i
    @per_page    = 25
    @query       = params[:query]
    @category_id = params[:category_id]
    @brand_id    = params[:brand_id]

    @categories  = Category.order(:name)
    @brands      = Brand.order(:name)

    scope = Device.includes(:phone, :category)

    if @query.present?
      q = @query.downcase
      scope = scope.joins(:phone)
                   .where("LOWER(phones.name) LIKE ?", "%#{q}%")
    end

    if @category_id.present?
      scope = scope.where(category_id: @category_id.to_i)
    end

    if @brand_id.present?
      # join through phones to get brand_id
      scope = scope.joins(:phone)
                   .where(phones: { brand_id: @brand_id.to_i })
    end

    @total_devices = scope.count

    offset = (@page - 1) * @per_page
    @devices = scope
                 .order("phones.name ASC")
                 .limit(@per_page)
                 .offset(offset)
  end
end
