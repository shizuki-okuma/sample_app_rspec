# frozen_string_literal: true

require 'rails_helper'
  config.before(:each, type: :system) do
      driven_by :rack_test
    end

describe '投稿のテスト' do
  let!(:list) { create(:list,title:'hoge',body:'body') }
  describe 'トップ画面(top_path)のテスト' do
    before do
      visit top_path
    end
    context '表示の確認' do
      it 'トップ画面(top_path)に「ここはTopページです」が表示されているか' do
       expect(page).to have_field'ここはTopページです'
      end
      it 'top_pathが"/top"であるか' do
        expect(current_path).to eq('/top')
      end
    end
  end

  describe '投稿画面のテスト' do
    before do
      visit new_list_path
    end
    context '表示の確認' do
      it 'new_list_pathが"/lists/new"であるか' do
        expect(current_path).to eq('/lists/new')
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        visit list_path
      end
    end
  end
  
  describe '一覧画面のテスト' do
    before do
      visit lists_path
    end
    context '一覧の表示とリンクの確認' do
      it '一覧表示画面に投稿されたものが表示されているか' do
        expect(page).to have_field '(:list,title:"",body:"")'
      end
    end
  end
  
  describe '詳細画面のテスト' do
    before do
      visit list_path
    end
    context
  end
end