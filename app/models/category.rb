class Category < ActiveHash::Base
  self.data = [
    {id:1, name: '--'},
    {id:2, name: 'テーブル'},
    {id:3, name: '食器棚'},
    {id:4, name: 'テレビボード'},
    {id:5, name: '椅子'},
    {id:6, name: 'ベッド'},
  ]
end