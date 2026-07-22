<?php
declare(strict_types=1);

// Pricing SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

PricingUtility::setRegistrar(function (PricingUtility $u): void {
    $u->clean = [PricingClean::class, 'call'];
    $u->done = [PricingDone::class, 'call'];
    $u->make_error = [PricingMakeError::class, 'call'];
    $u->feature_add = [PricingFeatureAdd::class, 'call'];
    $u->feature_hook = [PricingFeatureHook::class, 'call'];
    $u->feature_init = [PricingFeatureInit::class, 'call'];
    $u->fetcher = [PricingFetcher::class, 'call'];
    $u->make_fetch_def = [PricingMakeFetchDef::class, 'call'];
    $u->make_context = [PricingMakeContext::class, 'call'];
    $u->make_options = [PricingMakeOptions::class, 'call'];
    $u->make_request = [PricingMakeRequest::class, 'call'];
    $u->make_response = [PricingMakeResponse::class, 'call'];
    $u->make_result = [PricingMakeResult::class, 'call'];
    $u->make_point = [PricingMakePoint::class, 'call'];
    $u->make_spec = [PricingMakeSpec::class, 'call'];
    $u->make_url = [PricingMakeUrl::class, 'call'];
    $u->param = [PricingParam::class, 'call'];
    $u->prepare_auth = [PricingPrepareAuth::class, 'call'];
    $u->prepare_body = [PricingPrepareBody::class, 'call'];
    $u->prepare_headers = [PricingPrepareHeaders::class, 'call'];
    $u->prepare_method = [PricingPrepareMethod::class, 'call'];
    $u->prepare_params = [PricingPrepareParams::class, 'call'];
    $u->prepare_path = [PricingPreparePath::class, 'call'];
    $u->prepare_query = [PricingPrepareQuery::class, 'call'];
    $u->result_basic = [PricingResultBasic::class, 'call'];
    $u->result_body = [PricingResultBody::class, 'call'];
    $u->result_headers = [PricingResultHeaders::class, 'call'];
    $u->transform_request = [PricingTransformRequest::class, 'call'];
    $u->transform_response = [PricingTransformResponse::class, 'call'];
});
