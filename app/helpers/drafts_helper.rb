module DraftsHelper
  def text_for_button_to_archived_or_not_draft(draft)
    draft.archived ? "Desarquivar" : "Arquivar"
  end
end