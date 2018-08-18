#
# Cookbook:: digitalocean
# Spec:: digitalocean_helper
#

require 'spec_helper'

# Chef::Log.level = :warn

describe 'Digitalocean::Helper' do
  # Test the mixen when there is no run_context in the object.
  describe '#cookbook_in_context? in Class' do
    let(:dummy_class) { Class.new { include Digitalocean::Helper } }
    it 'return false when no run_context.cookbook_collection defined' do
      expect(dummy_class.new.cookbook_in_context?('splunk', '1.0.0')).to be false
    end
  end

  # Test with run_context object.
  describe '#cookbook_in_context? in Chef::RunContext' do
    # Wire up the cookbook collections from our test data.
    let(:chef_repo_path) { File.expand_path(File.join(File.dirname(__FILE__), '..', 'data', 'run_context', 'cookbooks')) }
    let(:cookbook_collection) do
      cl = Chef::CookbookLoader.new(chef_repo_path)
      cl.load_cookbooks
      Chef::CookbookCollection.new(cl)
    end

    # Create a RunContext object with our test collection cookbooks.
    let(:run_context) do
      node = Chef::Node.new
      Chef::RunContext.new(node, cookbook_collection, nil)
    end

    # Lets mixin the helper method to the RuncContext object.
    before do
      Chef::RunContext.send(:include, Digitalocean::Helper)
    end

    it 'validate run_context cookbook_collection == cookbook_collection' do
      expect(run_context.cookbook_collection).to eq(cookbook_collection)
    end

    it 'return true when cookbook/version match' do
      run_context.instance_variable_set(:@run_context, run_context)
      expect(run_context.cookbook_in_context?('splunk', '2.0.0')).to be true
    end

    it 'return false when check cookbook/version does not match' do
      run_context.instance_variable_set(:@run_context, run_context)
      expect(run_context.cookbook_in_context?('foo', 'bar')).to be false
    end
  end
end
