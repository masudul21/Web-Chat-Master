class Login {
  get email () { return $('input[name="username"]'); }
  get password () { return $('input[name="password"]'); }
  get submit () { return $('button*=login'); }

  login (email, password) {
    this.email.setValue(email);
    this.password.setValue(password);

    this.submit.click();
  }

  isLoggedIn () {
    return browser.getUrl() !== 'http://localhost/web-chat/login.php';
  }
}

module.exports = Login;
