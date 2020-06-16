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

  // 親セレクトを変更したらjQueryが発火する
  $("#category_form").change(function (e) {
    e.preventDefault();
    // 選択した親の値を取得する
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
      });
    }
  });

  // $("#category_form").change(function () {
  //   $.ajax({
  //     url: '/posts/search',
  //     type: 'GET',
  //     // postsコントローラーにparamsをchildren_idで送る
  //     data: { child_id: childValue },
  //     dataType: 'json'
  //   })
  // .done(function (data) {
  //   let child_select = build_childSelect
  //   $("#category_field").append(child_select);
  //   data.forEach(function (d) {
  //     let option_html = build_Option(d)
  //     $(".child_category_id").append(option_html);
  //   })
  // })
  // .fail(function () {
  //   alert("通信エラーです！");
  // })
  // })
})
