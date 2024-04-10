const { defineConfig } = require("cypress");
const path = require('path')
const fs = require('fs')
const isFirefox = (browser) => browser.family === 'firefox'
const cucumber = require('cypress10-cucumber-preprocessor').default
const dotenv = require('dotenv')

module.exports = defineConfig({
  viewportWidth: 1920,
  viewportHeight: 1080,
  defaultCommandTimeout: 600000,
  videoCompression: false,
  pageLoadTimeout: 600000,
  execTimeout: 600000,
  responseTimeout: 600000,
  video: false,

  e2e: {
    setupNodeEvents(on, config) {
      if(process.env.CHROMEWEBSECURITY == 'false'){
        config.chromeWebSecurity=false
      }
      
      config.env.download_path = process.env.DOWNLOAD_PATH
      config.env.browser= process.env.BROWSER
      config.env.device= process.env.DEVICE
      config.env.feature= process.env.FEATURE
      config.env.TAGS = process.env.TESTTYPE
    
      //Auth0
      config.env.auth_client_id = process.env.AUTH_CLIENT_ID
      config.env.auth_audience = process.env.AUTH_AUDIENCE
      config.env.auth_domain = process.env.AUTH_DOMAIN
      config.env.auth_scope = process.env.AUTH_SCOPE
      
      //User Credentials
      config.env.admin_user = process.env.ADMIN_USER
      config.env.admin_pwd = process.env.ADMIN_PWD
      config.env.admin_otp = process.env.ADMIN_OTP
      config.env.view_user = process.env.VIEW_USER
      config.env.view_pwd = process.env.VIEW_PWD
      config.env.view_otp = process.env.VIEW_OTP
    
      config.baseUrl = process.env.FAAS_BASEURL
    
      on('task', {
        //TODO: Alterar o clear downloads para usar o file (QA-1915)
        createDownloadFolder(dir) {
          console.log('create folder %s', dir)
          if(!fs.existsSync(dir))
            fs.mkdirSync(dir)
          
          return null
        },
    
        findFile(downloadPath) {
          var findFile = true
          var count = 0
          while((findFile) || (count < 1000)){
            if(fs.existsSync(downloadPath) && fs.readdirSync(downloadPath).length){
              var files = fs.readdirSync(downloadPath);
              if (!(files[0].includes("part") || files[0].includes("download"))){
                var downloadedFilename = path.join(downloadPath, files[0]);
                console.log('filename', downloadedFilename)
                findFile = false
                count += 1000
              }
            }
            count++
          }
          return downloadedFilename
        },
        existFile (path) {
          if (fs.existsSync(path)) {
            return true
          }
          else return false
        },
        clearFile (path) {
          fs.rmdirSync(path, { recursive: true })
          
          return null
        },
      })
    
      on('before:browser:launch', (browser, options) => {
        
        if (isFirefox(browser)) {
          const downloadDirectory = path.join(__dirname, '..', 'fixtures/downloads/'+process.env.DEVICE+'/'+browser.name)			
          options.preferences['browser.download.dir'] = downloadDirectory
          options.preferences['browser.download.folderList'] = 2 
          options.preferences['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv,text/xlsx,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
          return options
        }
      })
    
      on('file:preprocessor', cucumber())
      return config
    },
    specPattern: "**/*.feature",
    experimentalWebKitSupport: true,
  },
});
