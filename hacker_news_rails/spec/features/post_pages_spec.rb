require 'rails_helper'

describe "adding a post" do
  it "adds a new post" do
    post = Post.create(:title => "The most amazing post", :url => "bbc.co.uk")
    visit posts_path
    expect(page).to have_content "The most amazing post"
  end
  it "visits the posts comments" do
    post = Post.create(:title => "The most amazing post", :url => "bbc.co.uk")
    visit posts_path
    click_on("post-#{post.id}")
    expect(page).to have_content 'Add a comment'
  end
  it "adds a comment to a post" do
    visit posts_path
    click_link 'New'
    fill_in 'Title', :with => 'holla!'
    fill_in 'Url', :with => 'https://www.tenor.co/view/cinnamon-butter-challah-baking-gif-3389010'
    click_button 'Create Post'
    expect(page).to have_content 'holla!'
  end
  it "deletes a current post" do
    post = Post.create(:title => "The most amazing post", :url => "bbc.co.uk")
    visit posts_path
    click_on("post-#{post.id}")
    click_link "Delete post"
    expect(page).should have_no_content('The most amazing post')
  end
end
