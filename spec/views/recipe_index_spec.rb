RSpec.describe 'Recipe index', type: :feature do
  before(:each) do
    visit user_session_path
    @test1 = User.create(name: 'Test', email: 'test@test.com', password: '123456')
    @recipe = @test1.recipes.create(name: 'boiled egg', preparation_time: 2, cooking_time: 5, description: 'Put the egg in boiling water for about 5 minutes, slightly less if you like the yolk underdone', public: true)
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Recipes'
  end
  describe 'tests the recipe index page' do
    it 'can see the recipes the user have' do
      expect(page).to have_content 'boiled egg'
    end
    it 'can see the button to add new recipe' do
      expect(page).to have_content 'Add recipe'
    end
    it 'expects the modal to have the correct fields' do
      click_link 'Add recipe'
      expect(page).to have_field 'Name'
      expect(page).to have_field 'Description'
      expect(page).to have_field 'Preparation time'
      expect(page).to have_field 'Cooking time'
      expect(page).to have_button 'Submit'
    end
    it 'expects the user to be able to create a new recipe' do
      click_link 'Add recipe'
      fill_in 'Name', with: 'test food'
      fill_in 'Description', with: 'How to cook test_food'
      fill_in 'Preparation time', with: 2
      fill_in 'Cooking time', with: 3
      click_button 'Submit'
      recipe = Recipe.last
      expect(page).to have_content 'Your recipe has been created.'
      expect(page).to have_current_path(user_recipe_path(@test1.id, recipe.id))
    end

    it 'expects the user to be able to remove a recipe' do
      click_button 'REMOVE'
      expect(page).to have_content 'Recipe was successfully deleted.'
      expect(page).not_to have_content 'boiled egg'
    end
  end
end
