RSpec.describe 'Recipe show', type: :feature do
  before(:each) do
    visit user_session_path
    @test1 = User.create(name: 'Test1', email: 'test1@test.com', password: '123456')
    @test2 = User.create(name: 'Test2', email: 'test2@test.com', password: '123456')
    @test3 = User.create(name: 'Test3', email: 'test3@test.com', password: '123456')
    @recipe1 = @test1.recipes.create(name: 'test food1', preparation_time: 2, cooking_time: 5, description: 'How to cook testfood1', public: true)
    @recipe2 = @test2.recipes.create(name: 'test food2', preparation_time: 2, cooking_time: 5, description: 'How to cook testfood2', public: true)
    @recipe3 = @test3.recipes.create(name: 'test food3', preparation_time: 2, cooking_time: 5, description: 'How to cook testfood3', public: true)
    @recipe4 = @test3.recipes.create(name: 'test food4', preparation_time: 2, cooking_time: 5, description: 'How to cook testfood4', public: false)
    fill_in 'Email', with: 'test1@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Public Recipes'
  end
  describe 'tests the public recipe page' do
    it 'shows all the public recipes' do
      expect(page).to have_content('test food1')
      expect(page).to have_content('test food2')
      expect(page).to have_content('test food3')
    end

    it 'does not show non-public recipes' do
      expect(page).not_to have_content('test food4')
    end
    
    it 'sends the user to the correct page when a recipe is clicked' do
      click_link 'test food3'
      expect(page).to have_current_path(recipe_path(@recipe3.id))
    end
  end
end
