module BookHelper
  def is_owner? poster_id 
     poster_id == current_user.id
  end
end
