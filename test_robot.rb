require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    robot = Robot.new()
    robot.foreign_model = true
    robot.needs_repairs = true

    # act
    station_result = robot.station()

    # assert
    expected = 1
    assert_equal(expected,station_result)

  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    robot = Robot.new()
    robot.vintage_model = true
    robot.needs_repairs = true

    # act
    station_result = robot.station()

    # assert
    expected = 2
    assert_equal(expected , station_result)

  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    robot = Robot.new()
    robot.needs_repairs = true

    # act
    station_result = robot.station()

    # assert
    expected = 3
    assert_equal(expected , station_result)

  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    robot = Robot.new()
    robot.needs_repairs = false

    # act
    station_result = robot.station()

    # assert
    expected = 4
    assert_equal(expected , station_result)

  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    robot = Robot.new()

    # act
    prioritize_tasks_result = robot.todos

    # assert
    expected = []
    assert_equal(expected , prioritize_tasks_result)

  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    robot = Robot.new()
    robot.todos = [10,15,25,63,65,87,102]

    # act
    prioritize_tasks_result = robot.prioritize_tasks

    # assert
    expected = 102
    assert_equal(expected , prioritize_tasks_result)

  end

  def test_workday_on_day_off_returns_false
    skip
    # arrange

    # act

    # assert
  end

  def test_workday_not_day_off_returns_true
    skip
    # arrange

    # act

    # assert
  end

end
