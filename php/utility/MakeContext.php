<?php
declare(strict_types=1);

// Pricing SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class PricingMakeContext
{
    public static function call(array $ctxmap, ?PricingContext $basectx): PricingContext
    {
        return new PricingContext($ctxmap, $basectx);
    }
}
