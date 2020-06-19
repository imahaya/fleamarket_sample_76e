$(function(){
  function build_childSelect() {
    let child_select = `
              <select name="post[category_id]" class="child_category_id">
                <option value="">---</option>
              </select>
              `
    return child_select;
  }

  function build_Option(children) {
    let option_html = `
                      <option value=${children.id}>${children.name}</option>
                      `
    return option_html;
  }

  function build_gcSelect() {
    let gc_select = `
              <select name="item[category_id]" class="gc_category_id">
                <option value="">---</option>
              </select>
              `
    return gc_select;
  }

  $(document).on("change", "#category_form", function () {
    let parentValue = $("#category_form").val();
    if (parentValue.length != 0) {
      $.ajax({
        url: '/items/search',
        type: 'GET',
        data: { parent_id: parentValue },
        dataType: 'json'
      })
      .done(function(data) {
        $('.child_category_id').remove();
        $('.gc_category_id').remove();
        let child_select = build_childSelect
        console.log(child_select)
        $("#category_field").append(child_select);
        data.forEach(function(data){
          let option_html = build_Option(data)
          $(".child_category_id").append(option_html);
        })
      })
      .fail (function() {
        alert("エラーです！");
      })
    }else{
      $('.child_category_id').remove();
      $('.gc_category_id').remove();
    }
  });

  $(document).on("change", ".child_category_id", function () {
    let childValue = $(".child_category_id").val();
    if (childValue.length != 0) {
      $.ajax({
        url: '/items/search',
        type: 'GET',
        data: { children_id: childValue },
        dataType: 'json'
      })
        .done(function (gc_data) {
          console.log(gc_data)
          $('.gc_category_id').remove();
          let gc_select = build_gcSelect
          console.log(gc_select)
          $("#category_field").append(gc_select);
          gc_data.forEach(function (gc_d) {
            let option_html = build_Option(gc_d);
            $(".gc_category_id").append(option_html);
          });
        })
        .fail(function () {
          alert("エラーです！");
        })
      }else{
        $('.gc_category_id').remove();
      }
  });
})
