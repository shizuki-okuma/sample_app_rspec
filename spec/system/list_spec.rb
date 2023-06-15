# frozen_string_literal: true

require 'rails_helper'
  config.before(:each, type: :system) do
      driven_by :rack_test
    end

describe '投稿のテスト' do
  let!(:list) { create(:list,title:'hoge',body:'body') }
  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
  end
end