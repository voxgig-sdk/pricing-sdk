package core

type PricingError struct {
	IsPricingError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewPricingError(code string, msg string, ctx *Context) *PricingError {
	return &PricingError{
		IsPricingError: true,
		Sdk:              "Pricing",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *PricingError) Error() string {
	return e.Msg
}
