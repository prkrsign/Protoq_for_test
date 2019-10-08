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
              console.log(data)
              console.log($(this))
              $(this).removeClass('none-active-color').addClass('active-color')
            // if ($(this).text() === 'いいね！') {
            //   $(this).text('いいね！を取り消す').removeClass('btn-primary').addClass('btn-secondary');
            // } 
            // else if ($(this).text() === 'いいね！を取り消す') {
            //   $(this).text('いいね！').removeClass('btn-secondary').addClass('btn-primary');
            // }
          })
          // 処理が上手く行かなかったら失敗の旨を伝えるアラートを表示
          .fail((data) => {
            alert('いいね！に失敗しました');
          })
        });
      });
});

