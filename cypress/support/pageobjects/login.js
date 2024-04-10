/// <reference types="Cypress" />

import loginElements from '../elements/login'
const LoginElements = new loginElements

const {
	Before,
	After,
	Given,
	Then
} = require("cypress10-cucumber-preprocessor/steps");

Before(() => {
	cy.restoreConfig();
	cy.restoreLocalStorage();
});
After(() => {
	cy.saveConfig();
	cy.saveLocalStorage();
});

class loginMOD {

	auth0Login(userType, script) {
		if(userType=='admin'){
			cy.clearLocalStorage().loginAuth0(Cypress.env('admin_user'),Cypress.env('admin_pwd'))
			cy.saveConfig()
		}
		if(userType=='read_project'){
			cy.clearLocalStorage().loginAuth0(Cypress.env('read_project_user'),Cypress.env('read_project_pwd'))
			cy.saveConfig()
		}
		if(userType=='ocb'){
			cy.clearLocalStorage().loginAuth0(Cypress.env('ocb_user'),Cypress.env('ocb_pwd'))
			cy.saveConfig()
		}
		if(userType=='view'){
			cy.clearLocalStorage().loginAuth0(Cypress.env('view_user'),Cypress.env('view_pwd'))
			cy.saveConfig()
		}
		if(userType=='stg'){
			cy.clearLocalStorage().loginAuth0(Cypress.env('stg_user'),Cypress.env('stg_pwd'))
			cy.saveConfig()
		}
		if(userType=='invalid'){
			cy.clearLocalStorage().loginAuth0(Cypress.env('invalid_user'),Cypress.env('invalid_pwd'))
			cy.saveConfig()
		}
		this.sendConfigAuth(script)
	}

	auth0M2MLogin(userType, script) {
		if(userType=='admin'){
			cy.clearLocalStorage().loginM2MAuth0(Cypress.env('admin_client_secret'))
			cy.saveConfig()
		}
		if(userType=='read_project'){
			cy.clearLocalStorage().loginM2MAuth0(Cypress.env('read_project_client_secret'))
			cy.saveConfig()
		}
		if(userType=='ocb'){
			cy.clearLocalStorage().loginM2MAuth0(Cypress.env('ocb_client_secret'))
			cy.saveConfig()
		}
		if(userType=='view'){
			cy.clearLocalStorage().loginM2MAuth0(Cypress.env('view_client_secret'))
			cy.saveConfig()
		}
		if(userType=='stg'){
			cy.clearLocalStorage().loginM2MAuth0(Cypress.env('stg_client_secret'))
			cy.saveConfig()
		}
		if(userType=='invalid'){
			cy.clearLocalStorage().loginM2MAuth0(Cypress.env('invalid_client_secret'))
			cy.saveConfig()
		}
		this.sendConfigAuth(script)
	}

