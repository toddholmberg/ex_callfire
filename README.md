# ExCallfire

ExCallfire is a micro wrapper intended to be
used for sending requests to CallFires's REST API. It's pretty much 
lifted directly from [Heresy's](https://github.com/heresydev) [Stripy](https://github.com/heresydev/stripy) package. Thanks, [Heresy](https://github.com/heresydev).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_callfire` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_callfire, "~> 0.1.0"}
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

