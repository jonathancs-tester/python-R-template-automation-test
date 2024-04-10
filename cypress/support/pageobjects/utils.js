
class utils {

	executeModeling(scriptName, expectValue, expectRule, scriptType) {
		if(scriptType=='faas4i'){
			cy.exec('R --slave < cypress/support/scripts/faas4i/modeling/'+scriptName,{failOnNonZeroExit: false}).then((result) => {
				cy.log(result.stderr)
				cy.log(result.stdout)
				cy.wrap(result).as('result')
			})
			cy.get('@result').then(result => {
				if (expectValue.includes('Expired')){
					expect(result.stderr).to.contain(expectValue)
				}else{
					if(expectRule.includes('not expected value'))
						expect(result.stderr).to.not.contain(expectValue)
					else
						expect(result.stderr).to.contain(expectValue)
				}
			})
		} else if(scriptType=='pyfaas4i'){
			cy.exec('python cypress/support/scripts/pyfaas4i/modeling/'+scriptName,{failOnNonZeroExit: false}).then((result) => {
				cy.log(result.stderr)
				cy.log(result.stdout)
				cy.wrap(result).as('result')
			})
			cy.get('@result').then(result => {
				if ((expectValue.includes('Expired') || (expectValue.includes('KeyError')))){
					expect(result.stderr).to.contain(expectValue)
				}else{
					expect(result.stdout).to.contain(expectValue)
				}	
			})
		}
	}

	executeModelUpdate(scriptName, expectValue, scriptType) {		
		if(scriptType=='faas4i'){
			cy.exec('R --slave < cypress/support/scripts/faas4i/model_update/'+scriptName,{failOnNonZeroExit: false}).then((result) => {
				cy.log(result.stderr)
				cy.log(result.stdout)
				cy.wrap(result).as('result')
			})
			cy.get('@result').then(result => {
				if (expectValue.includes('Expired')){
					expect(result.stderr).to.contain(expectValue)
				}else{
					expect(result.stderr).to.contain(expectValue)
				}							
			})
		} else if(scriptType=='pyfaas4i'){
			cy.exec('python cypress/support/scripts/pyfaas4i/model_update/'+scriptName,{failOnNonZeroExit: false}, {timeout:160000}).then((result) => {
				cy.log(result.stderr)
				cy.log(result.stdout)
				cy.wrap(result).as('result')
			})
			cy.get('@result').then(result => {
				if ((expectValue.includes('Expired') || (expectValue.includes('KeyError')))){
					expect(result.stderr).to.contain(expectValue)
				}else{
					expect(result.stdout).to.contain(expectValue)
				}							
			})
		}
	}

	listProjects(scriptName, expectValue, scriptType) {
		if(scriptType=='faas4i'){
			cy.exec('R --slave < cypress/support/scripts/faas4i/functions/'+scriptName,{failOnNonZeroExit: false}).then((result) => {
				cy.log(result.stderr)
				cy.log(result.stdout)
				cy.wrap(result).as('result')
			})
			cy.get('@result').then(result => {
				expect(result.stdout).to.contain(expectValue)
			})
		} else if(scriptType=='pyfaas4i'){
			cy.exec('python cypress/support/scripts/pyfaas4i/functions/'+scriptName+' '+  expectValue,{failOnNonZeroExit: false}).then((result) => {
				cy.log(result.stderr)
				cy.log(result.stdout)
				cy.wrap(result).as('result')
			})
			cy.get('@result').then(result => {
				expect(result.stdout).to.contain(expectValue)
			})
		}
	}

	downloadzip(scriptName, name, path, expectValue, scriptType) {
		if(scriptType=='faas4i'){
			cy.exec('R --slave --args '+ path +' '+ name +' < cypress/support/scripts/faas4i/functions/'+scriptName,{failOnNonZeroExit: false}).then((result) => {
				cy.log(result.stderr)
				cy.log(result.stdout)
				cy.wrap(result).as('result')
			})
			cy.get('@result').then(result => {
				expect(result.stderr).to.contain(expectValue)
			})
		} else if(scriptType=='pyfaas4i'){
			cy.exec('python cypress/support/scripts/pyfaas4i/functions/'+scriptName+ ' '+  path +' '+ name,{failOnNonZeroExit: false}).then((result) => {
				cy.log(result.stderr)
				cy.log(result.stdout)
				cy.wrap(result).as('result')
			})
			cy.get('@result').then(result => {
				expect(result.stdout).to.contain(expectValue)
			})
		}
	}

	clickSlider(element,rcSliderElement,step) {
		cy.get(element).should('be.visible').then($initialSlider => {
			cy.get($initialSlider).trigger("mousedown", { button: 0 });
			cy.get(rcSliderElement).should('be.visible').then($endSlider => {
				if($endSlider.length > 1)
					cy.get($endSlider.eq(step-1)).trigger("mousemove");
			})
		})
		cy.get(element).trigger("mouseup", { button: 0 });
	}
}
export default utils;
