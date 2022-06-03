# spec/features/landing_page_spec.rb

feature 'Landing page' do
  scenario 'Showing name of game' do
    visit('/')
    expect(page).to have_content 'Welcome to the Ultimate Rock Paper Scissors Game!'
  end

  scenario 'Allows user to enter name' do
    sign_in_as_michael
    expect(page).to have_content 'Michael, please choose your choice.'
  end

end