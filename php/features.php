<?php
declare(strict_types=1);

// Pricing SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class PricingFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new PricingBaseFeature();
            case "test":
                return new PricingTestFeature();
            default:
                return new PricingBaseFeature();
        }
    }
}
