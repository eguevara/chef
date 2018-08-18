module Digitalocean
  module Helper
    # cookbook_in_context is a helper method which
    # determines if the given cookbook
    # and version are included in the run_list context.
    # @example
    # if cookbook_in_context?("splunk", "1.0.0")
    # @param [String] coookbook_name Name of the cookbook to validate.
    # @param [String] cookbook_version Version of the cookbook to validate.
    # @return [TrueClass|FalseClass]
    def cookbook_in_context?(cookbook_name, cookbook_version)
      # Return false if there is no collection in context.
      return false unless defined?(@run_context.cookbook_collection)

      # hash of running cookbooks and versions.
      running_cookbooks = {}

      # Iterate through the list of cookbooks from the runlist.
      @run_context.cookbook_collection.each do |k, v|
        # Add key to map the cookbook and version that exists.
        running_cookbooks["#{k}"] = v.version
      end

      # Chef::Log.warn("#{running_cookbooks}")

      # Return true if the key exists in our hash and version matches.
      running_cookbooks.include?(cookbook_name) && running_cookbooks[cookbook_name] == cookbook_version
    end
  end
end 
