class DevicesController < ApplicationController
  def show
    @device = Device.includes(:phone, :type).find(params[:id])
  end

  def index
    # 1) force page=1 if missing
    if params[:page].blank?
      return redirect_to devices_path(
        page: 1,
        query: params[:query],
        category_id: params[:category_id]
      )
    end

    # 2) stash our paging/filter params for both controller & view
    @page        = params[:page].to_i
    @per_page    = 25
    @query       = params[:query]
    @category_id = params[:category_id]

    # 3) build categories list for the dropdown
    @categories  = Category.order(:name)

    # 4) base scope (eager‑load phone & category)
    scope = Device.includes(:phone, :category)

    # 5) filter by phone name, if given
    if @query.present?
      sq = @query.downcase
      scope = scope.joins(:phone)
                   .where("LOWER(phones.name) LIKE ?", "%#{sq}%")
    end

    # 6) filter by category_id, if given
    if @category_id.present?
      scope = scope.where(category_id: @category_id.to_i)
    end

    # 7) total count for “Showing X of Y”
    @total_devices = scope.count

    # 8) grab just this page of results
    offset = (@page - 1) * @per_page
    @devices = scope
                 .order("phones.name ASC")
                 .limit(@per_page)
                 .offset(offset)
  end
end
