<?php
declare(strict_types=1);

// Pricing SDK base feature

class PricingBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(PricingContext $ctx, array $options): void {}
    public function PostConstruct(PricingContext $ctx): void {}
    public function PostConstructEntity(PricingContext $ctx): void {}
    public function SetData(PricingContext $ctx): void {}
    public function GetData(PricingContext $ctx): void {}
    public function GetMatch(PricingContext $ctx): void {}
    public function SetMatch(PricingContext $ctx): void {}
    public function PrePoint(PricingContext $ctx): void {}
    public function PreSpec(PricingContext $ctx): void {}
    public function PreRequest(PricingContext $ctx): void {}
    public function PreResponse(PricingContext $ctx): void {}
    public function PreResult(PricingContext $ctx): void {}
    public function PreDone(PricingContext $ctx): void {}
    public function PreUnexpected(PricingContext $ctx): void {}
}
