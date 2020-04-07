module PostsHelper
  def form_title 
    @post.new_record? ? "Nuevo Post" : "Editar Post"
  end
  def form_submit
    @post.new_record? ? "Crear Post" : "Actualizar Post"
  end
end
