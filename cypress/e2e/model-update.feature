@MOD @SCRIPT @MODELUPDATE @REGRESSION
Feature: Model Update via Scripts

	@SANITY @FAAS4I
	Scenario: Execute model update via R script - Sanity Examples
		Given insert "admin" credentials and login via "MFA" in "faas4i"
		When execute "test-MU01-mod1526.R" model update with "This way of updating a model has been discontinued. For details about the new way to perform updates, see the documentation in" expected value via "faas4i"