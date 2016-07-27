// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require lobibox
//= require lobibox/notifications
//= require turbolinks
//= require jquery.modal
//= require jquery_ujs
//= require retina.min
//= require script
//= require bxslider
//= require foundation
//= require dataTables/jquery.dataTables
//= require jquery.easing.1.3
//= require highcharts
//= require highcharts/modules/data
//= require highcharts/modules/offline-exporting
//= require highcharts/modules/exporting
//= require_tree .

$(function () {
    $(document).foundation();
});
$(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true,
        controls: false
    });
});

$(document).ready(function () {
    $('.bxsliderMenu').bxSlider({
        auto: true,
        slidePadding: 0
    });
});


function validar() {
    //obteniendo el valor que se puso en campo text del formulario
    var piece = document.getElementById("piece").value;
    var pricePie = document.getElementById("pricePieces").value;
    var price = document.getElementById("price").value;
    //la condición
    if (piece.length == 0 || pricePie === "" || price.length == 0) {
        Lobibox.notify('error', {
            size: 'mini',
            rounded: true,
            delayIndicator: true,
            msg: '¡ERROR!, Ningún campo debe estar vacio.'
        });
        $('#piece').addClass('red');
        $('#pricePieces').addClass('red');
        $('#price').addClass('red');
        return false;
    }
    Lobibox.notify('success', {
        size: 'mini',
        rounded: true,
        delayIndicator: true,
        msg: '¡COMPLETO!, Se ha registrado exitosamente.'
    });
    return true;
}

function validarCategory() {
    //obteniendo el valor que se puso en campo text del formulario
    var category = document.getElementById("category").value;

    //la condición
    if (category.length == 0) {
        Lobibox.notify('error', {
            size: 'mini',
            rounded: true,
            delayIndicator: true,
            msg: '¡ERROR!, Ningún campo debe estar vacio.'
        });
        $('#category').addClass('red');
        return false;
    }
    Lobibox.notify('success', {
        size: 'mini',
        rounded: true,
        delayIndicator: true,
        msg: '¡COMPLETO!, Se ha registrado exitosamente.'
    });
    return true;
}

function validarMatter() {
    //obteniendo el valor que se puso en campo text del formulario
    var matter = document.getElementById("matter").value;
    var priceMatter = document.getElementById("priceMatter").value;
    var qtyMatter = document.getElementById("qtyMatter").value;
    //la condición
    if (matter.length == 0 || priceMatter.length==0 || qtyMatter === "") {
        Lobibox.notify('error', {
            size: 'mini',
            rounded: true,
            delayIndicator: true,
            msg: '¡ERROR!, Ningún campo debe estar vacio.'
        });
        $('#matter').addClass('red');
        $('#priceMatter').addClass('red');
        $('#qtyMatter').addClass('red');
        return false;
    }
    Lobibox.notify('success', {
        size: 'mini',
        rounded: true,
        delayIndicator: true,
        msg: '¡COMPLETO!, Se ha registrado exitosamente.'
    });
    return true;
}

function validarProvider() {
    //obteniendo el valor que se puso en campo text del formulario
    var text = document.getElementById("text").value;
    var text1 = document.getElementById("text1").value;
    var text2 = document.getElementById("text2").value;
    var text3 = document.getElementById("text3").value;
    var text5 = document.getElementById("text5").value;

    //la condición
    if (text.length == 0 || text1.length == 0 || text2.length == 0 || text3.length == 0 || text5.length == 0) {
        Lobibox.notify('error', {
            size: 'mini',
            rounded: true,
            delayIndicator: true,
            msg: '¡ERROR!, Ningún campo debe estar vacio.'
        });
        $('#text').addClass('red');
        $('#text1').addClass('red');
        $('#text2').addClass('red');
        $('#text3').addClass('red');
        $('#text5').addClass('red');

        return false;
    }
    Lobibox.notify('success', {
        size: 'mini',
        rounded: true,
        delayIndicator: true,
        msg: '¡COMPLETO!, Se ha registrado exitosamente.'
    });
    return true;
}

function soloNum(e) {
    var key = window.Event ? e.which : e.keyCode
    return (key >= 48 && key <= 57)
}
