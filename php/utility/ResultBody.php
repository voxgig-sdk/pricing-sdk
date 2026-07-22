<?php
declare(strict_types=1);

// Pricing SDK utility: result_body

class PricingResultBody
{
    public static function call(PricingContext $ctx): ?PricingResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
