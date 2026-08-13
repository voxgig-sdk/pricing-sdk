# Pricing SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

PricingUtility.registrar = ->(u) {
  u.clean = PricingUtilities::Clean
  u.done = PricingUtilities::Done
  u.make_error = PricingUtilities::MakeError
  u.feature_add = PricingUtilities::FeatureAdd
  u.feature_hook = PricingUtilities::FeatureHook
  u.feature_init = PricingUtilities::FeatureInit
  u.fetcher = PricingUtilities::Fetcher
  u.make_fetch_def = PricingUtilities::MakeFetchDef
  u.make_context = PricingUtilities::MakeContext
  u.make_options = PricingUtilities::MakeOptions
  u.make_request = PricingUtilities::MakeRequest
  u.make_response = PricingUtilities::MakeResponse
  u.make_result = PricingUtilities::MakeResult
  u.make_point = PricingUtilities::MakePoint
  u.make_spec = PricingUtilities::MakeSpec
  u.make_url = PricingUtilities::MakeUrl
  u.param = PricingUtilities::Param
  u.prepare_auth = PricingUtilities::PrepareAuth
  u.prepare_body = PricingUtilities::PrepareBody
  u.prepare_headers = PricingUtilities::PrepareHeaders
  u.prepare_method = PricingUtilities::PrepareMethod
  u.prepare_params = PricingUtilities::PrepareParams
  u.prepare_path = PricingUtilities::PreparePath
  u.prepare_query = PricingUtilities::PrepareQuery
  u.graphql_body = PricingUtilities::GraphqlBody
  u.graphql_errors = PricingUtilities::GraphqlErrors
  u.result_basic = PricingUtilities::ResultBasic
  u.result_body = PricingUtilities::ResultBody
  u.result_headers = PricingUtilities::ResultHeaders
  u.transform_request = PricingUtilities::TransformRequest
  u.transform_response = PricingUtilities::TransformResponse
}
