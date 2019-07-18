# NAME

DaDaPushClient::Role - a Moose role for the DaDaPush Public API

DaDaPush: Real-time Notifications App 

Send real-time notifications through our API without coding and maintaining your own app for iOS or Android devices.

# VERSION

Automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v1
- Package version: 1.0.0
- Build package: org.openapitools.codegen.languages.PerlClientCodegen
For more information, please visit [https://www.dadapush.com](https://www.dadapush.com)

## A note on Moose

This role is the only component of the library that uses Moose. See
DaDaPushClient::ApiFactory for non-Moosey usage.

# SYNOPSIS

The Perl Generator in the OpenAPI Generator project builds a library of Perl modules to interact with
a web service defined by a OpenAPI Specification. See below for how to build the
library.

This module provides an interface to the generated library. All the classes,
objects, and methods (well, not quite \*all\*, see below) are flattened into this
role.

        package MyApp;
        use Moose;
        with 'DaDaPushClient::Role';

        package main;

        my $api = MyApp->new({ tokens => $tokens });

        my $pet = $api->get_pet_by_id(pet_id => $pet_id);


## Structure of the library

The library consists of a set of API classes, one for each endpoint. These APIs
implement the method calls available on each endpoint.

Additionally, there is a set of "object" classes, which represent the objects
returned by and sent to the methods on the endpoints.

An API factory class is provided, which builds instances of each endpoint API.

This Moose role flattens all the methods from the endpoint APIs onto the consuming
class. It also provides methods to retrieve the endpoint API objects, and the API
factory object, should you need it.

For documentation of all these methods, see AUTOMATIC DOCUMENTATION below.

## Configuring authentication

In the normal case, the OpenAPI Spec will describe what parameters are
required and where to put them. You just need to supply the tokens.

    my $tokens = {
        # basic
        username => $username,
        password => $password,

        # oauth
        access_token => $oauth_token,

        # keys
        $some_key => { token => $token,
                       prefix => $prefix,
                       in => $in,             # 'head||query',
                       },

        $another => { token => $token,
                      prefix => $prefix,
                      in => $in,              # 'head||query',
                      },
        ...,

        };

        my $api = MyApp->new({ tokens => $tokens });

Note these are all optional, as are `prefix` and `in`, and depend on the API
you are accessing. Usually `prefix` and `in` will be determined by the code generator from
the spec and you will not need to set them at run time. If not, `in` will
default to 'head' and `prefix` to the empty string.

The tokens will be placed in a L<DaDaPushClient::Configuration> instance
as follows, but you don't need to know about this.

- `$cfg->{username}`

    String. The username for basic auth.

- `$cfg->{password}`

    String. The password for basic auth.

- `$cfg->{api_key}`

    Hashref. Keyed on the name of each key (there can be multiple tokens).

            $cfg->{api_key} = {
                    secretKey => 'aaaabbbbccccdddd',
                    anotherKey => '1111222233334444',
                    };

- `$cfg->{api_key_prefix}`

    Hashref. Keyed on the name of each key (there can be multiple tokens). Note not
    all api keys require a prefix.

            $cfg->{api_key_prefix} = {
                    secretKey => 'string',
                    anotherKey => 'same or some other string',
                    };

- `$cfg->{access_token}`

    String. The OAuth access token.

# METHODS

## `base_url`

The generated code has the `base_url` already set as a default value. This method
returns the current value of `base_url`.

## `api_factory`

Returns an API factory object. You probably won't need to call this directly.

        $self->api_factory('Pet'); # returns a DaDaPushClient::PetApi instance

        $self->pet_api;            # the same

# MISSING METHODS

Most of the methods on the API are delegated to individual endpoint API objects
(e.g. Pet API, Store API, User API etc). Where different endpoint APIs use the
same method name (e.g. `new()`), these methods can't be delegated. So you need
to call `$api->pet_api->new()`.

In principle, every API is susceptible to the presence of a few, random, undelegatable
method names. In practice, because of the way method names are constructed, it's
unlikely in general that any methods will be undelegatable, except for:

        new()
        class_documentation()
        method_documentation()

To call these methods, you need to get a handle on the relevant object, either
by calling `$api->foo_api` or by retrieving an object, e.g.
`$api->get_pet_by_id(pet_id => $pet_id)`. They are class methods, so
you could also call them on class names.

# BUILDING YOUR LIBRARY

See the homepage `https://openapi-generator.tech` for full details.
But briefly, clone the git repository, build the codegen codebase, set up your build
config file, then run the API build script. You will need git, Java 7 or 8 and Apache
maven 3.0.3 or better already installed.

The config file should specify the project name for the generated library:

        {"moduleName":"WWW::MyProjectName"}

Your library files will be built under `WWW::MyProjectName`.

          $ git clone https://github.com/openapitools/openapi-generator
          $ cd openapi-generator
          $ mvn package
          $ java -jar modules/openapi-generator-cli/target/openapi-generator-cli.jar generate \
    -i [URL or file path to JSON OpenAPI API spec] \
    -g perl \
    -c /path/to/config/file.json \
    -o /path/to/output/folder

Bang, all done. Run the `autodoc` script in the `bin` directory to see the API
you just built.

# AUTOMATIC DOCUMENTATION

You can print out a summary of the generated API by running the included
`autodoc` script in the `bin` directory of your generated library. A few
output formats are supported:

          Usage: autodoc [OPTION]

    -w           wide format (default)
    -n           narrow format
    -p           POD format
    -H           HTML format
    -m           Markdown format
    -h           print this help message
    -c           your application class


The `-c` option allows you to load and inspect your own application. A dummy
namespace is used if you don't supply your own class.

# DOCUMENTATION FROM THE OpenAPI Spec

Additional documentation for each class and method may be provided by the OpenAPI
spec. If so, this is available via the `class_documentation()` and
`method_documentation()` methods on each generated object class, and the
`method_documentation()` method on the endpoint API classes:

        my $cmdoc = $api->pet_api->method_documentation->{$method_name};

        my $odoc = $api->get_pet_by_id->(pet_id => $pet_id)->class_documentation;
        my $omdoc = $api->get_pet_by_id->(pet_id => $pet_id)->method_documentation->{method_name};


Each of these calls returns a hashref with various useful pieces of information.

# LOAD THE MODULES

To load the API packages:
```perl
use DaDaPushClient::DaDaPushMessageApi;

```

To load the models:
```perl
use DaDaPushClient::Object::Action;
use DaDaPushClient::Object::MessageObject;
use DaDaPushClient::Object::MessagePushRequest;
use DaDaPushClient::Object::MessagePushResponse;
use DaDaPushClient::Object::PageResponseOfMessageObject;
use DaDaPushClient::Object::Result;
use DaDaPushClient::Object::ResultOfMessageObject;
use DaDaPushClient::Object::ResultOfMessagePushResponse;
use DaDaPushClient::Object::ResultOfPageResponseOfMessageObject;

````

# GETTING STARTED
Put the Perl SDK under the 'lib' folder in your project directory, then run the following
```perl
#!/usr/bin/perl
use lib 'lib';
use strict;
use warnings;
# load the API package
use DaDaPushClient::DaDaPushMessageApi;

# load the models
use DaDaPushClient::Object::Action;
use DaDaPushClient::Object::MessageObject;
use DaDaPushClient::Object::MessagePushRequest;
use DaDaPushClient::Object::MessagePushResponse;
use DaDaPushClient::Object::PageResponseOfMessageObject;
use DaDaPushClient::Object::Result;
use DaDaPushClient::Object::ResultOfMessageObject;
use DaDaPushClient::Object::ResultOfMessagePushResponse;
use DaDaPushClient::Object::ResultOfPageResponseOfMessageObject;

# for displaying the API response data
use Data::Dumper;
use DaDaPushClient::;

my $api_instance = DaDaPushClient::->new(
);

my $body = DaDaPushClient::Object::MessagePushRequest->new(); # MessagePushRequest | body
my $x_channel_token = "x_channel_token_example"; # string | see: https://www.dadapush.com/channel/list

eval {
    my $result = $api_instance->create_message(body => $body, x_channel_token => $x_channel_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DaDaPushMessageApi->create_message: $@\n";
}

```

# DOCUMENTATION FOR API ENDPOINTS

All URIs are relative to *https://www.dadapush.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DaDaPushMessageApi* | [**create_message**](docs/DaDaPushMessageApi.md#create_message) | **POST** /api/v1/message | push Message to a Channel
*DaDaPushMessageApi* | [**delete_message**](docs/DaDaPushMessageApi.md#delete_message) | **DELETE** /api/v1/message/{messageId} | delete a Channel Message
*DaDaPushMessageApi* | [**get_message**](docs/DaDaPushMessageApi.md#get_message) | **GET** /api/v1/message/{messageId} | get a Channel Message
*DaDaPushMessageApi* | [**get_messages**](docs/DaDaPushMessageApi.md#get_messages) | **GET** /api/v1/messages | get Message List


# DOCUMENTATION FOR MODELS
 - [DaDaPushClient::Object::Action](docs/Action.md)
 - [DaDaPushClient::Object::MessageObject](docs/MessageObject.md)
 - [DaDaPushClient::Object::MessagePushRequest](docs/MessagePushRequest.md)
 - [DaDaPushClient::Object::MessagePushResponse](docs/MessagePushResponse.md)
 - [DaDaPushClient::Object::PageResponseOfMessageObject](docs/PageResponseOfMessageObject.md)
 - [DaDaPushClient::Object::Result](docs/Result.md)
 - [DaDaPushClient::Object::ResultOfMessageObject](docs/ResultOfMessageObject.md)
 - [DaDaPushClient::Object::ResultOfMessagePushResponse](docs/ResultOfMessagePushResponse.md)
 - [DaDaPushClient::Object::ResultOfPageResponseOfMessageObject](docs/ResultOfPageResponseOfMessageObject.md)


# DOCUMENTATION FOR AUTHORIZATION
 All endpoints do not require authorization.

