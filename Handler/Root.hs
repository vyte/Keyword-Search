{-# LANGUAGE TemplateHaskell, QuasiQuotes, OverloadedStrings #-}
module Handler.Root where

import FortuneSearch
import StaticFiles

-- This is a handler function for the GET request method on the RootR
-- resource pattern. All of your resource patterns are defined in
-- FortuneSearch.hs; look for the line beginning with mkYesodData.
--
-- The majority of the code you will write in Yesod lives in these handler
-- functions. You can spread them across multiple files if you are so
-- inclined, or create a single monolithic file.
getRootR :: Handler RepHtml
getRootR = do
    defaultLayout $ do
        h2id <- lift newIdent
        addScriptRemote "https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"
        addScriptRemote "https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"
        addStylesheetRemote "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/ui-darkness/jquery-ui.css"
        setTitle "KeywordSearch homepage"
        addWidget $(widgetFile "homepage")