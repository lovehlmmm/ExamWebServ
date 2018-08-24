$(document).ready(function () {
    $('#contact_form').bootstrapValidator({
        fields: {
            id: {
                validators: {
                    notEmpty: {
                        message: 'Vui lòng nhập id'
                    }
                }
            },
            name: {
                validators: {
                    stringLength: {
                        min: 4,
                        message: 'name phải lớn hơn 3 kí tự'
                    },
                    notEmpty: {
                        message: 'Vui lòng nhập name'
                    }
                }
            },
            price: {
                validators: {
                    notEmpty: {
                        message: 'Vui lòng nhập price'
                    }
                }
            },
            quantity: {
                validators: {
                    
                    notEmpty: {
                        message: 'Vui lòng nhập quantity'
                    }
                }
            }
        }

    })
            .on('success.form.bv', function (e) {
                $('#success_message').slideDown({opacity: "show"}, "slow") // Do something ...
                $('#contact_form').data('bootstrapValidator').resetForm();

                // Prevent form submission
                e.preventDefault();

                // Get the form instance
                var $form = $(e.target);

                // Get the BootstrapValidator instance
                var bv = $form.data('bootstrapValidator');

                // Use Ajax to submit form data
                $.post($form.attr('action'), $form.serialize(), function (result) {
                    console.log(result);
                }, 'json');
            });
});