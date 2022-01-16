class HomePage < SitePrism::Page

    set_url '/'
    element :open_registration, 'div.register-and-login-button'
    elements :card_list_kelas, "div.card-title span"
end