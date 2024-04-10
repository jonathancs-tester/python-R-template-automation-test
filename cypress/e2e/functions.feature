@MOD @SCRIPT @FUNCTIONS @REGRESSION
Feature: Functions packages

	@SANITY
	Scenario Outline: List Projects
		Given insert "admin" credentials and login via "MFA" in "<lib>"
		Then execute "<script>" function with "<expect_value>" expected value via "<lib>"

		@FAAS4I
		Examples:
			| script          | expect_value | lib    |
			| list-projects.R | model_spec   | faas4i |
		@PYFAAS4I
		Examples:
			| script           | expect_value | lib      |
			| list-projects.py | model_spec   | pyfaas4i |

	@SANITY
	Scenario Outline: Download Forecast Pack in Zip format
		Given insert "admin" credentials and login via "MFA" in "<lib>"
		Then execute "<script>" function using "<name>" name and "<path>" path with "<expect_value>" expected value via "<lib>"

		@FAAS4I
		Examples:
			| script             | name   | path              | expect_value  | lib    |
			| download-project.R | test-R | cypress/downloads | File saved to | faas4i |

		@PYFAAS4I
		Examples:
			| script              | name         | path              | expect_value       | lib      |
			| download-project.py | test-python | cypress/downloads | File downloaded to | pyfaas4i |

	@SANITY
	Scenario Outline: Read forecast pack in RDS format
		Given insert "admin" credentials and login via "MFA" in "<lib>"
		Then execute "<script>" function with "<expect_value>" expected value via "<lib>"

		@PYFAAS4I
		Examples:
			| script                 | expect_value | lib      |
			| forecastpack_module.py | Model        | pyfaas4i |
