$(document).on('turbolinks:load', function(){


    $(function(){
        // id="link-mark"の箇所(いいねボタン)をクリックしたら
        $('.heart').on('click', function(){
          // 非同期でlikes#createに処理を送信＋その時に店舗情報(shop_id)を渡す
          $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
            }
          });
          
          $.ajax({
            url: '/likes',
            type: 'POST',
            data: {question_id: $(this).attr('data-id')}
          })
          // 処理が上手く行ったらボタンを切り替えて
          .done((data) => {
              id = $(this).attr('data-id')
              value = $(this).attr('class')
              element = value.match('active-color|none-active-color');
              console.log($('.count'))
              
              if (element[0] === 'active-color' ){
                $(this).removeClass('active-color').addClass('none-active-color')
                $("[data-id={$id}]").css("color","red")
              }
              else if (element[0] === 'none-active-color'){
                $(this).removeClass('none-active-color').addClass('active-color')
              }
          })
          // 処理が上手く行かなかったら失敗の旨を伝えるアラートを表示
          .fail((data) => {
            alert('いいね！に失敗しました');
          })
        });
      });
});