	auth0MFALogin(userType, script) {
		if(userType=='admin'){
			if ((window.localStorage.getItem('client_id') == null) || (window.localStorage.getItem('client_id') != Cypress.env('auth_client_id') 
                || (window.localStorage.getItem('user') != Cypress.env('admin_user')))) {
				cy.session(['admin'], () => {
					cy.clearLocalStorage().loginMFAAuth0(Cypress.env('admin_user'),Cypress.env('admin_pwd'),Cypress.env('admin_otp'))
				});
				if (script != 'UI')
					cy.saveConfig()
			}
		}
		if(userType=='read_project'){
			if ((window.localStorage.getItem('client_id') == null) || (window.localStorage.getItem('client_id') != Cypress.env('auth_client_id') 
                || (window.localStorage.getItem('user') != Cypress.env('read_project_user')))) {
				cy.session(['read_project'], () => {
					cy.clearLocalStorage().loginMFAAuth0(Cypress.env('read_project_user'),Cypress.env('read_project_pwd'),Cypress.env('read_project_otp'))
				});
				if (script != 'UI')
					cy.saveConfig()
			}
		}
		if(userType=='editor'){
			if ((window.localStorage.getItem('client_id') == null) || (window.localStorage.getItem('client_id') != Cypress.env('auth_client_id') 
                || (window.localStorage.getItem('user') != Cypress.env('editor_user')))) {
				cy.session(['editor'], () => {
					cy.clearLocalStorage().loginMFAAuth0(Cypress.env('editor_user'),Cypress.env('editor_pwd'),Cypress.env('editor_otp'))
				});
				if (script != 'UI')
					cy.saveConfig()
			}
		}
		if(userType=='ocb'){
			if ((window.localStorage.getItem('client_id') == null) || (window.localStorage.getItem('client_id') != Cypress.env('auth_client_id') 
                || (window.localStorage.getItem('user') != Cypress.env('ocb_user')))) {
				cy.session(['ocb'], () => {
					cy.clearLocalStorage().loginMFAAuth0(Cypress.env('ocb_user'),Cypress.env('ocb_pwd'),Cypress.env('ocb_otp'))
				});
				if (script != 'UI')
					cy.saveConfig()
			}
		}
		if(userType=='view'){
			if ((window.localStorage.getItem('client_id') == null) || (window.localStorage.getItem('client_id') != Cypress.env('auth_client_id') 
                || (window.localStorage.getItem('user') != Cypress.env('view_user')))) {
				cy.session(['view'], () => {
					cy.clearLocalStorage().loginMFAAuth0(Cypress.env('view_user'),Cypress.env('view_pwd'),Cypress.env('view_otp'))
				});
				if (script != 'UI')
					cy.saveConfig()
			}
		}
		if(userType=='stg'){
			if ((window.localStorage.getItem('client_id') == null) || (window.localStorage.getItem('client_id') != Cypress.env('auth_client_id') 
                || (window.localStorage.getItem('user') != Cypress.env('stg_user')))) {
				cy.session(['stg'], () => {
					cy.clearLocalStorage().loginMFAAuth0(Cypress.env('stg_user'),Cypress.env('stg_pwd'),Cypress.env('stg_otp'))
				});
				if (script != 'UI')
					cy.saveConfig()
			}
		}
		if(userType=='invalid'){
			if ((window.localStorage.getItem('client_id') == null) || (window.localStorage.getItem('client_id') != Cypress.env('auth_client_id') 
                || (window.localStorage.getItem('user') != Cypress.env('invalid_user')))) {
				cy.session(['invalid'], () => {
					cy.clearLocalStorage().loginMFAAuth0(Cypress.env('invalid_user'),Cypress.env('invalid_pwd'),Cypress.env('invalid_otp'))
				});
				if (script != 'UI')
					cy.saveConfig()
			}
		}
		this.sendConfigAuth(script)
	}

	sendConfigAuth(script){
		if (script == 'faas4i')
			cy.exec('R --slave --args '+'cypress/auth-' + Cypress.env('browser') +'-'+ Cypress.env('device') + '/config.json'+' < cypress/support/scripts/faas4i/auth.R').then((result) => {
				cy.log(result.stderr)
			})
		else if (script == 'pyfaas4i')	
			cy.exec('python cypress/support/scripts/pyfaas4i/auth.py '+'cypress/auth-' + Cypress.env('browser') +'-'+ Cypress.env('device') + '/config.json')
	}

	accessMainPage(){
		cy.visit('/')
	}

	accessApplication(application){
		cy.get(LoginElements.logoutButton()).should('be.visible')
		cy.get('[type=button]').contains('Accept cookies').then($accept => {
			if ($accept.is(':visible')) {
				cy.get('[type=button]').contains('Accept cookies').click()
				if(application == 'FaaS')
					cy.get(LoginElements.faasAccessButton()).click()
				else if (application == 'Feature Store'){
					cy.intercept('**api/v1/groups**').as('waitGroups')
					cy.get(LoginElements.featureStoreButton()).click()
				}
				else if (application == '4CastHub Management')
					cy.get(LoginElements.managementAdminButton()).click()
				else if (application == 'Feature Store Admin')
					cy.get(LoginElements.featureStoreAdminButton()).click()
			}
			else{
				if(application == 'FaaS')
					cy.get(LoginElements.faasAccessButton()).click()
				else if (application == 'Feature Store'){
					cy.intercept('**api/v1/groups**').as('waitGroups')
					cy.get(LoginElements.featureStoreButton()).click()
				}
				else if (application == '4CastHub Management')
					cy.get(LoginElements.managementAdminButton()).click()
				else if (application == 'Feature Store Admin')
					cy.get(LoginElements.featureStoreAdminButton()).click()
			}
		});
	}
}
export default loginMOD;
