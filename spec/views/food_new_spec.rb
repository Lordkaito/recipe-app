RSpec.describe 'Food new', type: :feature do
  before(:each) do
    visit user_session_path
    @test_user = User.create(name: 'Test', email: 'test@test.com', password: '123456')
    @test_food = @test_user.foods.create(name: 'Egg', price: 1, measurement_unit: 'kg')
    @test_recipe = @test_user.recipes.create(name: 'boiled egg', preparation_time: 2, cooking_time: 5,
                                             description: 'Put the egg in boiling water for about 5 minutes, slightly less if you like the yolk underdone', public: true)
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Foods'
    click_link 'Add food'
  end
  describe 'Food new page' do
    it 'Show a form to add a new food' do
      expect(page).to have_content 'Add food'
      expect(page).to have_content 'Food name'
      expect(page).to have_content 'Unit price'
    end

    it 'Has a button to submit the form' do
      expect(page).to have_button 'Create new food'
    end
  end
end
