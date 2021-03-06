$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][image]"
                    id="item_images_attributes_${num}_image"><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="test1" data-index="${index}">
                    <div class="test2" data-index="${index}">
                      <img class="edit" data-index="${index}" src="${url}" width="100px" height="100px">
                      <div class="js-edit" data-index="${index}">編集</div>
                      <div class="js-remove" data-index="${index}">削除</div>
                    </div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-upload').click(function(){
    $('.js-file').last().trigger("click")
  })
  
  $('#testtest').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#testtest').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
    
    if ($('.test2').length == 5){
      $('#image-upload').css('visibility', 'hidden')
    } 
  });
  
  
  if ($('.test2').length == 5){
    $('#image-upload').css('visibility', 'hidden')
  }
  

  // 編集
  $('#previews').on('click', '.js-edit', function() {
    const id = $(this).attr('data-index').replace(/[^0-9]/g, '');
    $(`#item_images_attributes_${id}_image`).trigger("click");
  });


  // 削除
  $('#previews').on('click', '.js-remove', function() {
    const targetIndex = $(this).attr('data-index').replace(/[^0-9]/g, '');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(`#item_images_attributes_${targetIndex}_image`).remove();
    $(this).parent().remove();
    
    if ($('.test2').length == 4){
      $('#image-upload').css('visibility', 'visible')
    } 
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});