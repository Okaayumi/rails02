// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .


document.addEventListener('DOMContentLoaded', function() {
    let searchForm = document.querySelector('.room_search');//.search_formではなく、ransackでroomを検索するroom_searchが付与されていると検証画面から確認とれる
  
    let areas = document.querySelectorAll('.recomend_area');
  
    areas.forEach(area => {
      area.addEventListener('click', function() {
        let areaName = this.getAttribute('data-area');
        // 検索フォーム内の住所検索フィールドを取得
        let searchField = searchForm.querySelector('#q_adress_cont'); //#q_属性名
  
        //都道府県をフォームに自動入力
        searchField.value = areaName;
  
        // 上記を送信
        searchForm.submit();
      });
    });
  });
  