module ContactsHelper
  
  def choose_new_or_edit_c
    if action_name == 'new' || action_name == 'confirm'
      confirm_contacts_path
    elsif action_name == 'edit'
      contact_path
    end
  end
    
end