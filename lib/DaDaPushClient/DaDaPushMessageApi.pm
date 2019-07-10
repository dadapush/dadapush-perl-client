=begin comment

DaDaPush Public API

DaDaPush: Real-time Notifications App Send real-time notifications through our API without coding and maintaining your own app for iOS or Android devices.

The version of the OpenAPI document: v1
Contact: contacts@dadapush.com
Generated by: https://openapi-generator.tech

=end comment

=cut

#
# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# Do not edit the class manually.
# Ref: https://openapi-generator.tech
#
package DaDaPushClient::DaDaPushMessageApi;

require 5.6.0;
use strict;
use warnings;
use utf8; 
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use DaDaPushClient::ApiClient;

use base "Class::Data::Inheritable";

__PACKAGE__->mk_classdata('method_documentation' => {});

sub new {
    my $class = shift;
    my $api_client;

    if ($_[0] && ref $_[0] && ref $_[0] eq 'DaDaPushClient::ApiClient' ) {
        $api_client = $_[0];
    } else {
        $api_client = DaDaPushClient::ApiClient->new(@_);
    }

    bless { api_client => $api_client }, $class;

}


#
# create_message
#
# push Message to a Channel
# 
# @param MessagePushRequest $body body (required)
# @param string $x_channel_token see: https://www.dadapush.com/channel/list (optional)
{
    my $params = {
    'body' => {
        data_type => 'MessagePushRequest',
        description => 'body',
        required => '1',
    },
    'x_channel_token' => {
        data_type => 'string',
        description => 'see: https://www.dadapush.com/channel/list',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'create_message' } = { 
        summary => 'push Message to a Channel',
        params => $params,
        returns => 'ResultOfMessagePushResponse',
        };
}
# @return ResultOfMessagePushResponse
#
sub create_message {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling create_message");
    }

    # parse inputs
    my $_resource_path = '/api/v1/message';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # header params
    if ( exists $args{'x_channel_token'}) {
        $header_params->{'x-channel-token'} = $self->{api_client}->to_header_value($args{'x_channel_token'});
    }

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ResultOfMessagePushResponse', $response);
    return $_response_object;
}

#
# delete_message
#
# delete a Channel Message
# 
# @param int $message_id messageId (required)
# @param string $x_channel_token see: https://www.dadapush.com/channel/list (optional)
{
    my $params = {
    'message_id' => {
        data_type => 'int',
        description => 'messageId',
        required => '1',
    },
    'x_channel_token' => {
        data_type => 'string',
        description => 'see: https://www.dadapush.com/channel/list',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'delete_message' } = { 
        summary => 'delete a Channel Message',
        params => $params,
        returns => 'Result',
        };
}
# @return Result
#
sub delete_message {
    my ($self, %args) = @_;

    # verify the required parameter 'message_id' is set
    unless (exists $args{'message_id'}) {
      croak("Missing the required parameter 'message_id' when calling delete_message");
    }

    # parse inputs
    my $_resource_path = '/api/v1/message/{messageId}';

    my $_method = 'DELETE';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # header params
    if ( exists $args{'x_channel_token'}) {
        $header_params->{'x-channel-token'} = $self->{api_client}->to_header_value($args{'x_channel_token'});
    }

    # path params
    if ( exists $args{'message_id'}) {
        my $_base_variable = "{" . "messageId" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'message_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Result', $response);
    return $_response_object;
}

#
# get_message
#
# get a Channel Message
# 
# @param int $message_id messageId (required)
# @param string $x_channel_token see: https://www.dadapush.com/channel/list (optional)
{
    my $params = {
    'message_id' => {
        data_type => 'int',
        description => 'messageId',
        required => '1',
    },
    'x_channel_token' => {
        data_type => 'string',
        description => 'see: https://www.dadapush.com/channel/list',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_message' } = { 
        summary => 'get a Channel Message',
        params => $params,
        returns => 'ResultOfMessageObject',
        };
}
# @return ResultOfMessageObject
#
sub get_message {
    my ($self, %args) = @_;

    # verify the required parameter 'message_id' is set
    unless (exists $args{'message_id'}) {
      croak("Missing the required parameter 'message_id' when calling get_message");
    }

    # parse inputs
    my $_resource_path = '/api/v1/message/{messageId}';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # header params
    if ( exists $args{'x_channel_token'}) {
        $header_params->{'x-channel-token'} = $self->{api_client}->to_header_value($args{'x_channel_token'});
    }

    # path params
    if ( exists $args{'message_id'}) {
        my $_base_variable = "{" . "messageId" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'message_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ResultOfMessageObject', $response);
    return $_response_object;
}

#
# get_messages
#
# get Message List
# 
# @param int $page greater than 1 (required)
# @param int $page_size range is 1,50 (required)
# @param string $x_channel_token see: https://www.dadapush.com/channel/list (optional)
{
    my $params = {
    'page' => {
        data_type => 'int',
        description => 'greater than 1',
        required => '1',
    },
    'page_size' => {
        data_type => 'int',
        description => 'range is 1,50',
        required => '1',
    },
    'x_channel_token' => {
        data_type => 'string',
        description => 'see: https://www.dadapush.com/channel/list',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_messages' } = { 
        summary => 'get Message List',
        params => $params,
        returns => 'ResultOfPageResponseOfMessageObject',
        };
}
# @return ResultOfPageResponseOfMessageObject
#
sub get_messages {
    my ($self, %args) = @_;

    # verify the required parameter 'page' is set
    unless (exists $args{'page'}) {
      croak("Missing the required parameter 'page' when calling get_messages");
    }

    # verify the required parameter 'page_size' is set
    unless (exists $args{'page_size'}) {
      croak("Missing the required parameter 'page_size' when calling get_messages");
    }

    # parse inputs
    my $_resource_path = '/api/v1/messages';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'page'}) {
        $query_params->{'page'} = $self->{api_client}->to_query_value($args{'page'});
    }

    # query params
    if ( exists $args{'page_size'}) {
        $query_params->{'pageSize'} = $self->{api_client}->to_query_value($args{'page_size'});
    }

    # header params
    if ( exists $args{'x_channel_token'}) {
        $header_params->{'x-channel-token'} = $self->{api_client}->to_header_value($args{'x_channel_token'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ResultOfPageResponseOfMessageObject', $response);
    return $_response_object;
}

1;
