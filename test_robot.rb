require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def setup
    @robot = Robot.new()
  end

  def teardown
    @robot = nil
  end

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    @robot.foreign_model = true
    @robot.needs_repairs = true

    # act
    station_result = @robot.station()

    # assert
    expected = 1
    assert_equal(expected,station_result)

  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    @robot.vintage_model = true
    @robot.needs_repairs = true

    # act
    station_result = @robot.station()

    # assert
    expected = 2
    assert_equal(expected , station_result)

  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    @robot.needs_repairs = true

    # act
    station_result = @robot.station()

    # assert
    expected = 3
    assert_equal(expected , station_result)

  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    @robot.needs_repairs = false

    # act
    station_result = @robot.station()

    # assert
    expected = 4
    assert_equal(expected , station_result)

  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    #already initialized in the setup method

    # act
    prioritize_tasks_result = @robot.todos

    # assert
    expected = []
    assert_equal(expected , prioritize_tasks_result)

  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    @robot.todos = [10,15,25,63,65,87,102]

    # act
    prioritize_tasks_result = @robot.prioritize_tasks

    # assert
    expected = 102
    assert_equal(expected , prioritize_tasks_result)

  end

  def test_workday_on_day_off_returns_false

    # arrange
    @robot.day_off = 'sunday'

    # act
    workday_result = @robot.workday?("sunday")

    # assert
    expected = false
    assert_equal(expected , workday_result)

  end

  def test_workday_not_day_off_returns_true

    # arrange
    @robot.day_off = 'sunday'

    # act
    workday_result = @robot.workday?("monday")

    # assert
    expected = true
    assert_equal(expected , workday_result)


  end

end
