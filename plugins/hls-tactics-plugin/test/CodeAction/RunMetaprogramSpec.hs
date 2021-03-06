{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}

module CodeAction.RunMetaprogramSpec where

import  Utils
import  Test.Hspec
import  Wingman.Types


spec :: Spec
spec = do
  let metaTest l c f =
#if __GLASGOW_HASKELL__ >= 808
        goldenTest RunMetaprogram "" l c f
#else
        pure ()
#endif

#if __GLASGOW_HASKELL__ >= 808
  describe "beginMetaprogram" $ do
    goldenTest BeginMetaprogram ""  1  7 "MetaBegin"
#endif

  describe "golden" $ do
    metaTest  6 11 "MetaMaybeAp"
    metaTest  2 32 "MetaBindOne"
    metaTest  2 32 "MetaBindAll"
    metaTest  2 13 "MetaTry"
    metaTest  2 74 "MetaChoice"

