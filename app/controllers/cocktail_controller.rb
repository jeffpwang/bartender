class CocktailController

    def list_all_cocktails
      all_cocktails = Cocktail.return_name_of_cocktails
      new_view= Show.new(all_cocktails)
      new_view.render
    end
    
    def show
    end
    
    def view
    end
    
end
