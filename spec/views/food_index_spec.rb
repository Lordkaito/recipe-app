RSpec.describe 'Food index', type: :feature do
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
  end
  describe 'Food index page' do
    it 'Shows a table with all food for user' do
      expect(page).to have_content @test_food.name
      expect(page).to have_content @test_food.price
      expect(page).to have_content @test_food.measurement_unit
    end
    it 'Shows a button to add new food' do
      expect(page).to have_content 'Add food'
    end

    it 'Can click on Add food button' do
      click_link 'Add food'
      expect(page).to have_content 'Add food'
    end

    it 'Should be able to remove food' do
      expect(page).to have_content 'Destroy'
      click_button 'Destroy'
      expect(page).to have_content 'Food was successfully deleted.'
    end
  end
end
