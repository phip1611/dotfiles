{ toPretty }:

# Exports tracing funtionality.

let
  # Function that takes a value to trace and a expression to return. The
  # semantics is the same as for builtins.trace, but the traced value is
  # prettified before being printed.
  tracePretty = val: ret: (builtins.trace (toPretty { } val) ret);
  # Wraper around tracePretty that traces the given value and returns it.
  tracePrettyVal = val: tracePretty val val;
in
{
  inherit tracePretty;
  inherit tracePrettyVal;
}
