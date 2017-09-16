require 'test_helper'

class FactValuesControllerTest < ActionController::TestCase
  def setup
    FactoryGirl.create(:fact_value)
    User.current = nil
  end

  def test_index
    get :index, session: set_session_user
    assert_response :success
    assert_template FactValue.unconfigured? ? 'welcome' : 'index'
    assert_not_nil :fact_values
  end

  test 'csv export works' do
    get :index, format: :csv, session: set_session_user
    assert_response :success
    assert_equal 2, response.body.lines.size
  end

  test 'user with viewer rights should succeed in viewing facts' do
    as_admin do
      users(:one).roles = [Role.default, Role.find_by_name('Viewer')]
    end
    get :index, session: set_session_user.merge(:user => users(:one).id)
    assert_response :success
  end

  def test_index_with_sort
    @request.env['HTTP_REFERER'] = fact_values_path
    get :index, params: {order: 'origin ASC'}, session: set_session_user
    assert_response :success
    assert_not_nil :fact_values
    get :index, params: {order: 'wrong ASC'}, session: set_session_user
    assert_response :redirect
  end
end
