/* global Given, Then, When */

import loginMOD from '../pageobjects/login'
const LoginMOD= new loginMOD

Given("insert {string} credentials and login via {string} in {string}", (userType, loginMode, script) => {
	if (loginMode == 'API') {
		LoginMOD.auth0Login(userType, script);
	}

	else if (loginMode == 'MFA') {
		LoginMOD.auth0MFALogin(userType, script);
	}

	else if (loginMode == 'M2M') {
		LoginMOD.auth0M2MLogin(userType, script);
	}	
})

Given("access main page", () => {
	LoginMOD.accessMainPage();
})

And("access {string} application", (application) => {
	LoginMOD.accessApplication(application);
})