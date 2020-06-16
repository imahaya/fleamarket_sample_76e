$(function(){
  // 子のselectタグを追加
  function build_childSelect() {
    let child_select = `
              <select name="post[category_id]" class="child_category_id">
                <option value="">---</option>
              </select>
              `
    return child_select;
  }

  // selectタグにoptionタグを追加
  function build_Option(children) {
    let option_html = `
                      <option value=${children.id}>${children.name}</option>
                      `
    return option_html;
  }

  function build_gcSelect() {
    let gc_select = `
              <select name="item[category_id]" class="gc_category_id">
              </select>
              `
    return gc_select;
  }

  // 親セレクトを変更したらjQueryが発火
  $(document).on("change", "#category_form", function () {
  // $("#category_form").change(function (e) {
  //   e.preventDefault();
    // 選択した親の値を取得
    let parentValue = $("#category_form").val();
    // 初期値("---")以外を選択したらajaxを開始
    if (parentValue.length != 0) {
      $.ajax({
        url: '/items/search',
        type: 'GET',
        // postsコントローラーにparamsをparent_idで送る
        data: { parent_id: parentValue },
        dataType: 'json'
      })
      .done(function(data) {
        $('.child_category_id').remove(); //親カテゴリーが初期値になった時、子以下を削除する
        $('.gc_category_id').remove();
        // console.log(data)
        let child_select = build_childSelect
        $("#category_field").append(child_select);
        data.forEach(function(data){
          let option_html = build_Option(data)
          $(".child_category_id").append(option_html);
        })
      })
      .fail (function() {
        console.log("失敗");
      })
    }else{
      $('.child_category_id').remove(); //親カテゴリーが初期値になった時、子以下を削除する
      $('.gc_category_id').remove();
    }
  });

  // 子セレクトを変更したらjQueryが発火
  // $(".child_category_id").change(function () {
    // e.preventDefault();
  $(document).on("change", ".child_category_id", function () {
    // 選択した子の値を取得
    let childValue = $(".child_category_id").val();
    // 初期値("---")以外を選択したらajax開始
    if (childValue.length != 0) {
      $.ajax({
        url: '/items/search',
        type: 'GET',
        // postsコントローラーにparamsをchildren_idで送る
        data: { children_id: childValue },
        dataType: 'json'
      })
        .done(function (gc_data) {
          $('.gc_category_id').remove();
          // selectタグを生成してビューにappend
          let gc_select = build_gcSelect
          $("#category_field").append(gc_select);
          // jbuilderから取得したデータを1件ずつoptionタグにappend
          gc_data.forEach(function (gc_d) {
            let option_html = build_Option(gc_d);
            $(".gc_category_id").append(option_html);
          });
        })
        .fail(function () {
          alert("gcで通信エラーです！");
        })
      }else{
        $('.gc_category_id').remove();
      }
  });
})
