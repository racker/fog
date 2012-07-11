__LIB_DIR__ = File.expand_path(File.join(File.dirname(__FILE__), '..'))

$LOAD_PATH.unshift __LIB_DIR__ unless
  $LOAD_PATH.include?(__LIB_DIR__)

# external core dependencies
require 'base64'
require 'cgi'
require 'uri'
require 'excon'
require 'fileutils'
require 'formatador'
require 'openssl'
require 'time'
require 'timeout'

# internal core dependencies
require 'rackspace-fog/core/attributes'
require 'rackspace-fog/core/collection'
require 'rackspace-fog/core/connection'
require 'rackspace-fog/core/credentials'
require 'rackspace-fog/core/deprecation'
require 'rackspace-fog/core/errors'
require 'rackspace-fog/core/hmac'
require 'rackspace-fog/core/json'
require 'rackspace-fog/core/logger'
require 'rackspace-fog/core/model'
require 'rackspace-fog/core/mock'
require 'rackspace-fog/core/parser' # FIXME: would be better to only load when nokogiri is required
require 'rackspace-fog/core/provider'
require 'rackspace-fog/core/service'
require 'rackspace-fog/core/ssh'
require 'rackspace-fog/core/scp'
require 'rackspace-fog/core/time'
require 'rackspace-fog/core/timeout'
require 'rackspace-fog/core/wait_for'
