# VoucherifySdk::VouchersApi

All URIs are relative to *https://api.voucherify.io*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_voucher**](VouchersApi.md#delete_voucher) | **DELETE** /v1/vouchers/{code} | Delete Voucher |
| [**disable_voucher**](VouchersApi.md#disable_voucher) | **POST** /v1/vouchers/{code}/disable | Disable Voucher |
| [**enable_voucher**](VouchersApi.md#enable_voucher) | **POST** /v1/vouchers/{code}/enable | Enable Voucher |
| [**export_voucher_transactions**](VouchersApi.md#export_voucher_transactions) | **POST** /v1/vouchers/{code}/transactions/export | Export Voucher Transactions |
| [**get_voucher**](VouchersApi.md#get_voucher) | **GET** /v1/vouchers/{code} | Get Voucher |
| [**import_vouchers_using_csv**](VouchersApi.md#import_vouchers_using_csv) | **POST** /v1/vouchers/importCSV | Import Vouchers using CSV |
| [**list_voucher_transactions**](VouchersApi.md#list_voucher_transactions) | **GET** /v1/vouchers/{code}/transactions | List Voucher Transactions |
| [**list_vouchers**](VouchersApi.md#list_vouchers) | **GET** /v1/vouchers | List Vouchers |
| [**release_validation_session**](VouchersApi.md#release_validation_session) | **DELETE** /v1/vouchers/{code}/sessions/{sessionKey} | Release Validation Session |
| [**update_voucher_balance**](VouchersApi.md#update_voucher_balance) | **POST** /v1/vouchers/{code}/balance | Add or Remove Voucher Balance |


## delete_voucher

> delete_voucher(code, opts)

Delete Voucher

Deletes a voucher. This operation cannot be undone. Additionally, this operation removes any redemptions on the voucher. If the force parameter is set to false or not set at all, the voucher will be moved to the bin.

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
code = 'code_example' # String | A unique **code** that identifies the voucher.
opts = {
  force: true # Boolean | If this flag is set to true, the voucher will be removed permanently. If it is set to false or not set at all, the voucher will be moved to the bin. Going forward, the user will be able to create another voucher with exactly the same code.
}

begin
  # Delete Voucher
  api_instance.delete_voucher(code, opts)
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->delete_voucher: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | A unique **code** that identifies the voucher. |  |
| **force** | **Boolean** | If this flag is set to true, the voucher will be removed permanently. If it is set to false or not set at all, the voucher will be moved to the bin. Going forward, the user will be able to create another voucher with exactly the same code. | [optional] |

### Return type

nil (empty response body)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## disable_voucher

> <VouchersDisableResponseBody> disable_voucher(code)

Disable Voucher

There are various times when youll want to manage a vouchers accessibility. This can be done by two API methods for managing the voucher state - *enable* and *disable*.   ___ This method sets the voucher state to **inactive**. The voucher cannot be redeemed.

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
code = 'code_example' # String | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u.

begin
  # Disable Voucher
  result = api_instance.disable_voucher(code)
  p result
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->disable_voucher: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u. |  |

### Return type

[**VouchersDisableResponseBody**](VouchersDisableResponseBody.md)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## enable_voucher

> <VouchersEnableResponseBody> enable_voucher(code)

Enable Voucher

There are various times when youll want to manage a vouchers accessibility. This can be done by two API methods for managing the voucher state - *enable* and *disable*.   ___ The method sets the voucher state to **active**. The voucher can be redeemed - only if the redemption occurs after the start date and the voucher is not expired.

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
code = 'code_example' # String | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u.

begin
  # Enable Voucher
  result = api_instance.enable_voucher(code)
  p result
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->enable_voucher: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u. |  |

### Return type

[**VouchersEnableResponseBody**](VouchersEnableResponseBody.md)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## export_voucher_transactions

> <VouchersTransactionsExportCreateResponseBody> export_voucher_transactions(code, opts)

Export Voucher Transactions

Export transactions that are associated with credit movements on a gift card or loyalty card.   

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
code = 'GIFT-CARD-1' # String | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u.
opts = {
  vouchers_transactions_export_create_request_body: VoucherifySdk::VouchersTransactionsExportCreateRequestBody.new # VouchersTransactionsExportCreateRequestBody | Specify the parameters for the transaction export.
}

begin
  # Export Voucher Transactions
  result = api_instance.export_voucher_transactions(code, opts)
  p result
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->export_voucher_transactions: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u. |  |
| **vouchers_transactions_export_create_request_body** | [**VouchersTransactionsExportCreateRequestBody**](VouchersTransactionsExportCreateRequestBody.md) | Specify the parameters for the transaction export. | [optional] |

### Return type

[**VouchersTransactionsExportCreateResponseBody**](VouchersTransactionsExportCreateResponseBody.md)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_voucher

> <VouchersGetResponseBody> get_voucher(code)

Get Voucher

Retrieves the voucher with the given code or unique Voucherify ID. You can either pass the voucher ID which was assigned by Voucherify, e.g., v_7HxHkf4VAkMuc8u4lZs78lyRwhRze5UE, or the code of the voucher as the path parameter value, e.g., 7fjWdr.

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
code = 'code_example' # String | A unique **code** that identifies the voucher.

begin
  # Get Voucher
  result = api_instance.get_voucher(code)
  p result
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->get_voucher: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | A unique **code** that identifies the voucher. |  |

### Return type

[**VouchersGetResponseBody**](VouchersGetResponseBody.md)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## import_vouchers_using_csv

> <VouchersImportCsvCreateResponseBody> import_vouchers_using_csv(opts)

Import Vouchers using CSV

Import standalone vouchers into the repository using a CSV file. The CSV file has to include headers in the first line. All properties listed in the file headers that cannot be mapped to standard voucher fields will be added to the metadata object.   You can find an example CSV file [here](https://support.voucherify.io/article/45-import-codes-and-share-them-digitally#coupons). ___  📘 Standard voucher fields mapping  - Go to the import vouchers endpoint to see all standard CSV fields description (body params section).  - Supported CSV file headers: Code,Voucher Type,Value,Discount Type,Category,Start Date,Expiration Date,Redemption Limit,Redeemed Quantity, Redeemed Amount,Active,Additional Info,Custom Metadata Property Name - **Start and expiration dates** need to be provided in compliance with the ISO 8601 norms. For example, 2020-03-11T09:00:00.000Z.       - YYYY-MM-DD     - YYYY-MM-DDTHH     - YYYY-MM-DDTHH:mm     - YYYY-MM-DDTHH:mm:ss     - YYYY-MM-DDTHH:mm:ssZ     - YYYY-MM-DDTHH:mm:ssZ     - YYYY-MM-DDTHH:mm:ss.SSSZ  - Custom code attributes (not supported by-default) need to be added as code **metadata**.  - You **cannot import the same codes** to a single Voucherify Project.  📘 Categories  In the structure representing your data, you can define a category that the voucher belongs to. You can later use the category of a voucher to group and search by specific criteria in the Dashboard and using the List Vouchers endpoint. This API request starts a process that affects Voucherify data in bulk.  In case of small jobs (like bulk update) the request is put into a queue and processed once every other bulk request placed in the queue prior to this request is finished. However, when the job takes a longer time (like vouchers generation) then it is processed in small portions in a round-robin fashion. When there is a list of vouchers generation scheduled, then they will all have the IN_PROGRESS status shortly. This way, small jobs added just after scheduling big jobs of the same type will be processed in a short time window.  The result will return the async ID. You can verify the status of your request via this API request.

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
opts = {
  file: File.new('/path/to/some/file') # File | File path.
}

begin
  # Import Vouchers using CSV
  result = api_instance.import_vouchers_using_csv(opts)
  p result
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->import_vouchers_using_csv: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file** | **File** | File path. | [optional] |

### Return type

[**VouchersImportCsvCreateResponseBody**](VouchersImportCsvCreateResponseBody.md)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## list_voucher_transactions

> <VouchersTransactionsListResponseBody> list_voucher_transactions(code, opts)

List Voucher Transactions

List transactions that are associated with credit movements on a gift card or loyalty card.

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
code = 'code_example' # String | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u.
opts = {
  limit: 56, # Integer | Limits the number of objects to be returned. The limit can range between 1 and 100 items. If no limit is set, it returns 10 items.
  page: 56 # Integer | Which page of results to return. The lowest value is 1.
}

begin
  # List Voucher Transactions
  result = api_instance.list_voucher_transactions(code, opts)
  p result
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->list_voucher_transactions: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u. |  |
| **limit** | **Integer** | Limits the number of objects to be returned. The limit can range between 1 and 100 items. If no limit is set, it returns 10 items. | [optional] |
| **page** | **Integer** | Which page of results to return. The lowest value is 1. | [optional] |

### Return type

[**VouchersTransactionsListResponseBody**](VouchersTransactionsListResponseBody.md)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_vouchers

> <VouchersListResponseBody> list_vouchers(opts)

List Vouchers

Returns a list of vouchers. By default, the vouchers are returned sorted by creation date, with the most recent vouchers appearing first. A maximum of 100 vouchers are returned in the response. When you get a list of vouchers, you can optionally specify query parameters to customize the number of vouchers returned per call using limit, which page of vouchers to return using page, sort the vouchers using the order query parameter and more. This method will return an error when trying to return a limit of more than 100 vouchers. 

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
opts = {
  limit: 56, # Integer | Limits the number of objects to be returned. The limit can range between 1 and 100 items. If no limit is set, it returns 10 items.
  page: 56, # Integer | Which page of results to return. The lowest value is 1.
  category: 'category_example', # String | Limit search results to vouchers within the specified category.
  campaign_id: 'campaign_id_example', # String | Limit search results to vouchers within the specified campaign
  customer: 'customer_example', # String | A tracking identifier of a customer who is the holder of the vouchers. It can be an id generated by Voucherify or the source_id. Remember to use the proper URL escape codes if the source_id contains special characters.
  campaign: 'campaign_example', # String | A unique campaign name, identifies the parent campaign.
  created_at: VoucherifySdk::ParameterCreatedBeforeAfter.new, # ParameterCreatedBeforeAfter | A filter on the list based on the object created_at field. The value is a dictionary with the following options: before, after. A date value must be presented in ISO 8601 format (2016-11-16T14:14:31Z or 2016-11-16). An example: [created_at][before] 2017-09-08T13:52:18.227Z
  updated_at: VoucherifySdk::ParameterUpdatedBeforeAfter.new, # ParameterUpdatedBeforeAfter | A filter on the list based on the object updated_at field. The value is a dictionary with the following options: before, after. A date value must be presented in ISO 8601 format (2016-11-16T14:14:31Z or 2016-11-16). An example: [updated_at][before] 2017-09-08T13:52:18.227Z
  order: VoucherifySdk::ParameterOrderVouchers::CREATED_AT # ParameterOrderVouchers | Sorts the results using one of the filtering options, where the dash - preceding a sorting option means sorting in a descending order.
}

begin
  # List Vouchers
  result = api_instance.list_vouchers(opts)
  p result
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->list_vouchers: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Limits the number of objects to be returned. The limit can range between 1 and 100 items. If no limit is set, it returns 10 items. | [optional] |
| **page** | **Integer** | Which page of results to return. The lowest value is 1. | [optional] |
| **category** | **String** | Limit search results to vouchers within the specified category. | [optional] |
| **campaign_id** | **String** | Limit search results to vouchers within the specified campaign | [optional] |
| **customer** | **String** | A tracking identifier of a customer who is the holder of the vouchers. It can be an id generated by Voucherify or the source_id. Remember to use the proper URL escape codes if the source_id contains special characters. | [optional] |
| **campaign** | **String** | A unique campaign name, identifies the parent campaign. | [optional] |
| **created_at** | [**ParameterCreatedBeforeAfter**](.md) | A filter on the list based on the object created_at field. The value is a dictionary with the following options: before, after. A date value must be presented in ISO 8601 format (2016-11-16T14:14:31Z or 2016-11-16). An example: [created_at][before] 2017-09-08T13:52:18.227Z | [optional] |
| **updated_at** | [**ParameterUpdatedBeforeAfter**](.md) | A filter on the list based on the object updated_at field. The value is a dictionary with the following options: before, after. A date value must be presented in ISO 8601 format (2016-11-16T14:14:31Z or 2016-11-16). An example: [updated_at][before] 2017-09-08T13:52:18.227Z | [optional] |
| **order** | [**ParameterOrderVouchers**](.md) | Sorts the results using one of the filtering options, where the dash - preceding a sorting option means sorting in a descending order. | [optional] |

### Return type

[**VouchersListResponseBody**](VouchersListResponseBody.md)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## release_validation_session

> release_validation_session(code, session_key)

Release Validation Session

Manually release a validation session that has been set up for the voucher. This method undos the actions that are explained in our guide on how a validation session was established, you can read more here.   📘 Release Session using Dashboard  You can also use the Validations Manager in the Dashboard to unlock sessions. [Read more](https://support.voucherify.io/article/16-dashboard-sections#validations).

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
code = 'code_example' # String | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify.
session_key = 'ssn_yQGMTeKBSw8OOuFPwlBEjzGy8d8VA9Ts' # String | A unique session identifier.

begin
  # Release Validation Session
  api_instance.release_validation_session(code, session_key)
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->release_validation_session: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify. |  |
| **session_key** | **String** | A unique session identifier. |  |

### Return type

nil (empty response body)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## update_voucher_balance

> <VouchersBalanceUpdateResponseBody> update_voucher_balance(code, vouchers_balance_update_request_body)

Add or Remove Voucher Balance

Add balance to an existing gift card or loyalty card.

### Examples

```ruby
require 'time'
require 'VoucherifySdk'
# setup authorization
VoucherifySdk.configure do |config|
  # Configure API key authorization: X-App-Id
  config.api_key['X-App-Id'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Id'] = 'Bearer'

  # Configure API key authorization: X-App-Token
  config.api_key['X-App-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-App-Token'] = 'Bearer'
end

api_instance = VoucherifySdk::VouchersApi.new
code = 'code_example' # String | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u.
vouchers_balance_update_request_body = VoucherifySdk::VouchersBalanceUpdateRequestBody.new # VouchersBalanceUpdateRequestBody | Provide the amount to be added to/subtracted from the voucher.

begin
  # Add or Remove Voucher Balance
  result = api_instance.update_voucher_balance(code, vouchers_balance_update_request_body)
  p result
rescue VoucherifySdk::ApiError => e
  puts "Error when calling VouchersApi->update_voucher_balance: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | A **code** that identifies the voucher or a unique voucher ID assigned by Voucherify, i.e. v_TzD19aeNiqGc9LWciMWknyEZT8IW7u4u. |  |
| **vouchers_balance_update_request_body** | [**VouchersBalanceUpdateRequestBody**](VouchersBalanceUpdateRequestBody.md) | Provide the amount to be added to/subtracted from the voucher. |  |

### Return type

[**VouchersBalanceUpdateResponseBody**](VouchersBalanceUpdateResponseBody.md)

### Authorization

[X-App-Id](../README.md#X-App-Id), [X-App-Token](../README.md#X-App-Token)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

