({
    calc : function (cmp, event, helper) {
        var numero = cmp.get('v.number');
        var texto = "";
        if (numero > 0 && numero < 100) {
            for (var i = 0; i < numero; i++) {
                texto += i + ", ";
            }
            cmp.set('v.numberTexto', texto);
        } else {
            texto = "Número Inválido";
            cmp.set('v.numberTexto', texto);
        }
    },
    handleClick : function (cmp, event, helper) {
        var buttonstate = cmp.get('v.buttonstate');
        cmp.set('v.buttonstate', !buttonstate);
    }
});