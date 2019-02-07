$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});

		//// Wait for the DOM to be ready
		//	$(function() {
		//	  // Initialize form validation on the registration form.
		//	  // It has the name attribute "registration"
		//	  $("form[name='Registracion']").validate({
		//		// Specify validation rules
		//		rules: {
		//		  // The key name on the left side is the name attribute
		//		  // of an input field. Validation rules are defined
		//		  // on the right side
		//		  __txtRazonSocial: "required",
		//		  __txtNombreFantasia: "required",
		//		  __txtCuit: "required",
		//		  __txtDireccion: "required",
		//		  __txtTelPrincipal: "required",
		//		  __txtCodPostal: "required",
		//		  __txtUsuario: {
		//			required: true,
		//			// Specify that email should be validated
		//			// by the built-in "email" rule
		//			email: true
		//		  },
		//		  __txtPassword: {
		//			required: true,
		//			minlength: 5
		//		  }
		//		},
		//		// Specify validation error messages
		//		messages: {
		//		  __txtRazonSocial: "Por favor ingrese su razón social",
		//		  __txtNombreFantasia: "Por favor ingrese su nombre de fantasía",
		//		  password: {
		//			required: "Ingrese una contraseña",
		//			minlength: "Su password debe tener mínimo 5 caracteres"
		//		  },
		//		  email: "Por favor ingrese un email válido"
		//		},
		//		// Make sure the form is submitted to the destination defined
		//		// in the "action" attribute of the form when valid
		//		submitHandler: function(form) {
		//		  form.submit();
		//		}
		//	  });
		//	});