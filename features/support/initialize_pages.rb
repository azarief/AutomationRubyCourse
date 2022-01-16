class InitializePages
    def home_page
        @home_page ||= HomePage.new
    end
    def login_page
        @login_page ||= LoginPage.new
    end
    def success_registration
        @success_registration ||= SuccessRegistration.new
    end
end 