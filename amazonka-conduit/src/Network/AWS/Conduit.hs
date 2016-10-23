module Network.AWS.Conduit
    (

    ) where

import Control.Monad.Trans.AWS      (AWST)
import Control.Monad.Trans.Resource (ResourceT)

import Data.Conduit (ResumableSource, Source)

import Network.AWS
import Network.AWS.Data.ByteString (ByteString)

import qualified Control.Monad.Trans.AWS as AWST

-- type ResponseBody = ResumableSource (ResourceT IO) ByteString

-- | Send a request, returning the associated response if successful.
send :: (MonadAWS m, AWSRequest a)
     => a
     -> m (Rs a (ResumableSource m ByteString))
send = undefined

-- | Repeatedly send a request, automatically setting markers and
-- paginating over multiple responses while available.
paginate :: (MonadAWS m, AWSPager a)
         => a
         -> Source m (Rs a (ResumableSource m ByteString))
paginate = undefined
