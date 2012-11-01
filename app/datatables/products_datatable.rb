class ProdutosDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Produto.count,
      iTotalDisplayRecords: produto.total_entries,
      aaData: data
    }
  end

private

  def data
    produto.map do |product|
      [
        link_to(product.name, product),
        h(product.category),
        h(product.created_at.strftime("%B %e, %Y")),
        number_to_currency(product.price)
      ]
    end
  end

  def produto
    @produto ||= fetch_produto
  end

  def fetch_produto
    produto = Produto.order("#{sort_column} #{sort_direction}")
    produto = produto.page(page).per_page(per_page)
    if params[:sSearch].present?
      produto = produto.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    produto
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category created_at ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
