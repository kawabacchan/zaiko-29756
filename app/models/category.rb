class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'テーブル' },
    { id: 3, name: '椅子' },
    { id: 4, name: '食器棚' },
    { id: 5, name: 'テレビボード' },
    { id: 6, name: 'ソファ' },
    { id: 7, name: 'ベッド' }
  ]
end
