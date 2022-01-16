class LoginPage < SitePrism::Page

    set_url '/'
    element :open_tab_registration, 'div.tab-register'
    element :input_nama_lengkap, "input[id='register-name']"
    element :input_no_hp, "input[id='register-phone']"
    element :input_alamat_email, "input[id='register-email']"
    element :input_regis_password, "input[id='register-password']"
    element :click_button_register, "div.button"
    element :error_message_email, :xpath, "//div[contains(text(),'Format email yang Anda masukan tidak valid!')]"
end
