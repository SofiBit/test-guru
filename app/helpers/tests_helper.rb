module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard}.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def admin_panel(current_user)
    return unless current_user.is_a?(Admin)

    link_to 'Admin panel', admin_tests_path
  end
end
