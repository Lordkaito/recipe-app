RSpec.describe 'Recipe show', type: :feature do
  before(:each) do
    visit user_session_path
    @test1 = User.create(name: 'Test', email: 'test@test.com', password: '123456')
    @food = @test1.foods.create(name: 'Egg', price: 1, measurement_unit: 'un')
    @recipe = @test1.recipes.create(name: 'boiled egg', preparation_time: 2, cooking_time: 5, description: 'Put the egg in boiling water for about 5 minutes, slightly less if you like the yolk underdone', public: true)
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Recipes'
    click_link 'boiled egg'
  end
  describe 'tests the recipe show page' do
    it 'can see the recipe in detail' do
      expect(page).to have_content 'boiled egg'
      expect(page).to have_content 'Preparation time: 2 minutes'
      expect(page).to have_content 'Cooking time: 5 minutes'
      expect(page).to have_content 'Put the egg in boiling water for about 5 minutes, slightly less if you like the yolk underdone'
    end
    it 'can see the button to add new recipe' do
      expect(page).to have_content 'Add food'
    end
    it 'can add a new food' do
      click_link 'Add food'
      select 'Egg', :from => 'recipe_food[food_id]'
      fill_in 'Quantity', with: 1
      click_button 'Submit'
      expect(page).to have_content 'The food has been added.'
    end

    it 'expects the user to be able to remove a food' do
      click_link 'Add food'
      select 'Egg', :from => 'recipe_food[food_id]'
      fill_in 'Quantity', with: 1
      click_button 'Submit'
      click_button 'REMOVE'
      expect(page).not_to have_content '1 un'
      expect(page).to have_content 'Ingredient was successfully deleted.'
    end
  end
end
