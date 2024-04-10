/* global Given, Then, When */

import utils from '../pageobjects/utils'
const Utils= new utils

When("execute {string} modeling with {string} {string} via {string}", (scriptName, value, expect, lib) => {
	Utils.executeModeling(scriptName,value,expect,lib)
})

When("execute {string} model update with {string} expected value via {string}", (scriptName, expect, lib) => {
	Utils.executeModelUpdate(scriptName,expect,lib)
})
