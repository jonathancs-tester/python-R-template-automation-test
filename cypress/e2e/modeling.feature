@MOD @SCRIPT @MODELING @REGRESSION
Feature: Modeling via Scripts

	@SANITY @FAAS4I
	Scenario Outline: Execute modeling via R script - Sanity Examples
		Given insert "admin" credentials and login via "MFA" in "faas4i"
		When execute "<test_script>" modeling with "Results will soon be available in your Projects module" "expected value" via "faas4i"

	Examples:
		| test_script   					| 
		| test-ML01-Energia-Sanity.R		|
		| test-ML02-Multiple_Y_Sanity.R		|
		| test-ML06-Lags_demo.R				|

	@FAAS4I
	Scenario Outline: Execute modeling via R script - Regression Examples
		Given insert "admin" credentials and login via "MFA" in "faas4i"
		When execute "<test_script>" modeling with "Results will soon be available in your Projects module" "expected value" via "faas4i"

	Examples:
		| test_script   					| 
		| test-ML23-All-Dataset-Anual.R		|
		| test-ML24-All-Dataset-Bimestral.R	|
		| test-ML25-All-Dataset-Semanal.R	|
		| test-ML26-All-Dataset-Semestral.R	|
		| test-ML27-All-Dataset-Trimestral.R|
		| test-ML28-All-Dataset-Quinzenal.R	|
		| test-ML29-All-Dataset-Mensal.R	|
		| test-ML05-SeasonalAdj.R			|
		| test-ML08-MOD1627.R 				|
		| test-ML09-MOD1621.R 				|
		| test-ML10-MOD1647.R 				|
		| test-ML11-MOD1648.R 				|
		| test-ML12-MOD1683.R 				|
		| test-ML13-MOD1645.R 				|
		| test-ML14-MOD1615.R 				|
		| test-ML15-MOD1510.R 				|
		| test-ML16-All-Dataset-Diario.R	|
		| test-ML17-MOD1828.R				|
		| test-ML18-MOD1827_v1.R			|
		| test-ML19-MOD1827_v2.R			|
		| test-ML20-MOD1777.R				|
		| test-ML21-MOD1779.R				|
		| test-ML22-MOD1896.R				|
		| test-ML30-TS645.R					|
		
	@SANITY @PYFAAS4I
	Scenario Outline: Execute modeling via Python script - Sanity Examples
		Given insert "admin" credentials and login via "MFA" in "pyfaas4i"
		When execute "<test_script>" modeling with "Results will soon be available in your Projects module" "expected value" via "pyfaas4i"

	Examples:
		| test_script   					| 
		| test-ML02-MOD1896.py   			|

	# @TS-25
	# Scenario Outline: Execute modeling without user permission
	# 	Given insert "view" credentials and login via "MFA" in "<script>"
	# 	When execute "<test_script>" modeling with "403" "expected value" via "<script>"

	# @FAAS4I	
	# Examples:
	# 	| script 	| test_script					|
	# 	| faas4i 	| test-ML01-Energia-Sanity.R  	|

	# @PYFAAS4I
	# Examples:
	# 	| script 	| test_script					|
	# 	| pyfaas4i 	| test-ML02-MOD1896.py 			|