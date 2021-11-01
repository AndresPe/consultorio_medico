/**VARIABLES QUE SE VAN A USAR PARA LA TOMA DE DATOS */
var btnAbrirPopup = document.getElementById('btnSuscribirse'),
    overlay = document.getElementById('overlay'),
        popup = document.getElementById('popup'),
        btnCerrarPopup = document.getElementById('btn-cerrar-popup');
/**SE CREA FUNCION PARA EL BOTON ABRIR POPUP */
btnAbrirPopup.addEventListener('click', function(){
    overlay.classList.add('active');/**pone al ovelay en modo activo */
    popup.classList.add('active');/**pone el popup en modo activo */
});
/**SE CREA LA FUNCION PARA EL BOTON CERRAR */
btnCerrarPopup.addEventListener('click', function(){
    overlay.classList.remove('active'); /**quita el modo activo de overlay */
    popup.classList.remove('active');/**quita el modo activo del popup */
});