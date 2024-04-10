@MOD @SCRIPT @MODELING @VALIDATE @REGRESSION
Feature: Warnings and Erros

	@SANITY @FAAS4I
	Scenario Outline: Check Warnings validate via R script
		Given insert "admin" credentials and login via "MFA" in "faas4i"
		When execute "<test_script>" modeling with "<expect-result>" "expected value" via "faas4i"

		Examples:
			| test_script                    | expect-result                                                                     |
			| test-ML16-All-Dataset-Diario.R | Warning 006: Missing values in forecast period lead to shorter or no projections. |
			| test-ML16-All-Dataset-Diario.R | Warning 005: No forecast period provided.                                         |
			| error/test-TS1036.R            | Warning 001: Dummies or categorical variables in exclusions.                      |
			| error/test-TS1036.R            | Warning 002: Dummies or categorical variables in golden variables.                |
			| error/test-TS1036.R            | Warning 003: Dummies or categorical variables in lags.                            |

	@SANITY @FAAS4I @TS-1075
	Scenario Outline: Check if not warnings validate via R script
		Given insert "admin" credentials and login via "MFA" in "faas4i"
		When execute "<test_script>" modeling with "<expect-result>" "not expected value" via "faas4i"

		Examples:
			| test_script         | expect-result                                                |
			| error/test-TS1075.R | Warning 001: Dummies or categorical variables in exclusions. |

	@SANITY @FAAS4I @TS-283 @TS-294 @TS-802 @TS-1016
	Scenario Outline: Check Errors validate via R script
		Given insert "admin" credentials and login via "MFA" in "faas4i"
		When execute "<test_script>" modeling with "<expect-result>" "expected value" via "faas4i"

		Examples:
			| test_script                                  | expect-result                                                                     |
			| error/test-ML07-Lags-n-windows-3000.R        | Error 026: Too long period for n_steps + n_windows.                               |
			| error/test-ML07-Lags-repeat-var-exclusion.R  | Error 018: Invalid column names.                                                  |
			| error/test-TS294.R                           | Error 031: Exclusion with only one variable                                       |
			| error/test-ML04-All-Dataset-Sanity.R         | Error 030: Multiple data frequency.                                               |
			| error/test-ML07-Lags.R                       | Error 030: Multiple data frequency.                                               |
			| error/test-ML03-Same_Hdv_2Y.R                | Your request included more than one dependent variable with the following name(s) |
			| error/test-ML01-Energia-Sanity_51caracters.R | Dataset 1 includes at least one variable with name longer than 50 characters.     |

	@SANITY @PYFAAS4I @TS-1016
	Scenario Outline: Execute modeling via Python script - Sanity Examples
		Given insert "admin" credentials and login via "MFA" in "pyfaas4i"
		When execute "<test_script>" modeling with "<expect-result>" "expected value" via "pyfaas4i"

		Examples:
			| test_script                          | expect-result                                                                                                                               |
			| error/test-ts294.py                  | Error 031: Exclusion with only one variable                                                                                                 |
			| error/test-ML01-lags-warning.py      | Error 030: Multiple data frequency.                                                                                                         |
			| error/test-ML02-error-51caracters.py | KeyError: 'At least one variable name longer than 50 characters found in dataframe(s): Consumo_de_Energia_Centro_oeste_Consumo_de_Energia_' |