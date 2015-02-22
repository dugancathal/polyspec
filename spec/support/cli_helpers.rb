
module CliHelpers
  def polyspec(args={})
    binary_location = APP_ROOT.join('bin', 'polyspec')
    full_arg_list = convert_keys_to_switches(args)
    `#{environment_variables} ruby -Ilib #{binary_location} #{full_arg_list} 2>&1`
  end

  def convert_keys_to_switches(args)
    switched_args = args.map {|k, v| ["-#{k}", v] }
    switched_args.flatten.join(' ')
  end

  def environment_variables
    # Define me if you need to (e.g. GOPATH)
  end
end