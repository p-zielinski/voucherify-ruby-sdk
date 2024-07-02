# VoucherifySdk::CategoriesGetResponseBody

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique category ID assigned by Voucherify. |  |
| **name** | **String** | Category name. |  |
| **hierarchy** | **Integer** | Category hierarchy. |  |
| **object** | **String** | The type of the object represented by the JSON. This object stores information about the category. | [default to &#39;category&#39;] |
| **created_at** | **Time** | Timestamp representing the date and time when the category was created. The value is shown in the ISO 8601 format. |  |
| **updated_at** | **Time** | Timestamp representing the date and time when the category was updated. The value is shown in the ISO 8601 format. | [optional] |
| **stacking_rules_type** | **String** | The type of the stacking rule eligibility. | [optional] |
