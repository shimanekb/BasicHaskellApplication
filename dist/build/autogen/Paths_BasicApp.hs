module Paths_basicApp (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/brandonshimanek/Library/Haskell/bin"
libdir     = "/Users/brandonshimanek/Library/Haskell/ghc-7.8.3-x86_64/lib/basicApp-0.0.0"
datadir    = "/Users/brandonshimanek/Library/Haskell/share/ghc-7.8.3-x86_64/basicApp-0.0.0"
libexecdir = "/Users/brandonshimanek/Library/Haskell/libexec"
sysconfdir = "/Users/brandonshimanek/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "basicApp_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "basicApp_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "basicApp_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "basicApp_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "basicApp_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
