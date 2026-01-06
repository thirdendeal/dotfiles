# IRB Configuration Setup
# ------------------------------------------------------------------------------

def receiver_module(object)
  if object.is_a?(Module)
    object
  else
    object.class
  end
end

def nil_const(object, constant_symbol)
  receiver = receiver_module(object)

  if receiver.const_defined?(constant_symbol)
    receiver.send(
      :remove_const, constant_symbol
    )
  end

  receiver.const_set(constant_symbol, nil)
end

# Autocompletion
# ------------------------------------------------------------------------------

IRB.conf[:USE_AUTOCOMPLETE] = false

# Tab Documentation
# ------------------------------------------------------------------------------

# Warning-less version of: IRB::InputCompletor::PerfectMatchedProc = nil

nil_const(IRB::InputCompletor, :PerfectMatchedProc)

# ------------------------------------------------------------------------------

# IRB
#
# binding.irb

# IRB History
#
# Only writes to .irb_history with a ^d exit

# Measure
#
# measure :time
#
# ...
#
# measure :off

# ------------------------------------------------------------------------------

# RDBG
#
# require 'debug'
#
# ...
#
# binding.break

# ------------------------------------------------------------------------------

# require 'awesome_print'
# require 'methodfinder'

# Awesome Print
#
# ap(object)

# Method Finder
#
# [1 ,2, 3].find_method([3, 2, 1])
