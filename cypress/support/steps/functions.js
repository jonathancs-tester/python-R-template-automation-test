/* global Given, Then, When */

import utils from '../pageobjects/utils'
const Utils= new utils

When("execute {string} function with {string} expected value via {string}", (script, expect, lib) => {
	Utils.listProjects(script,expect,lib)	
})

When("execute {string} function using {string} name and {string} path with {string} expected value via {string}", (script, name, path, expect, lib) => {
	Utils.downloadzip(script, name, path, expect, lib)
})
