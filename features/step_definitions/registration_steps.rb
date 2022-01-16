Given 'user access to main page' do

    @app.home_page.load
    byebug
    sleep(5)
end

When 'user open registration' do

    @app.home_page.open_registration.click
    sleep(5)
end

When 'user fill registration with {string}' do |parameter|
    @app.login_page.open_tab_registration.click
    sleep(5)
    @app.login_page.input_nama_lengkap.set 'Asep suasep'
    sleep(5)
    @app.login_page.input_no_hp.set '085780301994'
    sleep(5)
    if parameter.eql? "invalid email"
        @app.login_page.input_alamat_email.set "arief#{rand(1..50)}@gmail"
    else
        @app.login_page.input_alamat_email.set "arief#{rand(1..50)}@gmail.com"
    end
    sleep(5)
    @app.login_page.input_regis_password.set 'arief'
    sleep(5)
    @app.login_page.click_button_register.click
    sleep(5)
end

Then 'user success registration' do

    expect(@app.success_registration.has_checklist_success?).to be true

end

Then 'user failed registration' do

    expect(@app.login_page.has_error_message_email?).to be true
end
