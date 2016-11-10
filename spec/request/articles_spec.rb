require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  before do
    @article = Article.create(title: 'This is the title', body: 'This is the body')
  end

  describe 'GET /articles/:id' do
    context 'get existing article' do
      before { get "/articles/#{@article.id}" }

      it 'handles existing article' do
        expect(response.status).to eq 200
      end
    end

    context 'get non-existing article' do
      before { get "/articles/xxxx" }

      it 'handles non-existing article' do
        expect(response.status).to eq 302
        expect(flash[:alert]).to eq "The article you are looking for could not be found"
      end
    end

  end
end
