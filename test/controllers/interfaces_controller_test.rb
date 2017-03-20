require 'test_helper'

class InterfacesControllerTest < ActionController::TestCase
  ['managed', 'bmc', 'bond', 'bridge'].each do |type|
    test "#new with #{type} interface attributes should render form" do
      nic = FactoryGirl.build(:"nic_#{type}")
      get :new, params: { :host => { :interfaces_attributes => { "0" => nic.attributes } } }, session: set_session_user, xhr: true
      assert_response :success
      assert_not_nil assigns(:interface)
      assert_template 'nic/new'
      assert_template "nic/#{type}s/_#{type}"
    end
  end
end
