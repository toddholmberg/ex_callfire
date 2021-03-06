# ExCallfire

ExCallfire is a micro wrapper intended to be
used for sending requests to [CallFire's](https://www.callfire.com/) [REST API](https://developers.callfire.com/docs.html). It's pretty much 
lifted directly from [Heresy's](https://github.com/heresydev) [Stripy](https://github.com/heresydev/stripy) package. Thanks, [Heresy](https://github.com/heresydev).

## Installation

```elixir
def deps do
  [
    {:ex_callfire, "~> 0.1.1"}
  ]
end
```

## Setup

Add "username" and "password" system variables. Obtain these via your CallFire dashboard.

```
export CALLFIRE_USERNAME=QWERTY12345
export CALLFIRE_PASSWORD=QWERTY12345
export CALLFIRE_ENDPOINT=https://api.callfire.com/v2/
```

## Usage Examples

### Get contacts
```
ExCallfire.req(:get, "contacts")
```

### Send a text
```
ExCallfire.req(:post, "texts", [%{"phoneNumber" => "2125551212", "message" => "Oh, Hai!"}])
```

### Delete an auto-reply
```
ExCallfire.req(:delete, "texts/auto-replys", "1234567890")
```

