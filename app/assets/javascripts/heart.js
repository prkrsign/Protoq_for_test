$(document).on('turbolinks:load', function(){


        $(document).on('click', '#heart.none-active-color', function(){
          $('#heart').removeClass('none-active-color')
          $('#heart').addClass('active-color')
        });

        $(document).on('click', '#heart.active-color', function(){
            console.log('おしたよ')
            $('#heart').removeClass('active-color')
            $('#heart').addClass('none-active-color')
        });

});

