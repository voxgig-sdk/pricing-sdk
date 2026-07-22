<?php
declare(strict_types=1);

// Pricing SDK utility: result_headers

class PricingResultHeaders
{
    public static function call(PricingContext $ctx): ?PricingResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
